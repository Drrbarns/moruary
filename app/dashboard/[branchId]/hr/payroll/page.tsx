import { createClient } from '@/utils/supabase/server'
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import {
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from '@/components/ui/table'
import {
    Wallet,
    Plus,
    DollarSign,
    Users,
    TrendingUp,
    TrendingDown,
    FileText,
    Calendar,
    Eye,
    MoreHorizontal,
    CheckCircle,
    Clock,
    AlertCircle
} from 'lucide-react'
import Link from 'next/link'
import { format } from 'date-fns'
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu'
import CreatePayrollButton from '@/components/hr/create-payroll-button'

function formatCurrency(amount: number | null | undefined): string {
    if (amount === null || amount === undefined) return 'GH₵ 0.00'
    return `GH₵ ${amount.toLocaleString('en-GH', { minimumFractionDigits: 2, maximumFractionDigits: 2 })}`
}

export default async function PayrollPage({ params }: { params: Promise<{ branchId: string }> }) {
    const { branchId } = await params
    const supabase = await createClient()

    // Fetch payroll runs for this branch
    const { data: payrollRuns } = await supabase
        .from('payroll_runs')
        .select(`
            *,
            processed_by_profile:profiles!payroll_runs_processed_by_fkey(full_name)
        `)
        .eq('branch_id', branchId)
        .order('year', { ascending: false })
        .order('month', { ascending: false })
        .limit(12)

    // Fetch employee count for this branch
    const { data: assignments } = await supabase
        .from('user_branch_assignments')
        .select('user_id')
        .eq('branch_id', branchId)

    const employeeCount = assignments?.length || 0

    // Calculate totals
    const currentMonth = new Date().getMonth() + 1
    const currentYear = new Date().getFullYear()

    const currentMonthPayroll = payrollRuns?.find(p => p.month === currentMonth && p.year === currentYear)
    const lastMonthPayroll = payrollRuns?.find(p =>
        (currentMonth === 1 ? p.month === 12 && p.year === currentYear - 1 : p.month === currentMonth - 1 && p.year === currentYear)
    )

    const totalPaidThisYear = payrollRuns
        ?.filter(p => p.year === currentYear && p.status === 'PAID')
        .reduce((sum, p) => sum + (p.total_net || 0), 0) || 0

    const statusColors: Record<string, { bg: string, text: string, icon: any }> = {
        'DRAFT': { bg: 'bg-gray-100', text: 'text-gray-700', icon: FileText },
        'PROCESSING': { bg: 'bg-yellow-100', text: 'text-yellow-700', icon: Clock },
        'APPROVED': { bg: 'bg-blue-100', text: 'text-blue-700', icon: CheckCircle },
        'PAID': { bg: 'bg-green-100', text: 'text-green-700', icon: CheckCircle },
        'CANCELLED': { bg: 'bg-red-100', text: 'text-red-700', icon: AlertCircle },
    }

    const monthNames = [
        'January', 'February', 'March', 'April', 'May', 'June',
        'July', 'August', 'September', 'October', 'November', 'December'
    ]

    return (
        <div className="space-y-6">
            {/* Stats Row */}
            <div className="grid gap-4 md:grid-cols-4">
                <Card className="bg-gradient-to-br from-blue-600 to-blue-700 text-white border-0">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium opacity-90">Current Month</CardTitle>
                        <DollarSign className="h-5 w-5 opacity-80" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold">
                            {formatCurrency(currentMonthPayroll?.total_net)}
                        </div>
                        <p className="text-xs opacity-75 mt-1">
                            {currentMonthPayroll?.status || 'Not Processed'}
                        </p>
                    </CardContent>
                </Card>

                <Card className="bg-gradient-to-br from-blue-500 to-blue-600 text-white border-0">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium opacity-90">Total This Year</CardTitle>
                        <TrendingUp className="h-5 w-5 opacity-80" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold">{formatCurrency(totalPaidThisYear)}</div>
                        <p className="text-xs opacity-75 mt-1">Paid out in {currentYear}</p>
                    </CardContent>
                </Card>

                <Card className="bg-gradient-to-br from-blue-400 to-blue-500 text-white border-0">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium opacity-90">Employees</CardTitle>
                        <Users className="h-5 w-5 opacity-80" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold">{employeeCount}</div>
                        <p className="text-xs opacity-75 mt-1">On payroll</p>
                    </CardContent>
                </Card>

                <Card className="bg-gradient-to-br from-slate-600 to-slate-700 text-white border-0">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium opacity-90">Last Month</CardTitle>
                        <Calendar className="h-5 w-5 opacity-80" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold">
                            {formatCurrency(lastMonthPayroll?.total_net)}
                        </div>
                        <p className="text-xs opacity-75 mt-1">
                            {lastMonthPayroll?.status || 'N/A'}
                        </p>
                    </CardContent>
                </Card>
            </div>

            {/* Actions */}
            <div className="flex flex-col sm:flex-row gap-4 justify-between">
                <div className="flex gap-2">
                    <CreatePayrollButton branchId={branchId} />
                    <Link href={`/dashboard/${branchId}/hr/payroll/salary-structures`}>
                        <Button variant="outline">
                            <Wallet className="mr-2 h-4 w-4" />
                            Salary Structures
                        </Button>
                    </Link>
                </div>
            </div>

            {/* Payroll History */}
            <Card>
                <CardHeader>
                    <CardTitle>Payroll History</CardTitle>
                    <CardDescription>Monthly payroll runs and their status</CardDescription>
                </CardHeader>
                <CardContent className="p-0">
                    <Table>
                        <TableHeader>
                            <TableRow className="bg-slate-50">
                                <TableHead className="font-semibold">Period</TableHead>
                                <TableHead className="font-semibold">Employees</TableHead>
                                <TableHead className="font-semibold text-right">Gross Total</TableHead>
                                <TableHead className="font-semibold text-right">Deductions</TableHead>
                                <TableHead className="font-semibold text-right">Net Total</TableHead>
                                <TableHead className="font-semibold">Status</TableHead>
                                <TableHead className="font-semibold">Processed By</TableHead>
                                <TableHead className="w-[60px]"></TableHead>
                            </TableRow>
                        </TableHeader>
                        <TableBody>
                            {!payrollRuns || payrollRuns.length === 0 ? (
                                <TableRow>
                                    <TableCell colSpan={8} className="h-32 text-center">
                                        <div className="flex flex-col items-center justify-center text-muted-foreground">
                                            <Wallet className="h-8 w-8 mb-2 opacity-50" />
                                            <p>No payroll runs yet</p>
                                            <p className="text-sm">Create your first payroll run to get started</p>
                                        </div>
                                    </TableCell>
                                </TableRow>
                            ) : (
                                payrollRuns.map((payroll) => {
                                    const statusStyle = statusColors[payroll.status] || statusColors['DRAFT']
                                    const StatusIcon = statusStyle.icon

                                    return (
                                        <TableRow key={payroll.id} className="hover:bg-slate-50">
                                            <TableCell>
                                                <div className="font-medium">
                                                    {monthNames[payroll.month - 1]} {payroll.year}
                                                </div>
                                            </TableCell>
                                            <TableCell>
                                                <Badge variant="outline">{payroll.employee_count}</Badge>
                                            </TableCell>
                                            <TableCell className="text-right font-mono">
                                                {formatCurrency(payroll.total_gross)}
                                            </TableCell>
                                            <TableCell className="text-right font-mono text-red-600">
                                                -{formatCurrency(payroll.total_deductions)}
                                            </TableCell>
                                            <TableCell className="text-right font-mono font-semibold text-green-600">
                                                {formatCurrency(payroll.total_net)}
                                            </TableCell>
                                            <TableCell>
                                                <Badge className={`${statusStyle.bg} ${statusStyle.text} gap-1`}>
                                                    <StatusIcon className="h-3 w-3" />
                                                    {payroll.status}
                                                </Badge>
                                            </TableCell>
                                            <TableCell className="text-sm text-muted-foreground">
                                                {payroll.processed_by_profile?.full_name || '-'}
                                            </TableCell>
                                            <TableCell>
                                                <DropdownMenu>
                                                    <DropdownMenuTrigger asChild>
                                                        <Button variant="ghost" size="icon" className="h-8 w-8">
                                                            <MoreHorizontal className="h-4 w-4" />
                                                        </Button>
                                                    </DropdownMenuTrigger>
                                                    <DropdownMenuContent align="end">
                                                        <DropdownMenuItem asChild>
                                                            <Link href={`/dashboard/${branchId}/hr/payroll/${payroll.id}`}>
                                                                <Eye className="mr-2 h-4 w-4" />
                                                                View Details
                                                            </Link>
                                                        </DropdownMenuItem>
                                                    </DropdownMenuContent>
                                                </DropdownMenu>
                                            </TableCell>
                                        </TableRow>
                                    )
                                })
                            )}
                        </TableBody>
                    </Table>
                </CardContent>
            </Card>
        </div>
    )
}
