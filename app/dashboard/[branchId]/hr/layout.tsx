import HRLayout from '@/components/hr/hr-layout'

export default async function HRSectionLayout({
    children,
    params,
}: {
    children: React.ReactNode
    params: Promise<{ branchId: string }>
}) {
    const { branchId } = await params

    return (
        <HRLayout branchId={branchId}>
            {children}
        </HRLayout>
    )
}
