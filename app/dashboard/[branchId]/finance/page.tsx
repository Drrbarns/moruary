import Link from 'next/link'
import { createClient } from '@/utils/supabase/server'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import {
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from '@/components/ui/table'
import { Input } from '@/components/ui/input'
import { Wallet, TrendingUp, CreditCard, Search, Filter, DollarSign, Calendar, FileText, Snowflake, MinusCircle } from 'lucide-react'
import type { Payment, DeceasedCase, BankTransaction, Expense } from '@/lib/types'
import { AddPaymentDialog } from '@/components/finance/add-payment-dialog'
import { AddBankTransactionDialog } from '@/components/finance/add-bank-transaction-dialog'
import { AddExpenseDialog } from '@/components/finance/add-expense-dialog'
import { DeleteExpenseButton } from '@/components/finance/delete-expense-button'
import { Toaster } from '@/components/ui/sonner'
import { resolveBranch } from '@/lib/branch-resolver'
import { notFound } from 'next/navigation'
import { PRICING, getRegistrationFee } from '@/lib/pricing'

const methodColors: Record<string, string> = {
    CASH: 'bg-green-100 text-green-800',
    MOMO: 'bg-yellow-100 text-yellow-800',
    BANK: 'bg-blue-100 text-blue-800',
    CARD: 'bg-purple-100 text-purple-800',
}

const expenseCategoryColors: Record<string, string> = {
    UTILITIES: 'bg-blue-100 text-blue-800',
    SUPPLIES: 'bg-purple-100 text-purple-800',
    MAINTENANCE: 'bg-orange-100 text-orange-800',
    SALARY: 'bg-green-100 text-green-800',
    TRANSPORT: 'bg-yellow-100 text-yellow-800',
    FUEL: 'bg-red-100 text-red-800',
    OTHER: 'bg-gray-100 text-gray-800',
}

export default async function FinancePage({
    params,
    searchParams
}: {
    params: Promise<{ branchId: string }>
    searchParams: Promise<{ case?: string }>
}) {
    const { branchId } = await params
    const { case: preselectedCaseId } = await searchParams
    const supabase = await createClient()

    // Resolve branch from code or UUID
    const branch = await resolveBranch(branchId)
    if (!branch) notFound()

    // Check Role
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) return notFound()

    const { data: profile } = await supabase.from('profiles').select('role').eq('id', user.id).single()
    if (profile?.role === 'staff') {
        return (
            <div className="p-8">
                <h1 className="text-2xl font-bold text-red-600">Access Denied</h1>
                <p>You do not have permission to view this page.</p>
            </div>
        )
    }

    // Fetch recent payments for the table
    const { data: paymentsData } = await supabase
        .from('payments')
        .select('*, case:deceased_cases(tag_no, name_of_deceased)')
        .eq('branch_id', branch.id)
        .order('paid_on', { ascending: false })
        .limit(50)

    const payments = (paymentsData || []) as (Payment & { case: { tag_no: string, name_of_deceased: string } | null })[]

    // Fetch ALL payments for statistics (Today's revenue needs valid cash flow check)
    const { data: allPaymentsData } = await supabase
        .from('payments')
        .select('amount, allocation, paid_on')
        .eq('branch_id', branch.id)

    const allPayments = allPaymentsData || []

    // Fetch All Cases for Total Billed stats
    const { data: allCasesData } = await supabase
        .from('deceased_cases')
        .select('id, total_bill, coldroom_fee, status, registration_fee')
        .eq('branch_id', branch.id)

    const allCases = (allCasesData || [])

    // Calculate Stats
    // Today's Revenue (Cash flow based)
    const todayPayments = allPayments.filter(p => {
        const today = new Date().toDateString()
        return new Date(p.paid_on).toDateString() === today
    })

    const todayRevenue = todayPayments.reduce((sum, p) => {
        if (p.allocation === 'EMBALMING') return sum
        return sum + (p.amount || 0)
    }, 0)

    // Total Registration = Sum of registration_fee. Fallback to branch default if missing.
    const totalRegistration = allCases.reduce((sum, c: any) => {
        return sum + (c.registration_fee || getRegistrationFee(branch.name, branch.code))
    }, 0)

    // Total Coldroom = Sum of coldroom_fee from all cases
    const totalColdroom = allCases.reduce((sum, c) => sum + (c.coldroom_fee || 0), 0)

    // Total Revenue = Registration + Coldroom (correct formula)
    const totalRevenueBilled = totalRegistration + totalColdroom

    // Fetch active cases for the payment dialog
    const { data: casesData } = await supabase
        .from('deceased_cases')
        .select('*')
        .eq('branch_id', branch.id)
        .eq('status', 'IN_CUSTODY')
        .order('created_at', { ascending: false })

    const activeCases = (casesData || []) as DeceasedCase[]

    // Fetch bank transactions
    const { data: bankTransactionsData } = await supabase
        .from('bank_transactions')
        .select('*, performer:profiles(full_name)')
        .eq('branch_id', branch.id)
        .order('transaction_date', { ascending: false })
        .limit(20)

    const bankTransactions = (bankTransactionsData || []) as BankTransaction[]

    // Fetch expenses
    const { data: expensesData } = await supabase
        .from('expenses')
        .select('*, recorder:profiles(full_name)')
        .eq('branch_id', branch.id)
        .order('expense_date', { ascending: false })
        .limit(20)

    const expenses = (expensesData || []) as (Expense & { recorder: { full_name: string } | null })[]

    // Calculate total expenses
    const { data: allExpensesData } = await supabase
        .from('expenses')
        .select('amount')
        .eq('branch_id', branch.id)

    const totalExpenses = (allExpensesData || []).reduce((sum, e) => sum + (e.amount || 0), 0)

    return (
        <div className="space-y-6 p-8">
            {/* Header */}
            <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
                <div>
                    <h1 className="text-3xl font-bold tracking-tight">Finance & Payments</h1>
                    <p className="text-muted-foreground">Record and track all payments and expenses</p>
                </div>
                <div className="flex gap-2">
                    <AddExpenseDialog branch={branch} />
                    <AddBankTransactionDialog branch={branch} />
                    <AddPaymentDialog branch={branch} cases={activeCases} preselectedCaseId={preselectedCaseId} />
                </div>
            </div>

            {/* Stats Cards */}
            <div className="grid gap-4 md:grid-cols-3 lg:grid-cols-5">
                <Card>
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium">Today&apos;s Revenue</CardTitle>
                        <div className="h-8 w-8 rounded-full bg-green-100 flex items-center justify-center">
                            <Calendar className="h-4 w-4 text-green-600" />
                        </div>
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold text-green-600">GHS {todayRevenue.toFixed(2)}</div>
                        <p className="text-xs text-muted-foreground">{todayPayments.length} payments today</p>
                    </CardContent>
                </Card>
                <Card>
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium">Total Billed</CardTitle>
                        <div className="h-8 w-8 rounded-full bg-blue-100 flex items-center justify-center">
                            <TrendingUp className="h-4 w-4 text-blue-600" />
                        </div>
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold">GHS {totalRevenueBilled.toFixed(2)}</div>
                        <p className="text-xs text-muted-foreground">Total Expected Revenue</p>
                    </CardContent>
                </Card>
                <Card>
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium">Total Registration</CardTitle>
                        <div className="h-8 w-8 rounded-full bg-purple-100 flex items-center justify-center">
                            <FileText className="h-4 w-4 text-purple-600" />
                        </div>
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold">GHS {totalRegistration.toFixed(2)}</div>
                        <p className="text-xs text-muted-foreground">Based on case count</p>
                    </CardContent>
                </Card>
                <Card>
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium">Total Coldroom</CardTitle>
                        <div className="h-8 w-8 rounded-full bg-indigo-100 flex items-center justify-center">
                            <Snowflake className="h-4 w-4 text-indigo-600" />
                        </div>
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold">GHS {totalColdroom.toFixed(2)}</div>
                        <p className="text-xs text-muted-foreground">Accrued fees</p>
                    </CardContent>
                </Card>
                <Card className="border-red-200 bg-red-50/50">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium text-red-700">Total Expenses</CardTitle>
                        <div className="h-8 w-8 rounded-full bg-red-100 flex items-center justify-center">
                            <MinusCircle className="h-4 w-4 text-red-600" />
                        </div>
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold text-red-600">GHS {totalExpenses.toFixed(2)}</div>
                        <p className="text-xs text-muted-foreground">All recorded expenses</p>
                    </CardContent>
                </Card>
            </div>

            {/* Payments Table */}
            <Card>
                <CardHeader className="pb-3">
                    <div className="flex flex-col md:flex-row md:items-center gap-4">
                        <CardTitle>Recent Payments</CardTitle>
                        <div className="flex-1" />
                        <div className="relative w-full md:w-64">
                            <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
                            <Input placeholder="Search payments..." className="pl-10" />
                        </div>
                    </div>
                </CardHeader>
                <CardContent className="p-0">
                    <Table>
                        <TableHeader>
                            <TableRow className="bg-slate-50 dark:bg-slate-800">
                                <TableHead className="font-semibold">Receipt No.</TableHead>
                                <TableHead className="font-semibold">Case</TableHead>
                                <TableHead className="font-semibold">Date</TableHead>
                                <TableHead className="font-semibold">Method</TableHead>
                                <TableHead className="font-semibold">Allocation</TableHead>
                                <TableHead className="font-semibold text-right">Amount (GHS)</TableHead>
                            </TableRow>
                        </TableHeader>
                        <TableBody>
                            {payments.length === 0 ? (
                                <TableRow>
                                    <TableCell colSpan={6} className="h-32 text-center">
                                        <div className="flex flex-col items-center justify-center text-muted-foreground">
                                            <DollarSign className="h-8 w-8 mb-2 opacity-50" />
                                            <p>No payments recorded yet</p>
                                        </div>
                                    </TableCell>
                                </TableRow>
                            ) : (
                                payments.map((payment) => (
                                    <TableRow key={payment.id} className="hover:bg-slate-50 dark:hover:bg-slate-800/50">
                                        <TableCell className="font-mono text-blue-600">{payment.receipt_no}</TableCell>
                                        <TableCell>
                                            {payment.case ? (
                                                <Link href={`/dashboard/${branch.code}/cases/${payment.case_id}`} className="hover:underline">
                                                    <span className="font-mono text-sm">{payment.case.tag_no}</span>
                                                    <span className="text-muted-foreground text-xs block">{payment.case.name_of_deceased}</span>
                                                </Link>
                                            ) : (
                                                <span className="text-muted-foreground">-</span>
                                            )}
                                        </TableCell>
                                        <TableCell>{new Date(payment.paid_on).toLocaleDateString()}</TableCell>
                                        <TableCell>
                                            <Badge className={methodColors[payment.method]}>
                                                {payment.method}
                                            </Badge>
                                        </TableCell>
                                        <TableCell>
                                            <Badge variant="outline">{payment.allocation}</Badge>
                                        </TableCell>
                                        <TableCell className="text-right font-medium text-green-600">
                                            +{payment.amount.toFixed(2)}
                                        </TableCell>
                                    </TableRow>
                                ))
                            )}
                        </TableBody>
                    </Table>
                </CardContent>
            </Card>

            {/* Bank Transactions Table */}
            <Card>
                <CardHeader className="pb-3">
                    <div className="flex items-center justify-between">
                        <div>
                            <CardTitle>Bank Transactions</CardTitle>
                            <p className="text-sm text-muted-foreground mt-1">Recent deposits and withdrawals</p>
                        </div>
                    </div>
                </CardHeader>
                <CardContent className="p-0">
                    <Table>
                        <TableHeader>
                            <TableRow className="bg-slate-50 dark:bg-slate-800">
                                <TableHead className="font-semibold">Date & Time</TableHead>
                                <TableHead className="font-semibold">Type</TableHead>
                                <TableHead className="font-semibold">Description</TableHead>
                                <TableHead className="font-semibold">Performed By</TableHead>
                                <TableHead className="font-semibold text-right">Amount (GHS)</TableHead>
                            </TableRow>
                        </TableHeader>
                        <TableBody>
                            {bankTransactions.length === 0 ? (
                                <TableRow>
                                    <TableCell colSpan={5} className="h-32 text-center text-muted-foreground">
                                        No bank transactions recorded locally
                                    </TableCell>
                                </TableRow>
                            ) : (
                                bankTransactions.map((tx) => (
                                    <TableRow key={tx.id} className="hover:bg-slate-50 dark:hover:bg-slate-800/50">
                                        <TableCell>
                                            <div className="flex flex-col">
                                                <span className="font-medium">{new Date(tx.transaction_date).toLocaleDateString()}</span>
                                                <span className="text-xs text-muted-foreground">{new Date(tx.transaction_date).toLocaleTimeString()}</span>
                                            </div>
                                        </TableCell>
                                        <TableCell>
                                            <Badge variant={tx.type === 'DEPOSIT' ? 'default' : 'destructive'}
                                                className={tx.type === 'DEPOSIT' ? 'bg-green-100 text-green-800 hover:bg-green-200' : 'bg-red-100 text-red-800 hover:bg-red-200'}>
                                                {tx.type}
                                            </Badge>
                                        </TableCell>
                                        <TableCell>{tx.description || '-'}</TableCell>
                                        <TableCell className="text-sm text-slate-600">{tx.performer?.full_name || 'System'}</TableCell>
                                        <TableCell className={`text-right font-bold ${tx.type === 'DEPOSIT' ? 'text-green-600' : 'text-red-600'}`}>
                                            {tx.type === 'DEPOSIT' ? '+' : '-'}{tx.amount.toFixed(2)}
                                        </TableCell>
                                    </TableRow>
                                ))
                            )}
                        </TableBody>
                    </Table>
                </CardContent>
            </Card>

            {/* Expenses Table */}
            <Card>
                <CardHeader className="pb-3">
                    <div className="flex items-center justify-between">
                        <div>
                            <CardTitle className="flex items-center gap-2">
                                <MinusCircle className="h-5 w-5 text-red-600" />
                                Recent Expenses
                            </CardTitle>
                            <p className="text-sm text-muted-foreground mt-1">Track all business expenses</p>
                        </div>
                    </div>
                </CardHeader>
                <CardContent className="p-0">
                    <Table>
                        <TableHeader>
                            <TableRow className="bg-slate-50 dark:bg-slate-800">
                                <TableHead className="font-semibold">Date</TableHead>
                                <TableHead className="font-semibold">Category</TableHead>
                                <TableHead className="font-semibold">Description</TableHead>
                                <TableHead className="font-semibold">Recorded By</TableHead>
                                <TableHead className="font-semibold text-right">Amount (GHS)</TableHead>
                                <TableHead className="w-[50px]"></TableHead>
                            </TableRow>
                        </TableHeader>
                        <TableBody>
                            {expenses.length === 0 ? (
                                <TableRow>
                                    <TableCell colSpan={6} className="h-32 text-center text-muted-foreground">
                                        <div className="flex flex-col items-center justify-center">
                                            <MinusCircle className="h-8 w-8 mb-2 opacity-50" />
                                            <p>No expenses recorded yet</p>
                                        </div>
                                    </TableCell>
                                </TableRow>
                            ) : (
                                expenses.map((expense) => (
                                    <TableRow key={expense.id} className="hover:bg-slate-50 dark:hover:bg-slate-800/50">
                                        <TableCell>
                                            {new Date(expense.expense_date).toLocaleDateString()}
                                        </TableCell>
                                        <TableCell>
                                            <Badge className={expenseCategoryColors[expense.category]}>
                                                {expense.category}
                                            </Badge>
                                        </TableCell>
                                        <TableCell className="max-w-xs truncate">{expense.description}</TableCell>
                                        <TableCell className="text-sm text-slate-600">
                                            {expense.recorder?.full_name || 'Unknown'}
                                        </TableCell>
                                        <TableCell className="text-right font-bold text-red-600">
                                            -{expense.amount.toFixed(2)}
                                        </TableCell>
                                        <TableCell>
                                            <DeleteExpenseButton expenseId={expense.id} />
                                        </TableCell>
                                    </TableRow>
                                ))
                            )}
                        </TableBody>
                    </Table>
                </CardContent>
            </Card>

            <Toaster richColors position="top-right" />
        </div>
    )
}
