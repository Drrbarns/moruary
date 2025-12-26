
import { Branch } from "@/lib/types"
import { Separator } from "@/components/ui/separator"
import { format } from "date-fns"

interface ReceiptTemplateProps {
    title: string
    receiptNo: string
    date: string | Date
    receivedFrom: string
    amount: number
    description: string
    branch: Branch
    paymentMethod?: string
    balanceDue?: number
    footerNote?: string
}

export function ReceiptTemplate({
    title,
    receiptNo,
    date,
    receivedFrom,
    amount,
    description,
    branch,
    paymentMethod = 'CASH',
    balanceDue,
    footerNote
}: ReceiptTemplateProps) {
    return (
        <div className="bg-white p-8 max-w-md mx-auto border shadow-sm print:shadow-none print:border-none text-sm">
            {/* Header */}
            <div className="text-center space-y-2 mb-6">
                <h1 className="text-xl font-bold uppercase tracking-wider">{branch.name}</h1>
                <div className="text-xs text-muted-foreground space-y-1">
                    <p>{branch.address || 'P.O. Box 123, Asuom'}</p>
                    <p>Tel: {branch.phone || '024 000 0000'}</p>
                </div>
                <div className="pt-2">
                    <span className="inline-block px-3 py-1 bg-black text-white text-xs font-bold uppercase tracking-widest">
                        {title}
                    </span>
                </div>
            </div>

            {/* Meta */}
            <div className="flex justify-between items-end mb-6 text-xs border-b pb-2">
                <div>
                    <p className="text-muted-foreground">Receipt No:</p>
                    <p className="font-mono font-bold text-base">{receiptNo}</p>
                </div>
                <div className="text-right">
                    <p className="text-muted-foreground">Date:</p>
                    <p className="font-medium">{format(new Date(date), 'dd/MM/yyyy')}</p>
                </div>
            </div>

            {/* Content */}
            <div className="space-y-4 mb-8">
                <div className="grid grid-cols-3 gap-2">
                    <span className="text-muted-foreground">Received From:</span>
                    <span className="col-span-2 font-medium uppercase">{receivedFrom}</span>
                </div>
                <div className="grid grid-cols-3 gap-2">
                    <span className="text-muted-foreground">The Sum of:</span>
                    <span className="col-span-2 font-medium italic">
                        GHS {amount.toFixed(2)}
                    </span>
                </div>
                <div className="grid grid-cols-3 gap-2">
                    <span className="text-muted-foreground">Payment For:</span>
                    <span className="col-span-2 font-medium">{description}</span>
                </div>
                {paymentMethod && (
                    <div className="grid grid-cols-3 gap-2">
                        <span className="text-muted-foreground">Paid Via:</span>
                        <span className="col-span-2 font-medium uppercase">{paymentMethod}</span>
                    </div>
                )}
            </div>

            <Separator className="my-6" />

            {/* Totals */}
            <div className="space-y-2">
                <div className="flex justify-between items-center text-lg font-bold">
                    <span>Amount Paid:</span>
                    <span>GHS {amount.toFixed(2)}</span>
                </div>
                {balanceDue !== undefined && (
                    <div className="flex justify-between items-center text-xs text-muted-foreground pt-1">
                        <span>Balance Due:</span>
                        <span>GHS {balanceDue.toFixed(2)}</span>
                    </div>
                )}
            </div>

            {/* Footer */}
            <div className="mt-12 pt-4 border-t border-dashed flex justify-between items-end">
                <div className="text-[10px] text-muted-foreground max-w-[50%]">
                    <p>{footerNote || 'Thank you for your business.'}</p>
                    <p className="mt-1">System Generated Receipt</p>
                </div>
                <div className="text-center">
                    <div className="border-b border-black w-32 mb-1"></div>
                    <p className="text-[10px] uppercase">Cashier Signature</p>
                </div>
            </div>

            <div className="mt-8 text-center print:hidden">
                <button
                    onClick={() => window.print()}
                    className="bg-blue-600 text-white px-4 py-2 rounded shadow hover:bg-blue-700 text-sm font-medium"
                >
                    Print Receipt
                </button>
            </div>
        </div>
    )
}
