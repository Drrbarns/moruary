import { createClient } from "@/utils/supabase/server";
import { DemographicsCharts } from "@/components/dashboard/demographics-charts";
import { PlacesStats } from "@/components/dashboard/places-stats";

export default async function DashboardPage({ params }: { params: Promise<{ branchId: string }> }) {
    const { branchId } = await params
    const supabase = await createClient()


    // Get start of current month
    const now = new Date()
    const startOfMonth = new Date(now.getFullYear(), now.getMonth(), 1).toISOString().split('T')[0]

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
        { data: activeCasesData }
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
            .select('amount')
            .eq('branch_id', branchId)
            .gte('paid_on', startOfMonth) : Promise.resolve({ data: [] }),

        // Active Cases Data for Charts (Gender, Age, Type, Place)
        supabase
            .from('deceased_cases')
            .select('gender, age, type, place')
            .eq('branch_id', branchId)
            .eq('status', 'IN_CUSTODY')
    ])

    const totalRevenue = revenueData?.reduce((sum, payment) => sum + (payment.amount || 0), 0) || 0

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
                        <p className="text-xs text-muted-foreground mt-1">+0% from last month</p>
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
                    <div className="h-[200px] flex items-center justify-center text-muted-foreground border-dashed border-2 rounded-lg">
                        No recent activity
                    </div>
                </div>
                <div className="col-span-3">
                    <PlacesStats data={placesData} />
                </div>
            </div>
        </div>
    )
}
