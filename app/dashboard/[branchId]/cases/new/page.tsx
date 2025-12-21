import { CaseForm } from '@/components/cases/case-form'
import { Toaster } from '@/components/ui/sonner'

export default async function NewCasePage({ params }: { params: Promise<{ branchId: string }> }) {
    const { branchId } = await params

    return (
        <>
            <CaseForm branchId={branchId} mode="create" />
            <Toaster richColors position="top-right" />
        </>
    )
}
