export default async function DashboardPage({ params }: { params: Promise<{ branchId: string }> }) {
    const { branchId } = await params

    return (
        <div className="space-y-6 p-8">
            <div className="flex items-center justify-between">
                <h1 className="text-3xl font-bold tracking-tight">Dashboard Overview</h1>
                <div className="flex items-center space-x-2">
                    <span className="text-sm text-gray-500">Last updated: Just now</span>
                </div>
            </div>

            <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
                <div className="p-6 bg-white dark:bg-gray-800 rounded-xl shadow-sm border border-gray-100 dark:border-gray-700">
                    <h3 className="text-sm font-medium text-muted-foreground">Total Revenue (Month)</h3>
                    <div className="text-2xl font-bold mt-2 text-gray-900 dark:text-white">GHS 0.00</div>
                    <p className="text-xs text-muted-foreground mt-1">+0% from last month</p>
                </div>
                <div className="p-6 bg-white dark:bg-gray-800 rounded-xl shadow-sm border border-gray-100 dark:border-gray-700">
                    <h3 className="text-sm font-medium text-muted-foreground">Active Cases</h3>
                    <div className="text-2xl font-bold mt-2 text-gray-900 dark:text-white">0</div>
                    <p className="text-xs text-muted-foreground mt-1">Currently in custody</p>
                </div>
                <div className="p-6 bg-white dark:bg-gray-800 rounded-xl shadow-sm border border-gray-100 dark:border-gray-700">
                    <h3 className="text-sm font-medium text-muted-foreground">New Admissions</h3>
                    <div className="text-2xl font-bold mt-2 text-gray-900 dark:text-white">0</div>
                    <p className="text-xs text-muted-foreground mt-1">This month</p>
                </div>
                <div className="p-6 bg-white dark:bg-gray-800 rounded-xl shadow-sm border border-gray-100 dark:border-gray-700">
                    <h3 className="text-sm font-medium text-muted-foreground">Outstanding Debt</h3>
                    <div className="text-2xl font-bold mt-2 text-red-600">GHS 0.00</div>
                    <p className="text-xs text-muted-foreground mt-1">Unpaid balances</p>
                </div>
            </div>

            <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-7">
                <div className="col-span-4 bg-white dark:bg-gray-800 rounded-xl shadow-sm border p-6">
                    <h3 className="font-semibold mb-4">Recent Admissions</h3>
                    <div className="h-[200px] flex items-center justify-center text-muted-foreground border-dashed border-2 rounded-lg">
                        No recent activity
                    </div>
                </div>
                <div className="col-span-3 bg-white dark:bg-gray-800 rounded-xl shadow-sm border p-6">
                    <h3 className="font-semibold mb-4">Revenue Breakdown</h3>
                    <div className="h-[200px] flex items-center justify-center text-muted-foreground border-dashed border-2 rounded-lg">
                        No data available
                    </div>
                </div>
            </div>
        </div>
    )
}
