import { createClient } from '@/utils/supabase/server'
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { ArrowLeft, Wallet, FileText, Calendar } from 'lucide-react'
import Link from 'next/link'
import { resolveBranch } from '@/lib/branch-resolver'
import { notFound } from 'next/navigation'
import { RunPayrollDialog } from '@/components/hr/run-payroll-dialog'

function currency(amount: number) {
    return `GH₵ ${amount?.toLocaleString('en-GH', { minimumFractionDigits: 2, maximumFractionDigits: 2 }) || '0.00'}`
}

export default async function PayrollPage({ params }: { params: Promise<{ branchId: string }> }) {
    const { branchId } = await params
    const supabase = await createClient()

    const branch = await resolveBranch(branchId)
    if (!branch) notFound()

    // Fetch payroll runs
    const { data: runs } = await supabase
        .from('payroll_runs')
        .select('*')
        .eq('branch_id', branch.id)
        .order('year', { ascending: false })
        .order('month', { ascending: false })

    return (
        <div className="space-y-6">
            <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
                <div className="flex items-center gap-4">
                    <Link href={`/dashboard/${branchId}/hr`}>
                        <Button variant="ghost" size="icon">
                            <ArrowLeft className="h-5 w-5" />
                        </Button>
                    </Link>
                    <div>
                        <h1 className="text-3xl font-bold tracking-tight">Payroll Management</h1>
                        <p className="text-muted-foreground">Manage salary structures and processing.</p>
                    </div>
                </div>
                <div className="flex gap-2">
                    <Link href={`/dashboard/${branchId}/hr/payroll/salary-structures`}>
                        <Button variant="outline">
                            <Wallet className="mr-2 h-4 w-4" />
                            Salary Structures
                        </Button>
                    </Link>
                    <RunPayrollDialog branchId={branch.id} />
                </div>
            </div>

            <div className="grid gap-6">
                <Card className="border-0 shadow-md">
                    <CardHeader>
                        <CardTitle>Payroll History</CardTitle>
                        <CardDescription>Recent generated payroll runs.</CardDescription>
                    </CardHeader>
                    <CardContent>
                        {!runs || runs.length === 0 ? (
                            <div className="py-12 text-center text-muted-foreground bg-slate-50 dark:bg-slate-900 rounded-lg">
                                <Calendar className="mx-auto h-12 w-12 opacity-20 mb-3" />
                                <p className="font-medium">No payroll runs found</p>
                                <p className="text-sm opacity-70">Click "Run Payroll" to generate your first payslip batch.</p>
                            </div>
                        ) : (
                            <div className="space-y-4">
                                {runs.map((run: any) => (
                                    <div key={run.id} className="flex items-center justify-between p-4 border rounded-lg hover:bg-slate-50 dark:hover:bg-slate-800 transition-colors bg-white dark:bg-slate-900">
                                        <div className="flex items-center gap-4">
                                            <div className="h-10 w-10 rounded-full bg-blue-100 dark:bg-blue-900 flex items-center justify-center text-blue-600 dark:text-blue-400 font-bold uppercase">
                                                {new Date(run.year, run.month - 1).toLocaleString('default', { month: 'short' })}
                                            </div>
                                            <div>
                                                <div className="font-semibold flex items-center gap-2">
                                                    {new Date(run.year, run.month - 1).toLocaleString('default', { month: 'long', year: 'numeric' })}
                                                    {run.status === 'DRAFT' && <Badge variant="secondary" className="text-xs">Draft</Badge>}
                                                    {run.status === 'PAID' && <Badge className="bg-green-600 text-xs">Paid</Badge>}
                                                </div>
                                                <div className="text-sm text-muted-foreground">
                                                    {run.employee_count} Employees
                                                </div>
                                            </div>
                                        </div>
                                        <div className="text-right">
                                            <div className="font-bold text-green-600">{currency(run.total_net)}</div>
                                            <div className="text-xs text-muted-foreground">
                                                Net Pay
                                            </div>
                                        </div>
                                    </div>
                                ))}
                            </div>
                        )}
                    </CardContent>
                </Card>
            </div>
        </div>
    )
}
