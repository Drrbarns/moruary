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
import { Wallet, TrendingUp, CreditCard, Search, Filter, DollarSign, Calendar } from 'lucide-react'
import type { Payment, DeceasedCase } from '@/lib/types'
import { AddPaymentDialog } from '@/components/finance/add-payment-dialog'
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

    // Fetch payments for this branch
    const { data: paymentsData } = await supabase
        .from('payments')
        .select('*, case:deceased_cases(tag_no, name_of_deceased)')
        .eq('branch_id', branch.id)
        .order('paid_on', { ascending: false })
        .limit(50)

    const payments = (paymentsData || []) as (Payment & { case: { tag_no: string, name_of_deceased: string } | null })[]

    // Fetch active cases for the payment dialog
    const { data: casesData } = await supabase
        .from('deceased_cases')
        .select('*')
        .eq('branch_id', branch.id)
        .eq('status', 'IN_CUSTODY')
        .order('created_at', { ascending: false })

    const cases = (casesData || []) as DeceasedCase[]

    // Calculate stats
    const totalRevenue = payments.reduce((sum, p) => sum + (p.amount || 0), 0)
    const todayPayments = payments.filter(p => {
        const today = new Date().toDateString()
        return new Date(p.paid_on).toDateString() === today
    })
    const todayRevenue = todayPayments.reduce((sum, p) => sum + (p.amount || 0), 0)

    // Payment method breakdown
    const methodBreakdown = payments.reduce((acc, p) => {
        acc[p.method] = (acc[p.method] || 0) + p.amount
        return acc
    }, {} as Record<string, number>)

    return (
        <div className="space-y-6 p-8">
            {/* Header */}
            <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
                <div>
                    <h1 className="text-3xl font-bold tracking-tight">Finance & Payments</h1>
                    <p className="text-muted-foreground">Record and track all payments</p>
                </div>
                <AddPaymentDialog branch={branch} cases={cases} preselectedCaseId={preselectedCaseId} />
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
                        <CardTitle className="text-sm font-medium">Cash Payments</CardTitle>
                        <div className="h-8 w-8 rounded-full bg-emerald-100 flex items-center justify-center">
                            <Wallet className="h-4 w-4 text-emerald-600" />
                        </div>
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold">GHS {(methodBreakdown.CASH || 0).toFixed(2)}</div>
                        <p className="text-xs text-muted-foreground">Cash received</p>
                    </CardContent>
                </Card>
                <Card>
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium">Mobile Money</CardTitle>
                        <div className="h-8 w-8 rounded-full bg-yellow-100 flex items-center justify-center">
                            <CreditCard className="h-4 w-4 text-yellow-600" />
                        </div>
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold">GHS {(methodBreakdown.MOMO || 0).toFixed(2)}</div>
                        <p className="text-xs text-muted-foreground">MoMo received</p>
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

            <Toaster richColors position="top-right" />
        </div>
    )
}
