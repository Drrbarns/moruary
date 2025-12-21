'use client'

import { useState } from 'react'
import { Button } from '@/components/ui/button'
import {
    Dialog,
    DialogContent,
    DialogDescription,
    DialogFooter,
    DialogHeader,
    DialogTitle,
} from '@/components/ui/dialog'
import { Label } from '@/components/ui/label'
import { createClient } from '@/utils/supabase/client'
import { useRouter } from 'next/navigation'
import { Plus, Loader2 } from 'lucide-react'
import { toast } from 'sonner'

interface CreatePayrollButtonProps {
    branchId: string
}

export default function CreatePayrollButton({ branchId }: CreatePayrollButtonProps) {
    const [loading, setLoading] = useState(false)
    const [dialogOpen, setDialogOpen] = useState(false)
    const [month, setMonth] = useState(new Date().getMonth() + 1)
    const [year, setYear] = useState(new Date().getFullYear())
    const router = useRouter()
    const supabase = createClient()

    const monthNames = [
        'January', 'February', 'March', 'April', 'May', 'June',
        'July', 'August', 'September', 'October', 'November', 'December'
    ]

    const createPayroll = async () => {
        setLoading(true)
        try {
            const { data: { user } } = await supabase.auth.getUser()

            // Get all employees assigned to this branch
            const { data: assignments, error: assignError } = await supabase
                .from('user_branch_assignments')
                .select(`
                    user_id,
                    profile:profiles(id, full_name, is_active)
                `)
                .eq('branch_id', branchId)

            if (assignError) throw assignError

            const activeEmployees = assignments
                ?.map((a: any) => a.profile)
                .filter((p: any) => p?.is_active) || []

            if (activeEmployees.length === 0) {
                toast.error('No active employees found in this branch')
                return
            }

            // Get salary structures for employees
            const employeeIds = activeEmployees.map((e: any) => e.id)
            const { data: salaryStructures } = await supabase
                .from('salary_structures')
                .select('*')
                .in('employee_id', employeeIds)

            const salaryMap = new Map(salaryStructures?.map((s: any) => [s.employee_id, s]) || [])

            // Create payroll run
            const { data: payrollRun, error: runError } = await supabase
                .from('payroll_runs')
                .insert({
                    branch_id: branchId,
                    month: month,
                    year: year,
                    status: 'DRAFT',
                    employee_count: activeEmployees.length,
                    processed_by: user?.id
                })
                .select()
                .single()

            if (runError) throw runError

            // Create payroll items for each employee
            let totalGross = 0
            let totalDeductions = 0
            let totalNet = 0

            const payrollItems = activeEmployees.map((employee: any) => {
                const salary = salaryMap.get(employee.id)
                const baseSalary = salary?.base_salary || 0
                const housing = salary?.housing_allowance || 0
                const transport = salary?.transport_allowance || 0
                const meal = salary?.meal_allowance || 0
                const otherAllow = salary?.other_allowances || 0

                const grossSalary = baseSalary + housing + transport + meal + otherAllow

                const taxRate = salary?.tax_rate || 0
                const ssnitRate = salary?.ssnit_rate || 5.5

                const taxAmount = (baseSalary * taxRate) / 100
                const ssnitAmount = (baseSalary * ssnitRate) / 100
                const otherDeduct = salary?.other_deductions || 0

                const totalDeduct = taxAmount + ssnitAmount + otherDeduct
                const netSalary = grossSalary - totalDeduct

                totalGross += grossSalary
                totalDeductions += totalDeduct
                totalNet += netSalary

                return {
                    payroll_run_id: payrollRun.id,
                    employee_id: employee.id,
                    base_salary: baseSalary,
                    housing_allowance: housing,
                    transport_allowance: transport,
                    meal_allowance: meal,
                    other_allowances: otherAllow,
                    gross_salary: grossSalary,
                    tax_amount: taxAmount,
                    ssnit_amount: ssnitAmount,
                    other_deductions: otherDeduct,
                    total_deductions: totalDeduct,
                    net_salary: netSalary,
                    status: 'PENDING'
                }
            })

            const { error: itemsError } = await supabase
                .from('payroll_items')
                .insert(payrollItems)

            if (itemsError) throw itemsError

            // Update payroll run with totals
            await supabase
                .from('payroll_runs')
                .update({
                    total_gross: totalGross,
                    total_deductions: totalDeductions,
                    total_net: totalNet
                })
                .eq('id', payrollRun.id)

            toast.success(`Payroll created for ${monthNames[month - 1]} ${year}`)
            setDialogOpen(false)
            router.refresh()
            router.push(`/dashboard/${branchId}/hr/payroll/${payrollRun.id}`)
        } catch (error: any) {
            console.error('Error creating payroll:', error)
            if (error.code === '23505') {
                toast.error(`Payroll for ${monthNames[month - 1]} ${year} already exists`)
            } else {
                toast.error('Failed to create payroll run')
            }
        } finally {
            setLoading(false)
        }
    }

    return (
        <>
            <Button onClick={() => setDialogOpen(true)} className="bg-blue-600 hover:bg-blue-700">
                <Plus className="mr-2 h-4 w-4" />
                Create Payroll Run
            </Button>

            <Dialog open={dialogOpen} onOpenChange={setDialogOpen}>
                <DialogContent className="sm:max-w-md">
                    <DialogHeader>
                        <DialogTitle>Create Payroll Run</DialogTitle>
                        <DialogDescription>
                            Select the month and year to process payroll
                        </DialogDescription>
                    </DialogHeader>
                    <div className="space-y-4 py-4">
                        <div className="grid grid-cols-2 gap-4">
                            <div className="grid gap-2">
                                <Label htmlFor="month">Month</Label>
                                <select
                                    id="month"
                                    value={month}
                                    onChange={(e) => setMonth(Number(e.target.value))}
                                    className="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm"
                                >
                                    {monthNames.map((name, i) => (
                                        <option key={i} value={i + 1}>{name}</option>
                                    ))}
                                </select>
                            </div>
                            <div className="grid gap-2">
                                <Label htmlFor="year">Year</Label>
                                <select
                                    id="year"
                                    value={year}
                                    onChange={(e) => setYear(Number(e.target.value))}
                                    className="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm"
                                >
                                    {Array.from({ length: 5 }, (_, i) => new Date().getFullYear() - 2 + i).map(y => (
                                        <option key={y} value={y}>{y}</option>
                                    ))}
                                </select>
                            </div>
                        </div>
                        <p className="text-sm text-muted-foreground">
                            This will create a payroll draft for all active employees in this branch.
                            You can review and modify individual amounts before approving.
                        </p>
                    </div>
                    <DialogFooter>
                        <Button variant="outline" onClick={() => setDialogOpen(false)}>
                            Cancel
                        </Button>
                        <Button
                            onClick={createPayroll}
                            disabled={loading}
                            className="bg-blue-600 hover:bg-blue-700"
                        >
                            {loading && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
                            Create Payroll
                        </Button>
                    </DialogFooter>
                </DialogContent>
            </Dialog>
        </>
    )
}
