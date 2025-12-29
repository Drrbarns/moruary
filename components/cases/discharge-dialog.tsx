"use client"

import { useState } from "react"
import { Button } from "@/components/ui/button"
import {
    Dialog,
    DialogContent,
    DialogDescription,
    DialogFooter,
    DialogHeader,
    DialogTitle,
    DialogTrigger,
} from "@/components/ui/dialog"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Loader2, LogOut, Printer, Truck } from "lucide-react"
import { toast } from "sonner"
import { createClient } from "@/utils/supabase/client"
import { useRouter } from "next/navigation"
import { differenceInCalendarDays } from "date-fns"
import { PRICING } from '@/lib/pricing'

interface DischargeDialogProps {
    caseId: string
    admissionDate: string
    caseType: string
    currentTotalBill: number
    totalPaid: number
    branchId: string
    tagNo: string
    name: string
}

export function DischargeDialog({
    caseId,
    admissionDate,
    caseType,
    currentTotalBill,
    totalPaid,
    branchId,
    tagNo,
    name
}: DischargeDialogProps) {
    const [open, setOpen] = useState(false)
    const [loading, setLoading] = useState(false)
    const [dischargeDate, setDischargeDate] = useState(new Date().toISOString().split('T')[0])
    const [showReceipt, setShowReceipt] = useState(false)

    // Ambulance information (optional)
    const [ambulanceNumber, setAmbulanceNumber] = useState('')
    const [ambulanceDriverName, setAmbulanceDriverName] = useState('')
    const [ambulanceCost, setAmbulanceCost] = useState('')

    // Calculations
    const start = new Date(admissionDate)
    const end = new Date(dischargeDate)

    const supabase = createClient()
    const router = useRouter()

    // Ensure at least 1 day counts
    const days = Math.max(1, differenceInCalendarDays(end, start))

    const rate = caseType === 'VIP' ? PRICING.COLD_ROOM_DAILY_RATE.VIP : PRICING.COLD_ROOM_DAILY_RATE.NORMAL
    const storageFee = days * rate

    // Note: currentTotalBill includes Reg + Emb (calculated at admission)
    const newTotalBill = currentTotalBill + storageFee
    const outstanding = newTotalBill - totalPaid

    const handleDischarge = async () => {
        setLoading(true)
        try {
            const { error } = await supabase
                .from('deceased_cases')
                .update({
                    status: 'DISCHARGED',
                    discharge_date: dischargeDate,
                    coldroom_fee: storageFee,
                    total_bill: newTotalBill,
                    balance: outstanding,
                    ambulance_number: ambulanceNumber || null,
                    ambulance_driver_name: ambulanceDriverName || null,
                    ambulance_cost: ambulanceCost ? parseFloat(ambulanceCost) : null,
                    updated_at: new Date().toISOString()
                })
                .eq('id', caseId)

            if (error) throw error

            toast.success('Body discharged successfully')
            setShowReceipt(true)
            router.refresh()
        } catch (e: any) {
            toast.error(e.message)
        } finally {
            setLoading(false)
        }
    }

    const handlePrint = () => {
        const receiptWindow = window.open('', '_blank', 'width=800,height=800')
        if (receiptWindow) {
            const htmlContent = `
                <html>
                <head>
                    <title>Discharge Receipt - ${tagNo}</title>
                    <style>
                        body { font-family: monospace; padding: 40px; max-width: 600px; margin: 0 auto; }
                        .header { text-align: center; margin-bottom: 30px; border-bottom: 2px solid #000; padding-bottom: 10px; }
                        .row { display: flex; justify-content: space-between; margin-bottom: 8px; }
                        .divider { border-bottom: 1px dashed #000; margin: 15px 0; }
                        .total { font-weight: bold; font-size: 1.1em; margin-top: 5px;}
                        .footer { margin-top: 40px; text-align: center; font-size: 0.9em; }
                    </style>
                </head>
                <body>
                    <div class="header">
                        <h2>MORTUARY DISCHARGE RECEIPT</h2>
                        <p>Tag No: ${tagNo}</p>
                        <p>Date: ${new Date().toLocaleDateString()}</p>
                    </div>
                    
                    <div class="row">
                        <span>Deceased Name:</span>
                        <span>${name}</span>
                    </div>
                    <div class="row">
                        <span>Admission Date:</span>
                        <span>${admissionDate}</span>
                    </div>
                    <div class="row">
                        <span>Discharge Date:</span>
                        <span>${dischargeDate}</span>
                    </div>
                    <div class="row">
                        <span>Duration in Custody:</span>
                        <span>${days} days</span>
                    </div>
                    <div class="row">
                        <span>Storage Type:</span>
                        <span>${caseType} (@ GHS ${rate}/day)</span>
                    </div>
                    
                    <div class="divider"></div>
                    <h3>BILLING DETAILS</h3>
                    
                    <div class="row">
                        <span>Initial Fees (Reg/Emb):</span>
                        <span>GHS ${currentTotalBill.toFixed(2)}</span>
                    </div>
                    <div class="row">
                        <span>Storage Fee:</span>
                        <span>GHS ${storageFee.toFixed(2)}</span>
                    </div>
                    <div class="row total">
                        <span>TOTAL BILL AMOUNT:</span>
                        <span>GHS ${newTotalBill.toFixed(2)}</span>
                    </div>
                    
                    <div class="divider"></div>
                    
                    <div class="row">
                        <span>Total Payments Made:</span>
                        <span>(GHS ${totalPaid.toFixed(2)})</span>
                    </div>
                    <div class="row total" style="font-size: 1.3em; margin-top: 15px;">
                        <span>BALANCE DUE:</span>
                        <span>GHS ${outstanding.toFixed(2)}</span>
                    </div>
                    
                    ${ambulanceNumber || ambulanceDriverName || ambulanceCost ? `
                    <div class="divider"></div>
                    <h3>AMBULANCE INFORMATION</h3>
                    ${ambulanceNumber ? `<div class="row"><span>Ambulance No:</span><span>${ambulanceNumber}</span></div>` : ''}
                    ${ambulanceDriverName ? `<div class="row"><span>Driver Name:</span><span>${ambulanceDriverName}</span></div>` : ''}
                    ${ambulanceCost ? `<div class="row"><span>Ambulance Cost:</span><span>GHS ${parseFloat(ambulanceCost).toFixed(2)}</span></div>` : ''}
                    ` : ''}
                    
                    <div class="footer">
                        <p>.............................................</p>
                        <p>Signature / Stamp</p>
                        <br/>
                        <p>Thank you.</p>
                    </div>
                    
                    <script>
                        window.onload = function() { window.print(); }
                    </script>
                </body>
                </html>
            `
            receiptWindow.document.write(htmlContent)
            receiptWindow.document.close()
        }
    }

    if (showReceipt) {
        return (
            <Dialog open={open} onOpenChange={setOpen}>
                <DialogContent>
                    <DialogHeader>
                        <DialogTitle>Discharge Complete</DialogTitle>
                        <DialogDescription>The case has been discharged. Please print the final bill/receipt.</DialogDescription>
                    </DialogHeader>
                    <div className="flex justify-center py-6">
                        <div className="text-center">
                            <div className="text-4xl font-bold mb-2 text-red-600">GHS {outstanding.toFixed(2)}</div>
                            <p className="text-muted-foreground">Final Balance Due</p>
                        </div>
                    </div>
                    <DialogFooter className="sm:justify-center gap-2">
                        <Button variant="outline" onClick={() => setOpen(false)}>Close</Button>
                        <Button onClick={handlePrint} className="bg-blue-600">
                            <Printer className="mr-2 h-4 w-4" />
                            Print Final Receipt
                        </Button>
                    </DialogFooter>
                </DialogContent>
            </Dialog>
        )
    }

    return (
        <Dialog open={open} onOpenChange={setOpen}>
            <DialogTrigger asChild>
                <Button className="bg-orange-600 hover:bg-orange-700">
                    <LogOut className="mr-2 h-4 w-4" />
                    Discharge Body
                </Button>
            </DialogTrigger>
            <DialogContent className="sm:max-w-[425px]">
                <DialogHeader>
                    <DialogTitle>Discharge Case</DialogTitle>
                    <DialogDescription>
                        Calculate final storage fees and close the case.
                    </DialogDescription>
                </DialogHeader>
                <div className="grid gap-4 py-4">
                    <div className="grid grid-cols-4 items-center gap-4">
                        <Label className="text-right">Discharge Date</Label>
                        <Input
                            type="date"
                            value={dischargeDate}
                            onChange={(e) => setDischargeDate(e.target.value)}
                            className="col-span-3"
                        />
                    </div>

                    <div className="bg-slate-50 p-4 rounded-lg space-y-2 text-sm">
                        <div className="flex justify-between">
                            <span className="text-muted-foreground">Duration:</span>
                            <span className="font-medium">{days} Days</span>
                        </div>
                        <div className="flex justify-between">
                            <span className="text-muted-foreground">Type/Rate:</span>
                            <span className="font-medium">{caseType} (GHS {rate}/day)</span>
                        </div>
                        <div className="flex justify-between text-blue-600 font-medium pt-2 border-t">
                            <span>Computed Storage Fee:</span>
                            <span>GHS {storageFee.toFixed(2)}</span>
                        </div>
                    </div>

                    <div className="space-y-1 pt-2">
                        <div className="flex justify-between text-sm">
                            <span>Initial Bill:</span>
                            <span>{currentTotalBill.toFixed(2)}</span>
                        </div>
                        <div className="flex justify-between font-bold text-lg">
                            <span>New Total Bill:</span>
                            <span>GHS {newTotalBill.toFixed(2)}</span>
                        </div>
                        <div className="flex justify-between text-sm text-green-600">
                            <span>Less Payments:</span>
                            <span>- {totalPaid.toFixed(2)}</span>
                        </div>
                        <div className="flex justify-between font-bold text-red-600 pt-2 border-t border-slate-200">
                            <span>Balance Due:</span>
                            <span>GHS {outstanding.toFixed(2)}</span>
                        </div>
                    </div>

                    {/* Ambulance Information Section */}
                    <div className="border-t pt-4 mt-4">
                        <div className="flex items-center gap-2 mb-3">
                            <Truck className="h-4 w-4 text-muted-foreground" />
                            <Label className="text-sm font-medium">Ambulance Information (Optional)</Label>
                        </div>
                        <div className="space-y-3">
                            <div className="grid grid-cols-2 gap-3">
                                <div>
                                    <Label className="text-xs text-muted-foreground">Ambulance Number</Label>
                                    <Input
                                        placeholder="e.g. GT-1234-20"
                                        value={ambulanceNumber}
                                        onChange={(e) => setAmbulanceNumber(e.target.value)}
                                    />
                                </div>
                                <div>
                                    <Label className="text-xs text-muted-foreground">Driver Name</Label>
                                    <Input
                                        placeholder="Driver's name"
                                        value={ambulanceDriverName}
                                        onChange={(e) => setAmbulanceDriverName(e.target.value)}
                                    />
                                </div>
                            </div>
                            <div>
                                <Label className="text-xs text-muted-foreground">Ambulance Cost (GHS)</Label>
                                <Input
                                    type="number"
                                    step="0.01"
                                    min="0"
                                    placeholder="0.00"
                                    value={ambulanceCost}
                                    onChange={(e) => setAmbulanceCost(e.target.value)}
                                />
                            </div>
                        </div>
                    </div>
                </div>
                <DialogFooter>
                    <Button variant="outline" onClick={() => setOpen(false)}>Cancel</Button>
                    <Button onClick={handleDischarge} disabled={loading} className="bg-orange-600 hover:bg-orange-700">
                        {loading && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
                        Confirm Discharge
                    </Button>
                </DialogFooter>
            </DialogContent>
        </Dialog>
    )
}
