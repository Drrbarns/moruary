import { createClient } from '@/utils/supabase/server'
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from '@/components/ui/card'
import { Separator } from '@/components/ui/separator'
import {
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from '@/components/ui/table'
import { FileBarChart, TrendingUp, Users, DollarSign, Calendar, Wallet, CreditCard, Truck } from 'lucide-react'
import type { DeceasedCase, Payment } from '@/lib/types'
import { resolveBranch } from '@/lib/branch-resolver'
import { getRegistrationFee } from '@/lib/pricing'
import { notFound } from 'next/navigation'

export default async function ReportsPage({ params }: { params: Promise<{ branchId: string }> }) {
    const { branchId } = await params
    const supabase = await createClient()

    // Resolve branch from code or UUID
    const branch = await resolveBranch(branchId)
    if (!branch) notFound()

    // Get current month range
    const now = new Date()
    const startOfMonth = new Date(now.getFullYear(), now.getMonth(), 1).toISOString()
    const endOfMonth = new Date(now.getFullYear(), now.getMonth() + 1, 0).toISOString()

    // Fetch cases
    const { data: casesData } = await supabase
        .from('deceased_cases')
        .select('*')
        .eq('branch_id', branch.id)

    const cases = (casesData || []) as DeceasedCase[]

    // Fetch payments
    const { data: paymentsData } = await supabase
        .from('payments')
        .select('*')
        .eq('branch_id', branch.id)

    const payments = (paymentsData || []) as Payment[]

    // Calculate stats
    const activeCases = cases.filter(c => c.status === 'IN_CUSTODY').length
    const dischargedCases = cases.filter(c => c.status === 'DISCHARGED').length

    // Total Billed: Sum of Registration (350 or custom) + Coldroom Fees
    // We strictly exclude Embalming Fee (force 0) and ignore potentially dirty 'total_bill' column
    const totalBilled = cases.reduce((sum, c) => {
        const reg = c.registration_fee || getRegistrationFee(branch.name, branch.code)
        const cold = c.coldroom_fee || 0
        return sum + reg + cold
    }, 0)

    // Total Collected = Registration Fees (all cases) + Coldroom Fees (discharged only)
    // Same formula as Dashboard Total Revenue
    const totalCollected = cases.reduce((sum, c) => {
        const reg = c.registration_fee || getRegistrationFee(branch.name, branch.code)
        // Only add coldroom fee for discharged cases
        const cold = c.status === 'DISCHARGED' ? (c.coldroom_fee || 0) : 0
        return sum + reg + cold
    }, 0)

    // Outstanding = Billed - Collected
    // This provides a consistent view avoiding individual row discrepancies
    const totalOutstanding = Math.max(0, totalBilled - totalCollected)

    // Average Coldroom Fee
    const casesWithColdroom = cases.filter(c => (c.coldroom_fee || 0) > 0)
    const avgColdroomFee = casesWithColdroom.length > 0
        ? casesWithColdroom.reduce((sum, c) => sum + (c.coldroom_fee || 0), 0) / casesWithColdroom.length
        : 0

    // This month's revenue = Registration (admissions this month) + Coldroom (discharges this month)
    const monthCases = cases.filter(c => {
        const admDate = c.admission_date ? new Date(c.admission_date) : null
        const disDate = c.discharge_date ? new Date(c.discharge_date) : null
        const monthStart = new Date(startOfMonth)
        const monthEnd = new Date(endOfMonth)

        // Include if admitted this month OR discharged this month
        const admittedThisMonth = admDate && admDate >= monthStart && admDate <= monthEnd
        const dischargedThisMonth = disDate && disDate >= monthStart && disDate <= monthEnd
        return admittedThisMonth || dischargedThisMonth
    })

    const monthRevenue = monthCases.reduce((sum, c) => {
        const admDate = c.admission_date ? new Date(c.admission_date) : null
        const disDate = c.discharge_date ? new Date(c.discharge_date) : null
        const monthStart = new Date(startOfMonth)
        const monthEnd = new Date(endOfMonth)

        let amount = 0
        // Registration if admitted this month
        if (admDate && admDate >= monthStart && admDate <= monthEnd) {
            amount += (c.registration_fee || getRegistrationFee(branch.name, branch.code))
        }
        // Coldroom if discharged this month
        if (c.status === 'DISCHARGED' && disDate && disDate >= monthStart && disDate <= monthEnd) {
            amount += (c.coldroom_fee || 0)
        }
        return sum + amount
    }, 0)

    // Count of payments this month (for display)
    const monthPayments = payments.filter(p => {
        const paidDate = new Date(p.paid_on)
        return paidDate >= new Date(startOfMonth) && paidDate <= new Date(endOfMonth)
    })

    // Payment method breakdown
    // We attribute the calculated total revenue to CASH as per user request
    // This ignores legacy payment records to ensure consistency with Total Collected
    const methodBreakdown: Record<string, number> = {
        'CASH': totalCollected
    }

    // Total from all payments (for percentage calculation)
    const totalPayments = totalCollected

    // Allocation breakdown - calculated from cases, not payments
    // REGISTRATION = sum of registration fees (all cases)
    // COLDROOM = sum of coldroom fees (discharged cases only) - matches Total Billed
    const allocationBreakdown: Record<string, number> = {
        REGISTRATION: cases.reduce((sum, c) => sum + (c.registration_fee || 350), 0),
        COLDROOM: cases.filter(c => c.status === 'DISCHARGED').reduce((sum, c) => sum + (c.coldroom_fee || 0), 0),
    }

    // Average storage days
    const casesWithStorageDays = cases.filter(c => c.storage_days > 0)
    const avgStorageDays = casesWithStorageDays.length > 0
        ? Math.round(casesWithStorageDays.reduce((sum, c) => sum + c.storage_days, 0) / casesWithStorageDays.length)
        : 0

    // Total Ambulance Cost (from discharged cases) - tracked separately, not added to revenue
    const totalAmbulanceCost = cases
        .filter(c => c.status === 'DISCHARGED' && c.ambulance_cost)
        .reduce((sum, c) => sum + (c.ambulance_cost || 0), 0)

    return (
        <div className="space-y-6 p-8">
            {/* Header */}
            <div>
                <h1 className="text-3xl font-bold tracking-tight">Reports & Analytics</h1>
                <p className="text-muted-foreground">Branch performance overview</p>
            </div>

            {/* Key Metrics */}
            <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-5">
                <Card className="bg-gradient-to-br from-blue-50 to-blue-100 border-blue-200">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium text-blue-700">This Month&apos;s Revenue</CardTitle>
                        <Calendar className="h-4 w-4 text-blue-600" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold text-blue-800">GHS {monthRevenue.toFixed(2)}</div>
                        <p className="text-xs text-blue-600">{monthPayments.length} payments</p>
                    </CardContent>
                </Card>

                <Card className="bg-gradient-to-br from-green-50 to-green-100 border-green-200">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium text-green-700">Total Collected</CardTitle>
                        <TrendingUp className="h-4 w-4 text-green-600" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold text-green-800">GHS {totalCollected.toFixed(2)}</div>
                        <p className="text-xs text-green-600">All time</p>
                    </CardContent>
                </Card>

                <Card className="bg-gradient-to-br from-red-50 to-red-100 border-red-200">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium text-red-700">Avg Coldroom Fee</CardTitle>
                        <DollarSign className="h-4 w-4 text-red-600" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold text-red-800">GHS {avgColdroomFee.toFixed(2)}</div>
                        <p className="text-xs text-red-600">Per case</p>
                    </CardContent>
                </Card>

                <Card className="bg-gradient-to-br from-purple-50 to-purple-100 border-purple-200">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium text-purple-700">Avg Storage Days</CardTitle>
                        <FileBarChart className="h-4 w-4 text-purple-600" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold text-purple-800">{avgStorageDays} days</div>
                        <p className="text-xs text-purple-600">Per case</p>
                    </CardContent>
                </Card>

                <Card className="bg-gradient-to-br from-orange-50 to-orange-100 border-orange-200">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium text-orange-700">Ambulance Cost</CardTitle>
                        <Truck className="h-4 w-4 text-orange-600" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold text-orange-800">GHS {totalAmbulanceCost.toFixed(2)}</div>
                        <p className="text-xs text-orange-600">Total cost (Separate)</p>
                    </CardContent>
                </Card>
            </div>

            {/* Case Statistics */}
            <div className="grid gap-6 lg:grid-cols-2">
                <Card>
                    <CardHeader>
                        <CardTitle className="flex items-center gap-2">
                            <Users className="h-5 w-5 text-blue-600" />
                            Case Statistics
                        </CardTitle>
                        <CardDescription>Overview of all cases</CardDescription>
                    </CardHeader>
                    <CardContent>
                        <div className="space-y-4">
                            <div className="flex justify-between items-center">
                                <span className="text-muted-foreground">Total Cases</span>
                                <span className="font-bold">{cases.length}</span>
                            </div>
                            <Separator />
                            <div className="flex justify-between items-center">
                                <span className="text-muted-foreground">Active (In Custody)</span>
                                <span className="font-bold text-blue-600">{activeCases}</span>
                            </div>
                            <div className="flex justify-between items-center">
                                <span className="text-muted-foreground">Discharged</span>
                                <span className="font-bold text-green-600">{dischargedCases}</span>
                            </div>
                            <Separator />
                            <div className="flex justify-between items-center">
                                <span className="text-muted-foreground">Total Billed</span>
                                <span className="font-bold">GHS {totalBilled.toFixed(2)}</span>
                            </div>
                        </div>
                    </CardContent>
                </Card>

                <Card>
                    <CardHeader>
                        <CardTitle className="flex items-center gap-2">
                            <Wallet className="h-5 w-5 text-green-600" />
                            Payment Methods
                        </CardTitle>
                        <CardDescription>Breakdown by payment type</CardDescription>
                    </CardHeader>
                    <CardContent>
                        <Table>
                            <TableHeader>
                                <TableRow>
                                    <TableHead>Method</TableHead>
                                    <TableHead className="text-right">Amount (GHS)</TableHead>
                                    <TableHead className="text-right">%</TableHead>
                                </TableRow>
                            </TableHeader>
                            <TableBody>
                                {Object.entries(methodBreakdown).map(([method, amount]) => (
                                    <TableRow key={method}>
                                        <TableCell className="font-medium">{method}</TableCell>
                                        <TableCell className="text-right">{amount.toFixed(2)}</TableCell>
                                        <TableCell className="text-right text-muted-foreground">
                                            {totalPayments > 0 ? ((amount / totalPayments) * 100).toFixed(1) : 0}%
                                        </TableCell>
                                    </TableRow>
                                ))}
                                {Object.keys(methodBreakdown).length === 0 && (
                                    <TableRow>
                                        <TableCell colSpan={3} className="text-center text-muted-foreground">
                                            No data available
                                        </TableCell>
                                    </TableRow>
                                )}
                            </TableBody>
                        </Table>
                    </CardContent>
                </Card>
            </div>

            {/* Allocation Breakdown */}
            <Card>
                <CardHeader>
                    <CardTitle className="flex items-center gap-2">
                        <CreditCard className="h-5 w-5 text-amber-600" />
                        Revenue by Allocation
                    </CardTitle>
                    <CardDescription>Revenue breakdown by fee type</CardDescription>
                </CardHeader>
                <CardContent>
                    <div className="grid gap-4 md:grid-cols-2">
                        {['REGISTRATION', 'COLDROOM'].map((allocation) => (
                            <div key={allocation} className="text-center p-4 bg-slate-50 dark:bg-slate-800 rounded-lg">
                                <p className="text-sm text-muted-foreground">{allocation}</p>
                                <p className="text-xl font-bold mt-1">GHS {(allocationBreakdown[allocation] || 0).toFixed(2)}</p>
                            </div>
                        ))}
                    </div>
                </CardContent>
            </Card>
        </div>
    )
}
