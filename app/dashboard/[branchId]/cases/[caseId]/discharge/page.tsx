import { notFound, redirect } from 'next/navigation'
import { createClient } from '@/utils/supabase/server'
import { DischargeForm } from '@/components/cases/discharge-form'
import { Toaster } from '@/components/ui/sonner'
import type { DeceasedCase } from '@/lib/types'

export default async function DischargePage({
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

    // If already discharged, redirect to case details
    if (caseData.status === 'DISCHARGED') {
        redirect(`/dashboard/${branchId}/cases/${caseId}`)
    }

    return (
        <>
            <DischargeForm branchId={branchId} caseData={caseData as DeceasedCase} />
            <Toaster richColors position="top-right" />
        </>
    )
}
