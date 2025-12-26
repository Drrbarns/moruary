
import { notFound, redirect } from 'next/navigation'
import Link from 'next/link'
import { createClient } from '@/utils/supabase/server'
import { resolveBranch } from '@/lib/branch-resolver'
import { ReceiptTemplate } from '@/components/receipts/receipt-template'
import { Button } from '@/components/ui/button'
import { ArrowLeft, Printer } from 'lucide-react'

interface ReceiptPageProps {
    params: Promise<{
        branchId: string
        type: string
        refId: string
    }>
}

export default async function ReceiptPage({ params }: ReceiptPageProps) {
    const { branchId, type, refId } = await params
    const branch = await resolveBranch(branchId)
    if (!branch) notFound()

    const supabase = await createClient()

    let receiptProps: any = { branch }

    if (type === 'registration') {
        const { data: deceased, error } = await supabase
            .from('deceased_cases')
            .select('*')
            .eq('id', refId)
            .single()

        if (error || !deceased) notFound()

        receiptProps = {
            ...receiptProps,
            title: 'Official Receipt',
            receiptNo: deceased.tag_no, // Use Tag No as Receipt No for registration
            date: deceased.admission_date,
            receivedFrom: deceased.relative_name || 'Relative of ' + deceased.name_of_deceased,
            amount: deceased.registration_fee || 350,
            description: `Registration Fee for ${deceased.name_of_deceased}`,
            paymentMethod: 'CASH', // Default for initial registration
            footerNote: 'Registration complete. Thank you.',
            backLink: `/dashboard/${branch.code}/cases/${deceased.id}`
        }
    } else if (type === 'payment') {
        const { data: payment, error } = await supabase
            .from('payments')
            .select('*, deceased_cases(*)')
            .eq('id', refId)
            .single()

        if (error || !payment) notFound()

        const deceased = payment.deceased_cases

        receiptProps = {
            ...receiptProps,
            title: 'Payment Receipt',
            receiptNo: payment.receipt_no,
            date: payment.paid_on,
            receivedFrom: deceased.relative_name || 'Relative of ' + deceased.name_of_deceased,
            amount: payment.amount,
            description: `${payment.allocation} Payment for ${deceased.name_of_deceased}`,
            paymentMethod: payment.method,
            footerNote: 'Payment received with thanks.',
            backLink: `/dashboard/${branch.code}/cases/${deceased.id}` // Or finance page
        }
    } else {
        return notFound()
    }

    return (
        <div className="min-h-screen bg-gray-50 flex flex-col items-center py-12">
            <div className="w-full max-w-md mb-6 flex justify-between items-center print:hidden px-4">
                <Link href={receiptProps.backLink}>
                    <Button variant="outline" size="sm">
                        <ArrowLeft className="mr-2 h-4 w-4" />
                        Back
                    </Button>
                </Link>
                <div className="text-sm font-medium text-muted-foreground uppercase tracking-wide">
                    {type} Receipt
                </div>
            </div>

            <ReceiptTemplate {...receiptProps} />

            <div className="mt-8 text-center text-xs text-muted-foreground print:hidden">
                <p>Press Ctrl+P or use the print button above</p>
            </div>
        </div>
    )
}
