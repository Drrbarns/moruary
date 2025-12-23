import { createClient } from '@/utils/supabase/server'
import { Button } from '@/components/ui/button'
import { ArrowLeft } from 'lucide-react'
import Link from 'next/link'
import { notFound } from 'next/navigation'
import { resolveBranch } from '@/lib/branch-resolver'
import { NewEmployeeForm } from '@/components/hr/new-employee-form'
import { SalaryStructure } from '@/lib/types'

export default async function NewEmployeePage({ params }: { params: Promise<{ branchId: string }> }) {
    const { branchId } = await params
    const supabase = await createClient()
    const branch = await resolveBranch(branchId)
    if (!branch) notFound()

    // Fetch salary structures
    const { data: structures } = await supabase
        .from('salary_structures')
        .select('*')
        .eq('branch_id', branch.id)
        .order('name')

    return (
        <div className="space-y-6">
            <div className="flex items-center gap-4">
                <Link href={`/dashboard/${branchId}/hr`}>
                    <Button variant="ghost" size="icon">
                        <ArrowLeft className="h-5 w-5" />
                    </Button>
                </Link>
                <div>
                    <h1 className="text-3xl font-bold tracking-tight">Add New Employee</h1>
                    <p className="text-muted-foreground">Onboard a new staff member to {branch.name}</p>
                </div>
            </div>

            <NewEmployeeForm
                branchId={branch.id}
                salaryStructures={(structures || []) as SalaryStructure[]}
            />
        </div>
    )
}
