import { CaseForm } from '@/components/cases/case-form'
import { Toaster } from '@/components/ui/sonner'
import { resolveBranch } from '@/lib/branch-resolver'
import { notFound } from 'next/navigation'

export default async function NewCasePage({ params }: { params: Promise<{ branchId: string }> }) {
    const { branchId } = await params

    // Resolve branch from code or UUID
    const branch = await resolveBranch(branchId)
    if (!branch) notFound()

    return (
        <>
            <CaseForm branch={branch} mode="create" />
            <Toaster richColors position="top-right" />
        </>
    )
}
