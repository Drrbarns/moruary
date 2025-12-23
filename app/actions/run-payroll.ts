'use server'

import { createClient } from '@/utils/supabase/server'
import { revalidatePath } from 'next/cache'

// Ghana GRA Monthly Tax Rates (Approx 2024 Reference)
function calculateTax(chargeableIncome: number): number {
    let tax = 0;
    let income = chargeableIncome;

    const t1 = 402;
    if (income <= t1) return 0;
    income -= t1;

    const t2 = 110;
    const t2_tax = Math.min(income, t2) * 0.05;
    tax += t2_tax;
    income -= t2;
    if (income <= 0) return tax;

    const t3 = 130;
    const t3_tax = Math.min(income, t3) * 0.10;
    tax += t3_tax;
    income -= t3;
    if (income <= 0) return tax;

    const t4 = 3000;
    const t4_tax = Math.min(income, t4) * 0.175;
    tax += t4_tax;
    income -= t4;
    if (income <= 0) return tax;

    const t5 = 16395;
    const t5_tax = Math.min(income, t5) * 0.25;
    tax += t5_tax;
    income -= t5;
    if (income <= 0) return tax;

    tax += income * 0.30;
    return tax;
}

export async function runPayrollAction(branchId: string, month: number, year: number) {
    try {
        const supabase = await createClient()
        const { data: { user } } = await supabase.auth.getUser()

        if (!user) return { error: 'Unauthorized' }

        // 1. Check existing
        const { data: existing } = await supabase.from('payroll_runs')
            .select('id')
            .eq('branch_id', branchId)
            .eq('month', month)
            .eq('year', year)
            .single()

        if (existing) return { error: `Payroll for ${month}/${year} already exists.` }

        // 2. Get Employees in Branch
        const { data: assignments } = await supabase
            .from('user_branch_assignments')
            .select('user_id')
            .eq('branch_id', branchId)

        if (!assignments || assignments.length === 0) return { error: 'No employees found in this branch.' }

        const userIds = assignments.map(a => a.user_id)

        // 3. Get Employee Profiles & Structures
        const { data: employees } = await supabase
            .from('employee_profiles')
            .select(`
                id,
                base_salary,
                salary_structure_id,
                salary_structure:salary_structures(*)
            `)
            .in('id', userIds)

        if (!employees) return { error: 'Failed to fetch employee details.' }

        // 4. Calculate Payslips
        let totalGross = 0;
        let totalDed = 0;
        let totalNet = 0;
        const payslips = [];

        for (const emp of employees) {
            const structure = emp.salary_structure as any;

            let basic = emp.base_salary;
            let allowances = 0;
            let allowanceDetails = {};
            let applySSNIT = true;
            let applyPAYE = true;

            if (structure) {
                // If structure exists, use its base defaults, or use override if we had one.
                // Assuming structure is the source of truth if linked.
                basic = structure.base_salary;
                allowances = (structure.transport_allowance || 0) +
                    (structure.housing_allowance || 0) +
                    (structure.meal_allowance || 0) +
                    (structure.utility_allowance || 0);

                allowanceDetails = {
                    transport: structure.transport_allowance,
                    housing: structure.housing_allowance,
                    meal: structure.meal_allowance,
                    utility: structure.utility_allowance
                };
                applySSNIT = structure.apply_ssnit;
                applyPAYE = structure.apply_paye;
            }

            const gross = basic + allowances;

            // Deductions
            // SSNIT Tier 1 (5.5% of Basic Salary)
            const ssnit = applySSNIT ? (basic * 0.055) : 0;

            // Taxable Income = Gross - SSNIT (Tier 1 is tax exempt)
            const taxableIncome = gross - ssnit;
            const tax = applyPAYE ? calculateTax(taxableIncome) : 0;

            const totalDeduction = ssnit + tax;
            const net = gross - totalDeduction;

            totalGross += gross;
            totalDed += totalDeduction;
            totalNet += net;

            payslips.push({
                user_id: emp.id,
                base_salary: basic,
                total_allowances: allowances,
                gross_pay: gross,
                tax_deduction: tax,
                ssnit_deduction: ssnit,
                total_deductions: totalDeduction,
                net_pay: net,
                allowance_details: allowanceDetails
            });
        }

        // 5. Create Run (DRAFT)
        const { data: run, error: runError } = await supabase.from('payroll_runs').insert({
            branch_id: branchId,
            month,
            year,
            status: 'DRAFT',
            total_gross: totalGross,
            total_deductions: totalDed,
            total_net: totalNet,
            employee_count: payslips.length,
            processed_by: user.id
        }).select().single()

        if (runError) {
            console.error(runError)
            return { error: 'Run Error: ' + runError.message }
        }

        // 6. Insert Payslips
        if (payslips.length > 0) {
            const payslipsToInsert = payslips.map(p => ({
                ...p,
                run_id: run.id
            }))

            const { error: slipsError } = await supabase.from('payslips').insert(payslipsToInsert)

            if (slipsError) {
                await supabase.from('payroll_runs').delete().eq('id', run.id)
                return { error: 'Payslip Error: ' + slipsError.message }
            }
        }

        revalidatePath(`/dashboard/${branchId}/hr/payroll`)
        return { success: true, runId: run.id }
    } catch (e: any) {
        return { error: e.message }
    }
}
