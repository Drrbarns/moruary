import { notFound } from 'next/navigation'
import { createClient } from '@/utils/supabase/server'
import { CaseForm } from '@/components/cases/case-form'
import { Toaster } from '@/components/ui/sonner'
import { resolveBranch } from '@/lib/branch-resolver'

export default async function EditCasePage({
    params,
}: {
    params: Promise<{ branchId: string; caseId: string }>
}) {
    const { branchId, caseId } = await params
    const supabase = await createClient()

    // Resolve branch from code or UUID
    const branch = await resolveBranch(branchId)
    if (!branch) notFound()

    const { data: caseData, error } = await supabase
        .from('deceased_cases')
        .select('*')
        .eq('id', caseId)
        .eq('branch_id', branch.id)
        .single()

    if (error || !caseData) {
        notFound()
    }

    return (
        <>
            <CaseForm branch={branch} initialData={caseData} mode="edit" />
            <Toaster richColors position="top-right" />
        </>
    )
}
