'use client'

import { useState, useEffect } from 'react'
import { useRouter, useSearchParams } from 'next/navigation'
import { createClient } from '@/utils/supabase/client'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Card, CardContent, CardHeader, CardTitle, CardDescription, CardFooter } from '@/components/ui/card'
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from '@/components/ui/select'
import {
    Dialog,
    DialogContent,
    DialogDescription,
    DialogFooter,
    DialogHeader,
    DialogTitle,
    DialogTrigger,
} from '@/components/ui/dialog'
import { Separator } from '@/components/ui/separator'
import { Loader2, Plus, DollarSign, CheckCircle, RefreshCcw } from 'lucide-react'
import { toast } from 'sonner'
import type { DeceasedCase, Branch } from '@/lib/types'
import { calculateProjectedBill } from '@/lib/pricing'

interface AddPaymentDialogProps {
    branch: Branch
    cases: DeceasedCase[]
    preselectedCaseId?: string
    onSuccess?: () => void
}

export function AddPaymentDialog({ branch, cases, preselectedCaseId, onSuccess }: AddPaymentDialogProps) {
    const [open, setOpen] = useState(false)
    const [loading, setLoading] = useState(false)
    const [fetchingBalances, setFetchingBalances] = useState(false)
    const supabase = createClient()

    const [formData, setFormData] = useState({
        case_id: preselectedCaseId || '',
        amount: '',
        method: 'CASH',
        allocation: 'GENERAL',
    })

    const [paymentStats, setPaymentStats] = useState<{
        registrationPaid: number;
        coldroomPaid: number;
        totalPaid: number;
    }>({
        registrationPaid: 0,
        coldroomPaid: 0,
        totalPaid: 0,
    })

    const selectedCase = cases.find(c => c.id === formData.case_id)

    // Calculate display balance with projection for active cases
    let displayBalance = 0
    let isEstimated = false
    let allocationLabel = 'Outstanding Balance'

    if (selectedCase) {
        // Default Totals
        let regFee = selectedCase.registration_fee || 350
        let embFee = selectedCase.embalming_fee || 50
        let coldFee = 0
        let totalVal = selectedCase.total_bill

        if (selectedCase.status === 'IN_CUSTODY') {
            const proj = calculateProjectedBill(
                selectedCase.admission_date || selectedCase.created_at,
                (selectedCase.type as 'Normal' | 'VIP') || 'Normal',
                {
                    registration: selectedCase.registration_fee,
                    embalming: selectedCase.embalming_fee
                }
            )
            regFee = proj.registrationFee
            embFee = proj.embalmingFee
            coldFee = proj.coldRoomFee
            totalVal = proj.total
            isEstimated = true
        } else {
            // For Discharged:
            // Reg/Emb are fixed, Coldroom is total - (Reg+Emb)
            coldFee = (selectedCase.coldroom_fee || 0) + (selectedCase.storage_fee || 0) // Should match total_bill breakdown
        }

        // Determine Balance display based on Allocation
        switch (formData.allocation) {
            case 'REGISTRATION':
                displayBalance = Math.max(0, regFee - paymentStats.registrationPaid)
                allocationLabel = 'Registration Balance'
                break
            case 'COLDROOM':
                // Coldroom balance = Cold Fee - (Total Paid for Coldroom)
                // Note: Sometimes general payments might technically cover coldroom, but we'll stick to specific allocation if tracked
                // If we want strict "What is left for Coldroom", we subtract coldroomPaid.
                displayBalance = Math.max(0, coldFee - paymentStats.coldroomPaid)
                allocationLabel = 'Coldroom Balance' + (isEstimated ? ' (Est)' : '')
                break
            case 'GENERAL':
            default:
                // General balance is Total Bill - Total Paid (all allocations)
                displayBalance = totalVal - (paymentStats.totalPaid > 0 ? paymentStats.totalPaid : (selectedCase.total_paid || 0))
                // If we successfully fetched payments, use updated totalPaid, else fallback to case.total_paid
                break
        }
    }

    // Fetch payments when case is selected
    useEffect(() => {
        const fetchPayments = async () => {
            if (!formData.case_id) return

            setFetchingBalances(true)
            const { data: payments } = await supabase
                .from('payments')
                .select('amount, allocation')
                .eq('case_id', formData.case_id)

            if (payments) {
                const stats = payments.reduce((acc, p) => {
                    const amt = p.amount || 0
                    if (p.allocation === 'EMBALMING') return acc // Skip embalming payments for total calc to match bill
                    acc.totalPaid += amt
                    if (p.allocation === 'REGISTRATION') acc.registrationPaid += amt
                    else if (p.allocation === 'COLDROOM') acc.coldroomPaid += amt
                    return acc
                }, { registrationPaid: 0, coldroomPaid: 0, totalPaid: 0 })

                setPaymentStats(stats)
            }
            setFetchingBalances(false)
        }

        fetchPayments()
    }, [formData.case_id])

    useEffect(() => {
        if (preselectedCaseId) {
            setFormData(prev => ({ ...prev, case_id: preselectedCaseId }))
            setOpen(true)
        }
    }, [preselectedCaseId])

    const handleChange = (field: string, value: string) => {
        setFormData(prev => ({ ...prev, [field]: value }))
    }

    const handleSubmit = async () => {
        if (!formData.case_id || !formData.amount) {
            toast.error('Please fill all required fields')
            return
        }

        setLoading(true)

        try {
            // Get the case for current balance
            const targetCase = cases.find(c => c.id === formData.case_id)
            if (!targetCase) throw new Error('Case not found')

            const paymentAmount = Number(formData.amount)

            // Insert payment
            const { error: paymentError } = await supabase
                .from('payments')
                .insert({
                    branch_id: branch.id,
                    case_id: formData.case_id,
                    amount: paymentAmount,
                    method: formData.method,
                    allocation: formData.allocation,
                    receipt_no: `PMT-${Date.now()}`,
                    paid_on: new Date().toISOString(),
                })

            if (paymentError) throw paymentError

            // Update case totals
            const newTotalPaid = (targetCase.total_paid || 0) + paymentAmount
            // Note: We use the existing logic for balance update. 
            // If the user pays specifically for "Registration", it still reduces the overall balance on the case record.
            // The case record 'balance' is always Total Bill - Total Paid.
            const newBalance = targetCase.total_bill - newTotalPaid

            const { error: updateError } = await supabase
                .from('deceased_cases')
                .update({
                    total_paid: newTotalPaid,
                    balance: newBalance,
                    updated_at: new Date().toISOString(),
                })
                .eq('id', formData.case_id)

            if (updateError) throw updateError

            toast.success('Payment recorded successfully', {
                description: `GHS ${paymentAmount.toFixed(2)} received`,
            })

            setOpen(false)
            setFormData({ case_id: '', amount: '', method: 'CASH', allocation: 'GENERAL' })
            onSuccess?.()
        } catch (error: any) {
            toast.error('Failed to record payment', {
                description: error.message,
            })
        } finally {
            setLoading(false)
        }
    }

    return (
        <Dialog open={open} onOpenChange={setOpen}>
            <DialogTrigger asChild>
                <Button className="bg-green-600 hover:bg-green-700">
                    <Plus className="mr-2 h-4 w-4" />
                    Add Payment
                </Button>
            </DialogTrigger>
            <DialogContent className="sm:max-w-[500px]">
                <DialogHeader>
                    <DialogTitle className="flex items-center gap-2">
                        <DollarSign className="h-5 w-5 text-green-600" />
                        Record Payment
                    </DialogTitle>
                    <DialogDescription>
                        Record a new payment against a case
                    </DialogDescription>
                </DialogHeader>

                <div className="space-y-4 py-4">
                    {/* Case Selection */}
                    <div className="space-y-2">
                        <Label>Select Case *</Label>
                        <Select value={formData.case_id} onValueChange={(v) => handleChange('case_id', v)}>
                            <SelectTrigger>
                                <SelectValue placeholder="Choose a case..." />
                            </SelectTrigger>
                            <SelectContent>
                                {cases.filter(c => c.status === 'IN_CUSTODY').map((c) => (
                                    <SelectItem key={c.id} value={c.id}>
                                        <span className="font-mono">{c.tag_no}</span> - {c.name_of_deceased}
                                    </SelectItem>
                                ))}
                            </SelectContent>
                        </Select>
                    </div>

                    {/* Show case balance */}
                    {selectedCase && (
                        <div className="bg-slate-50 dark:bg-slate-800 rounded-lg p-3 text-sm transition-all">
                            <div className="flex justify-between items-center">
                                <span className="text-muted-foreground flex items-center gap-1">
                                    {allocationLabel}:
                                    {isEstimated && formData.allocation === 'GENERAL' && <span className="text-[10px] bg-blue-100 text-blue-700 px-1 rounded-sm">EST</span>}
                                    {fetchingBalances && <RefreshCcw className="h-3 w-3 animate-spin ml-2" />}
                                </span>
                                <span className={`font-bold ${displayBalance > 0 ? 'text-red-600' : 'text-green-600'}`}>
                                    GHS {displayBalance.toFixed(2)}
                                </span>
                            </div>
                            {isEstimated && formData.allocation !== 'REGISTRATION' && (
                                <p className="text-xs text-muted-foreground mt-1 text-right">
                                    Includes accrued daily charges
                                </p>
                            )}
                        </div>
                    )}

                    {/* Amount */}
                    <div className="space-y-2">
                        <Label htmlFor="amount">Amount (GHS) *</Label>
                        <Input
                            id="amount"
                            type="number"
                            step="0.01"
                            placeholder="0.00"
                            value={formData.amount}
                            onChange={(e) => handleChange('amount', e.target.value)}
                        />
                    </div>

                    {/* Payment Method */}
                    <div className="grid grid-cols-2 gap-4">
                        <div className="space-y-2">
                            <Label>Payment Method</Label>
                            <Select value={formData.method} onValueChange={(v) => handleChange('method', v)}>
                                <SelectTrigger>
                                    <SelectValue />
                                </SelectTrigger>
                                <SelectContent>
                                    <SelectItem value="CASH">Cash</SelectItem>
                                    <SelectItem value="MOMO">Mobile Money</SelectItem>
                                    <SelectItem value="BANK">Bank Transfer</SelectItem>
                                    <SelectItem value="CARD">Card</SelectItem>
                                </SelectContent>
                            </Select>
                        </div>
                        <div className="space-y-2">
                            <Label>Allocation</Label>
                            <Select value={formData.allocation} onValueChange={(v) => handleChange('allocation', v)}>
                                <SelectTrigger>
                                    <SelectValue />
                                </SelectTrigger>
                                <SelectContent>
                                    <SelectItem value="GENERAL">General</SelectItem>
                                    <SelectItem value="REGISTRATION">Registration</SelectItem>
                                    <SelectItem value="COLDROOM">Coldroom</SelectItem>
                                </SelectContent>
                            </Select>
                        </div>
                    </div>
                </div>

                <DialogFooter>
                    <Button variant="outline" onClick={() => setOpen(false)}>Cancel</Button>
                    <Button onClick={handleSubmit} disabled={loading} className="bg-green-600 hover:bg-green-700">
                        {loading ? <Loader2 className="mr-2 h-4 w-4 animate-spin" /> : <CheckCircle className="mr-2 h-4 w-4" />}
                        Record Payment
                    </Button>
                </DialogFooter>
            </DialogContent>
        </Dialog>
    )
}
