import { createClient } from "@/utils/supabase/server";
import { DemographicsCharts } from "@/components/dashboard/demographics-charts";
import { PlacesStats } from "@/components/dashboard/places-stats";
import { Badge } from "@/components/ui/badge";
import Link from 'next/link';
import { resolveBranch } from "@/lib/branch-resolver";
import { notFound } from "next/navigation";


export default async function DashboardPage({ params }: { params: Promise<{ branchId: string }> }) {
    const { branchId: rawBranchId } = await params
    const branch = await resolveBranch(rawBranchId)

    if (!branch) {
        notFound()
    }

    const branchId = branch.id // Use the UUID for database queries
    const supabase = await createClient()


    // Get start of current month and last month
    const now = new Date()
    const startOfMonth = new Date(now.getFullYear(), now.getMonth(), 1).toISOString().split('T')[0]
    const startOfLastMonth = new Date(now.getFullYear(), now.getMonth() - 1, 1).toISOString().split('T')[0]
    const endOfLastMonth = new Date(now.getFullYear(), now.getMonth(), 0).toISOString().split('T')[0]

    // Check Role
    const { data: { user } } = await supabase.auth.getUser()
    let isStaff = true
    if (user) {
        const { data: profile } = await supabase.from('profiles').select('role').eq('id', user.id).single()
        if (profile && profile.role !== 'staff') {
            isStaff = false
        }
    }

    const [
        { count: dischargeCount },
        { count: activeCasesCount },
        { count: newAdmissionsCount },
        { data: revenueData },
        { data: lastMonthRevenueData },
        { data: activeCasesData },
        { data: recentAdmissions }
    ] = await Promise.all([
        // Discharges this month
        supabase
            .from('deceased_cases')
            .select('*', { count: 'exact', head: true })
            .eq('branch_id', branchId)
            .eq('status', 'DISCHARGED')
            .gte('discharge_date', startOfMonth),

        // Active Cases (In Custody)
        supabase
            .from('deceased_cases')
            .select('*', { count: 'exact', head: true })
            .eq('branch_id', branchId)
            .eq('status', 'IN_CUSTODY'),

        // New Admissions this month
        supabase
            .from('deceased_cases')
            .select('*', { count: 'exact', head: true })
            .eq('branch_id', branchId)
            .gte('admission_date', startOfMonth),

        // Revenue this month (Mask for staff)
        !isStaff ? supabase
            .from('payments')
            .select('amount, allocation')
            .eq('branch_id', branchId)
            .gte('paid_on', startOfMonth) : Promise.resolve({ data: [] }),

        // Revenue last month (for comparison)
        !isStaff ? supabase
            .from('payments')
            .select('amount, allocation')
            .eq('branch_id', branchId)
            .gte('paid_on', startOfLastMonth)
            .lte('paid_on', endOfLastMonth) : Promise.resolve({ data: [] }),

        // Active Cases Data for Charts (Gender, Age, Type, Place)
        supabase
            .from('deceased_cases')
            .select('gender, age, type, place')
            .eq('branch_id', branchId)
            .eq('status', 'IN_CUSTODY'),

        // Recent Admissions (last 5)
        supabase
            .from('deceased_cases')
            .select('id, tag_no, name_of_deceased, age, gender, admission_date, status, place')
            .eq('branch_id', branchId)
            .order('admission_date', { ascending: false })
            .limit(5)
    ])

    const totalRevenue = revenueData?.reduce((sum, payment) => {
        if (payment.allocation === 'EMBALMING') return sum
        return sum + (payment.amount || 0)
    }, 0) || 0

    const lastMonthRevenue = lastMonthRevenueData?.reduce((sum, payment) => {
        if (payment.allocation === 'EMBALMING') return sum
        return sum + (payment.amount || 0)
    }, 0) || 0

    // Calculate percentage change
    const revenueChange = lastMonthRevenue > 0
        ? Math.round(((totalRevenue - lastMonthRevenue) / lastMonthRevenue) * 100)
        : (totalRevenue > 0 ? 100 : 0)

    // Process Chart Data
    const genderStats = { Male: 0, Female: 0, Other: 0 }
    const ageStats = { Under60: 0, Over60: 0 }
    const typeStats = { Normal: 0, VIP: 0 }
    const placeStats: Record<string, number> = {}

    activeCasesData?.forEach(c => {
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
                <div className="flex items-center space-x-2">
                    <span className="text-sm text-gray-500">Last updated: Just now</span>
                </div>
            </div>

            <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
                {!isStaff && (
                    <div className="p-6 bg-white dark:bg-gray-800 rounded-xl shadow-sm border border-gray-100 dark:border-gray-700">
                        <h3 className="text-sm font-medium text-muted-foreground">Total Revenue (Month)</h3>
                        <div className="text-2xl font-bold mt-2 text-gray-900 dark:text-white">
                            GHS {totalRevenue.toLocaleString('en-GH', { minimumFractionDigits: 2 })}
                        </div>
                        <p className={`text-xs mt-1 ${revenueChange >= 0 ? 'text-green-600' : 'text-red-600'}`}>
                            {revenueChange >= 0 ? '+' : ''}{revenueChange}% from last month
                        </p>
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
                    <p className="text-xs text-muted-foreground mt-1">This month</p>
                </div>
                <div className="p-6 bg-white dark:bg-gray-800 rounded-xl shadow-sm border border-gray-100 dark:border-gray-700">
                    <h3 className="text-sm font-medium text-muted-foreground">Discharges for the month</h3>
                    <div className="text-2xl font-bold mt-2 text-gray-900 dark:text-white">{dischargeCount || 0}</div>
                    <p className="text-xs text-muted-foreground mt-1">Processed this month</p>
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
