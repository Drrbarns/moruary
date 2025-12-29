import { createClient } from "@/utils/supabase/server";
import { DemographicsCharts } from "@/components/dashboard/demographics-charts";
import { PlacesStats } from "@/components/dashboard/places-stats";
import { Badge } from "@/components/ui/badge";
import Link from 'next/link';
import { resolveBranch } from "@/lib/branch-resolver";
import { notFound } from "next/navigation";
import { DashboardDateFilter } from "@/components/dashboard/date-filter";

export default async function DashboardPage({
    params,
    searchParams
}: {
    params: Promise<{ branchId: string }>
    searchParams: Promise<{ period?: string }>
}) {
    const { branchId: rawBranchId } = await params
    const { period: rawPeriod } = await searchParams
    const period = rawPeriod || 'month'
    const branch = await resolveBranch(rawBranchId)

    if (!branch) {
        notFound()
    }

    const branchId = branch.id // Use the UUID for database queries
    const supabase = await createClient()

    // Check Role
    const { data: { user } } = await supabase.auth.getUser()
    let isStaff = true
    if (user) {
        const { data: profile } = await supabase.from('profiles').select('role').eq('id', user.id).single()
        if (profile && profile.role !== 'staff') {
            isStaff = false
        }
    }

    // Date Logic
    const now = new Date()
    let rangeStart: string | undefined
    let rangeLabel = 'Month'
    let comparisonStart: string | undefined
    let comparisonEnd: string | undefined

    if (period === 'year') {
        rangeStart = new Date(now.getFullYear(), 0, 1).toISOString().split('T')[0]
        rangeLabel = 'Year'
        comparisonStart = new Date(now.getFullYear() - 1, 0, 1).toISOString().split('T')[0]
        comparisonEnd = new Date(now.getFullYear() - 1, 11, 31).toISOString().split('T')[0]
    } else if (period === 'all') {
        rangeStart = undefined // No lower bound
        rangeLabel = 'All Time'
    } else {
        // Month (Default)
        rangeStart = new Date(now.getFullYear(), now.getMonth(), 1).toISOString().split('T')[0]
        rangeLabel = 'Month'
        comparisonStart = new Date(now.getFullYear(), now.getMonth() - 1, 1).toISOString().split('T')[0]
        comparisonEnd = new Date(now.getFullYear(), now.getMonth(), 0).toISOString().split('T')[0]
    }

    // Prepare Queries
    let qDischarges = supabase
        .from('deceased_cases')
        .select('*', { count: 'exact', head: true })
        .eq('branch_id', branchId)
        .eq('status', 'DISCHARGED')

    if (rangeStart) {
        qDischarges = qDischarges.gte('discharge_date', rangeStart)
    }

    // Active Cases (Always current snapshot)
    const qActive = supabase
        .from('deceased_cases')
        .select('*', { count: 'exact', head: true })
        .eq('branch_id', branchId)
        .eq('status', 'IN_CUSTODY')

    let qAdmissions = supabase
        .from('deceased_cases')
        .select('*', { count: 'exact', head: true })
        .eq('branch_id', branchId)

    // For admissions, we want total admissions in the period
    if (rangeStart) {
        qAdmissions = qAdmissions.gte('admission_date', rangeStart)
    }

    // Demographics Data (Gender, Age, Type, Place)
    // Uses the same time filter as admissions to reflect the period's data
    let qDemographics = supabase
        .from('deceased_cases')
        .select('gender, age, type, place')
        .eq('branch_id', branchId)

    if (rangeStart) {
        qDemographics = qDemographics.gte('admission_date', rangeStart)
    }

    // Revenue: Fetch all cases to calculate Registration + Coldroom fees
    // Registration fees = from ALL cases (paid at admission)
    // Coldroom fees = only from DISCHARGED cases (finalized storage)
    let qAllCases = supabase
        .from('deceased_cases')
        .select('registration_fee, coldroom_fee, status, admission_date, discharge_date')
        .eq('branch_id', branchId)

    // Apply date filter for admissions (registration fees)
    // and for discharges (coldroom fees)
    // We'll filter in JS for more flexibility

    // Execute Queries
    const [
        { count: dischargeCount },
        { count: activeCasesCount },
        { count: newAdmissionsCount },
        { data: allCasesData },
        { data: demographicsData },
        { data: recentAdmissions }
    ] = await Promise.all([
        qDischarges,
        qActive,
        qAdmissions,
        qAllCases,
        qDemographics,
        // Recent Admissions (Last 5)
        supabase
            .from('deceased_cases')
            .select('id, tag_no, name_of_deceased, age, gender, admission_date, status, place')
            .eq('branch_id', branchId)
            .order('admission_date', { ascending: false })
            .limit(5)
    ])

    // Calculate Total Revenue = Registration Fees (all cases) + Coldroom Fees (discharged only)
    let totalRevenue = 0
    let previousRevenue = 0

    allCasesData?.forEach(c => {
        const admissionDate = c.admission_date ? new Date(c.admission_date) : null
        const dischargeDate = c.discharge_date ? new Date(c.discharge_date) : null
        const rangeStartDate = rangeStart ? new Date(rangeStart) : null
        const comparisonStartDate = comparisonStart ? new Date(comparisonStart) : null
        const comparisonEndDate = comparisonEnd ? new Date(comparisonEnd) : null

        // Registration Fee: Count if admission is in the period (or all time if no filter)
        if (!rangeStartDate || (admissionDate && admissionDate >= rangeStartDate)) {
            totalRevenue += (c.registration_fee || 350)
        }

        // Coldroom Fee: Only for DISCHARGED cases, if discharge is in period
        if (c.status === 'DISCHARGED') {
            if (!rangeStartDate || (dischargeDate && dischargeDate >= rangeStartDate)) {
                totalRevenue += (c.coldroom_fee || 0)
            }
        }

        // Previous period comparison (for month/year views)
        if (comparisonStartDate && comparisonEndDate) {
            // Registration in previous period
            if (admissionDate && admissionDate >= comparisonStartDate && admissionDate <= comparisonEndDate) {
                previousRevenue += (c.registration_fee || 350)
            }
            // Coldroom in previous period (discharged cases only)
            if (c.status === 'DISCHARGED' && dischargeDate &&
                dischargeDate >= comparisonStartDate && dischargeDate <= comparisonEndDate) {
                previousRevenue += (c.coldroom_fee || 0)
            }
        }
    })

    // Calculate percentage change
    let revenueChange = 0
    if (period !== 'all' && previousRevenue > 0) {
        revenueChange = Math.round(((totalRevenue - previousRevenue) / previousRevenue) * 100)
    } else if (period !== 'all' && totalRevenue > 0 && previousRevenue === 0) {
        revenueChange = 100
    }

    // Process Chart Data
    const genderStats = { Male: 0, Female: 0, Other: 0 }
    const ageStats = { Under60: 0, Over60: 0 }
    const typeStats = { Normal: 0, VIP: 0 }
    const placeStats: Record<string, number> = {}

    demographicsData?.forEach(c => {
        // Gender
        if (c.gender === 'Male') genderStats.Male++
        else if (c.gender === 'Female') genderStats.Female++
        else genderStats.Other++

        // Age
        if ((c.age || 0) < 60) ageStats.Under60++
        else ageStats.Over60++

        // Type
        if (c.type === 'VIP') typeStats.VIP++
        else typeStats.Normal++

        // Place
        const place = c.place || 'Unknown'
        placeStats[place] = (placeStats[place] || 0) + 1
    })

    const placesData = Object.entries(placeStats)
        .map(([place, count]) => ({ place, count }))
        .sort((a, b) => b.count - a.count)
        .slice(0, 10)

    const chartData = {
        gender: [
            { name: 'Male', value: genderStats.Male, color: '#3b82f6' },
            { name: 'Female', value: genderStats.Female, color: '#ec4899' },
            ...(genderStats.Other > 0 ? [{ name: 'Other', value: genderStats.Other, color: '#94a3b8' }] : [])
        ],
        age: [
            { name: 'Under 60', value: ageStats.Under60, color: '#22c55e' },
            { name: '60 & Over', value: ageStats.Over60, color: '#f97316' }
        ],
        type: [
            { name: 'Normal', value: typeStats.Normal, color: '#64748b' },
            { name: 'VIP', value: typeStats.VIP, color: '#eab308' }
        ]
    }

    return (
        <div className="space-y-6 p-8">
            <div className="flex items-center justify-between">
                <h1 className="text-3xl font-bold tracking-tight">Dashboard Overview</h1>
                <div className="flex items-center space-x-4">
                    <DashboardDateFilter />
                    <span className="text-sm text-gray-500">Last updated: Just now</span>
                </div>
            </div>

            <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
                {!isStaff && (
                    <div className="p-6 bg-white dark:bg-gray-800 rounded-xl shadow-sm border border-gray-100 dark:border-gray-700">
                        <h3 className="text-sm font-medium text-muted-foreground">Total Revenue ({rangeLabel})</h3>
                        <div className="text-2xl font-bold mt-2 text-gray-900 dark:text-white">
                            GHS {totalRevenue.toLocaleString('en-GH', { minimumFractionDigits: 2 })}
                        </div>
                        {period !== 'all' && (
                            <p className={`text-xs mt-1 ${revenueChange >= 0 ? 'text-green-600' : 'text-red-600'}`}>
                                {revenueChange >= 0 ? '+' : ''}{revenueChange}% from last {period === 'year' ? 'year' : 'month'}
                            </p>
                        )}
                    </div>
                )}
                <div className="p-6 bg-white dark:bg-gray-800 rounded-xl shadow-sm border border-gray-100 dark:border-gray-700">
                    <h3 className="text-sm font-medium text-muted-foreground">Active Cases</h3>
                    <div className="text-2xl font-bold mt-2 text-gray-900 dark:text-white">{activeCasesCount || 0}</div>
                    <p className="text-xs text-muted-foreground mt-1">Currently in custody</p>
                </div>
                <div className="p-6 bg-white dark:bg-gray-800 rounded-xl shadow-sm border border-gray-100 dark:border-gray-700">
                    <h3 className="text-sm font-medium text-muted-foreground">New Admissions</h3>
                    <div className="text-2xl font-bold mt-2 text-gray-900 dark:text-white">{newAdmissionsCount || 0}</div>
                    <p className="text-xs text-muted-foreground mt-1">
                        {period === 'month' ? 'This month' : period === 'year' ? 'This year' : 'All time'}
                    </p>
                </div>
                <div className="p-6 bg-white dark:bg-gray-800 rounded-xl shadow-sm border border-gray-100 dark:border-gray-700">
                    <h3 className="text-sm font-medium text-muted-foreground">Discharges</h3>
                    <div className="text-2xl font-bold mt-2 text-gray-900 dark:text-white">{dischargeCount || 0}</div>
                    <p className="text-xs text-muted-foreground mt-1">
                        {period === 'month' ? 'Processed this month' : period === 'year' ? 'Processed this year' : 'All time'}
                    </p>
                </div>
            </div>

            <DemographicsCharts data={chartData} />

            <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-7">
                <div className="col-span-4 bg-white dark:bg-gray-800 rounded-xl shadow-sm border p-6">
                    <h3 className="font-semibold mb-4">Recent Admissions</h3>
                    {recentAdmissions && recentAdmissions.length > 0 ? (
                        <div className="space-y-3">
                            {recentAdmissions.map((admission: any) => (
                                <Link
                                    key={admission.id}
                                    href={`/dashboard/${branchId}/cases/${admission.id}`}
                                    className="flex items-center justify-between p-3 hover:bg-gray-50 dark:hover:bg-gray-700 rounded-lg transition-colors border border-gray-100 dark:border-gray-700"
                                >
                                    <div className="flex-1">
                                        <div className="flex items-center gap-2">
                                            <span className="font-mono text-sm font-medium text-blue-600">{admission.tag_no}</span>
                                            <Badge variant="outline" className={
                                                admission.status === 'IN_CUSTODY' ? 'bg-blue-50 text-blue-700 border-blue-200' :
                                                    admission.status === 'DISCHARGED' ? 'bg-green-50 text-green-700 border-green-200' :
                                                        'bg-gray-50 text-gray-700 border-gray-200'
                                            }>
                                                {admission.status === 'IN_CUSTODY' ? 'In Custody' :
                                                    admission.status === 'DISCHARGED' ? 'Discharged' : admission.status}
                                            </Badge>
                                        </div>
                                        <p className="font-medium text-sm mt-1">{admission.name_of_deceased}</p>
                                        <div className="flex gap-4 text-xs text-muted-foreground mt-1">
                                            <span>{admission.age ? `${admission.age} yrs` : 'N/A'} • {admission.gender || 'N/A'}</span>
                                            <span>•</span>
                                            <span>{admission.place || 'Unknown'}</span>
                                        </div>
                                    </div>
                                    <div className="text-right text-xs text-muted-foreground">
                                        {admission.admission_date ? new Date(admission.admission_date).toLocaleDateString() : 'N/A'}
                                    </div>
                                </Link>
                            ))}
                        </div>
                    ) : (
                        <div className="h-[200px] flex items-center justify-center text-muted-foreground border-dashed border-2 rounded-lg">
                            No recent admissions
                        </div>
                    )}
                </div>
                <div className="col-span-3">
                    <PlacesStats data={placesData} />
                </div>
            </div>
        </div>
    )
}
