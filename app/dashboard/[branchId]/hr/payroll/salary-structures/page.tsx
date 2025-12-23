import { createClient } from '@/utils/supabase/server'
import { Button } from '@/components/ui/button'
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { ArrowLeft, Wallet, Plus, Edit } from 'lucide-react'
import Link from 'next/link'
import {
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from '@/components/ui/table'
import { resolveBranch } from '@/lib/branch-resolver'
import { notFound } from 'next/navigation'
import { SalaryStructureDialog } from '@/components/hr/salary-structure-dialog'
import { SalaryStructure } from '@/lib/types'

function formatCurrency(amount: number) {
    return `GH₵ ${amount.toLocaleString('en-GH', { minimumFractionDigits: 2, maximumFractionDigits: 2 })}`
}

export default async function SalaryStructuresPage({ params }: { params: Promise<{ branchId: string }> }) {
    const { branchId } = await params
    const supabase = await createClient()

    const branch = await resolveBranch(branchId)
    if (!branch) notFound()

    const { data: structures } = await supabase
        .from('salary_structures')
        .select('*')
        .eq('branch_id', branch.id)
        .order('created_at', { ascending: false })

    const list = (structures || []) as SalaryStructure[]

    return (
        <div className="space-y-6">
            <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
                <div className="flex items-center gap-4">
                    <Link href={`/dashboard/${branchId}/hr/payroll`}>
                        <Button variant="ghost" size="icon">
                            <ArrowLeft className="h-5 w-5" />
                        </Button>
                    </Link>
                    <div>
                        <h1 className="text-3xl font-bold tracking-tight">Salary Structures</h1>
                        <p className="text-muted-foreground">Manage salary components and templates</p>
                    </div>
                </div>
                <SalaryStructureDialog branchId={branch.id}>
                    <Button className="bg-blue-600 hover:bg-blue-700">
                        <Plus className="mr-2 h-4 w-4" />
                        Add New Structure
                    </Button>
                </SalaryStructureDialog>
            </div>

            <Card className="border-0 shadow-md">
                <CardHeader>
                    <CardTitle>Defined Structures</CardTitle>
                    <CardDescription>
                        Salary templates that can be assigned to employees.
                    </CardDescription>
                </CardHeader>
                <CardContent className="p-0">
                    <Table>
                        <TableHeader>
                            <TableRow className="bg-slate-50 dark:bg-slate-800 hover:bg-slate-50">
                                <TableHead className="font-semibold">Structure Name</TableHead>
                                <TableHead className="text-right font-semibold">Base Salary</TableHead>
                                <TableHead className="text-right font-semibold">Allowances</TableHead>
                                <TableHead className="text-right font-semibold">Gross Total</TableHead>
                                <TableHead className="font-semibold">Deductions</TableHead>
                                <TableHead className="w-[100px]"></TableHead>
                            </TableRow>
                        </TableHeader>
                        <TableBody>
                            {list.length === 0 ? (
                                <TableRow>
                                    <TableCell colSpan={6} className="h-40 text-center">
                                        <div className="flex flex-col items-center justify-center text-muted-foreground">
                                            <Wallet className="h-10 w-10 mb-3 opacity-30" />
                                            <p className="font-medium">No salary structures defined</p>
                                            <p className="text-sm opacity-70">Create templates to standardize employee pay</p>
                                        </div>
                                    </TableCell>
                                </TableRow>
                            ) : (
                                list.map((item) => {
                                    const allowances =
                                        item.transport_allowance +
                                        item.housing_allowance +
                                        item.meal_allowance +
                                        item.utility_allowance;
                                    const gross = item.base_salary + allowances;

                                    return (
                                        <TableRow key={item.id} className="hover:bg-slate-50 dark:hover:bg-slate-800/50">
                                            <TableCell>
                                                <div className="font-medium text-blue-600">{item.name}</div>
                                            </TableCell>
                                            <TableCell className="text-right font-mono">{formatCurrency(item.base_salary)}</TableCell>
                                            <TableCell className="text-right text-muted-foreground font-mono">{formatCurrency(allowances)}</TableCell>
                                            <TableCell className="text-right font-bold text-green-600 font-mono">{formatCurrency(gross)}</TableCell>
                                            <TableCell>
                                                <div className="flex gap-2">
                                                    {item.apply_ssnit && <Badge variant="outline" className="text-xs bg-purple-50 text-purple-700 border-purple-200">SSNIT</Badge>}
                                                    {item.apply_paye && <Badge variant="outline" className="text-xs bg-amber-50 text-amber-700 border-amber-200">PAYE</Badge>}
                                                    {!item.apply_ssnit && !item.apply_paye && <span className="text-muted-foreground text-xs italic">No deductions</span>}
                                                </div>
                                            </TableCell>
                                            <TableCell>
                                                <div className="flex justify-end pr-2">
                                                    <SalaryStructureDialog branchId={branch.id} structure={item}>
                                                        <Button variant="ghost" size="icon" className="h-8 w-8 text-muted-foreground hover:text-blue-600">
                                                            <Edit className="h-4 w-4" />
                                                        </Button>
                                                    </SalaryStructureDialog>
                                                </div>
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
