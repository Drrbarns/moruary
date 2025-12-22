import { notFound, redirect } from 'next/navigation'
import { createClient } from '@/utils/supabase/server'
import { DischargeForm } from '@/components/cases/discharge-form'
import { Toaster } from '@/components/ui/sonner'
import type { DeceasedCase } from '@/lib/types'
import { resolveBranch } from '@/lib/branch-resolver'

export default async function DischargePage({
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

    // If already discharged, redirect to case details
    if (caseData.status === 'DISCHARGED') {
        redirect(`/dashboard/${branch.code}/cases/${caseId}`)
    }

    return (
        <>
            <DischargeForm branch={branch} caseData={caseData as DeceasedCase} />
            <Toaster richColors position="top-right" />
        </>
    )
}
