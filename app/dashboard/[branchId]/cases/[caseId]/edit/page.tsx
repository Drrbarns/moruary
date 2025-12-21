import { notFound } from 'next/navigation'
import { createClient } from '@/utils/supabase/server'
import { CaseForm } from '@/components/cases/case-form'
import { Toaster } from '@/components/ui/sonner'

export default async function EditCasePage({
    params,
}: {
    params: Promise<{ branchId: string; caseId: string }>
}) {
    const { branchId, caseId } = await params
    const supabase = await createClient()

    const { data: caseData, error } = await supabase
        .from('deceased_cases')
        .select('*')
        .eq('id', caseId)
        .eq('branch_id', branchId)
        .single()

    if (error || !caseData) {
        notFound()
    }

    return (
        <>
            <CaseForm branchId={branchId} initialData={caseData} mode="edit" />
            <Toaster richColors position="top-right" />
        </>
    )
}
