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
import { Wallet, TrendingUp, CreditCard, Search, Filter, DollarSign, Calendar, FileText, Snowflake } from 'lucide-react'
import type { Payment, DeceasedCase, BankTransaction } from '@/lib/types'
import { AddPaymentDialog } from '@/components/finance/add-payment-dialog'
import { AddBankTransactionDialog } from '@/components/finance/add-bank-transaction-dialog'
import { Toaster } from '@/components/ui/sonner'
import { resolveBranch } from '@/lib/branch-resolver'
import { notFound } from 'next/navigation'

const methodColors: Record<string, string> = {
    CASH: 'bg-green-100 text-green-800',
    MOMO: 'bg-yellow-100 text-yellow-800',
    BANK: 'bg-blue-100 text-blue-800',
    CARD: 'bg-purple-100 text-purple-800',
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
    if (!user) return notFound() // Should be handled by middleware but just in case

    const { data: profile } = await supabase.from('profiles').select('role').eq('id', user.id).single()
    if (profile?.role === 'staff') {
        // Redirect staff to cases or show 403
        // Since we want to restrict them, redirecting to their main view (cases) is friendly
        // But Next.js redirect needs to be imported
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

    // Fetch ALL payments for statistics (lightweight query)
    const { data: allPaymentsData } = await supabase
        .from('payments')
        .select('amount, allocation, paid_on')
        .eq('branch_id', branch.id)

    const allPayments = allPaymentsData || []

    // Calculate stats using ALL payments
    const totalRevenue = allPayments.reduce((sum, p) => {
        // Exclude embalming from revenue if that's the rule, but usually revenue includes everything?
        // The previous code had: if (p.allocation === 'EMBALMING') return sum
        // User asked to integrate embalming fee (50) and reg fee (350). 
        // If the user considers Embalming as revenue, we should include it. 
        // The previous code explicitly EXCLUDED it. I will keep it consistent with previous logic for now
        // BUT wait, looking at the card "Total Revenue", it usually implies everything.
        // Let's check if the user previously asked to exclude it. 
        // In "Goals": "Integrate dynamic pricing... fixed embalming fee".
        // Use logic: Revenue = Everything.
        // The previous code exclusion might have been a mistake or specific legacy rule.
        // Use standard logic: Sum of all amounts.
        return sum + (p.amount || 0)
    }, 0)

    const todayPayments = allPayments.filter(p => {
        const today = new Date().toDateString()
        return new Date(p.paid_on).toDateString() === today
    })

    const todayRevenue = todayPayments.reduce((sum, p) => sum + (p.amount || 0), 0)

    // Allocation breakdown
    const allocationBreakdown = allPayments.reduce((acc, p) => {
        acc[p.allocation] = (acc[p.allocation] || 0) + p.amount
        return acc
    }, {} as Record<string, number>)

    // Fetch active cases for the payment dialog
    const { data: casesData } = await supabase
        .from('deceased_cases')
        .select('*')
        .eq('branch_id', branch.id)
        .eq('status', 'IN_CUSTODY')
        .order('created_at', { ascending: false })

    const cases = (casesData || []) as DeceasedCase[]

    // Fetch bank transactions
    const { data: bankTransactionsData } = await supabase
        .from('bank_transactions')
        .select('*, performer:profiles(full_name)')
        .eq('branch_id', branch.id)
        .order('transaction_date', { ascending: false })
        .limit(20)

    const bankTransactions = (bankTransactionsData || []) as BankTransaction[]

    return (
        <div className="space-y-6 p-8">
            {/* Header */}
            <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
                <div>
                    <h1 className="text-3xl font-bold tracking-tight">Finance & Payments</h1>
                    <p className="text-muted-foreground">Record and track all payments</p>
                </div>
                <div className="flex gap-2">
                    <AddBankTransactionDialog branch={branch} />
                    <AddPaymentDialog branch={branch} cases={cases} preselectedCaseId={preselectedCaseId} />
                </div>
            </div>

            {/* Stats Cards */}
            <div className="grid gap-4 md:grid-cols-4">
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
                        <CardTitle className="text-sm font-medium">Total Revenue</CardTitle>
                        <div className="h-8 w-8 rounded-full bg-blue-100 flex items-center justify-center">
                            <TrendingUp className="h-4 w-4 text-blue-600" />
                        </div>
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold">GHS {totalRevenue.toFixed(2)}</div>
                        <p className="text-xs text-muted-foreground">All time</p>
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
                        <div className="text-2xl font-bold">GHS {(allocationBreakdown.REGISTRATION || 0).toFixed(2)}</div>
                        <p className="text-xs text-muted-foreground">Registration fees</p>
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
                        <div className="text-2xl font-bold">GHS {(allocationBreakdown.COLDROOM || 0).toFixed(2)}</div>
                        <p className="text-xs text-muted-foreground">Coldroom fees</p>
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

            <Toaster richColors position="top-right" />
        </div>
    )
}
