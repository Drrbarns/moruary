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
import { Loader2, Plus, DollarSign, CheckCircle } from 'lucide-react'
import { toast } from 'sonner'
import type { DeceasedCase, Branch } from '@/lib/types'

interface AddPaymentDialogProps {
    branch: Branch
    cases: DeceasedCase[]
    preselectedCaseId?: string
    onSuccess?: () => void
}

export function AddPaymentDialog({ branch, cases, preselectedCaseId, onSuccess }: AddPaymentDialogProps) {
    const [open, setOpen] = useState(false)
    const [loading, setLoading] = useState(false)
    const supabase = createClient()

    const [formData, setFormData] = useState({
        case_id: preselectedCaseId || '',
        amount: '',
        method: 'CASH',
        allocation: 'GENERAL',
    })

    const selectedCase = cases.find(c => c.id === formData.case_id)

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
                    receipt_no: `PMT-${Date.now()}`, // Temporary; should use proper sequence
                    paid_on: new Date().toISOString(),
                })

            if (paymentError) throw paymentError

            // Update case totals
            const newTotalPaid = targetCase.total_paid + paymentAmount
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
                        <div className="bg-slate-50 dark:bg-slate-800 rounded-lg p-3 text-sm">
                            <div className="flex justify-between">
                                <span className="text-muted-foreground">Outstanding Balance:</span>
                                <span className={`font-bold ${selectedCase.balance > 0 ? 'text-red-600' : 'text-green-600'}`}>
                                    GHS {selectedCase.balance.toFixed(2)}
                                </span>
                            </div>
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
                                    <SelectItem value="EMBALMING">Embalming</SelectItem>
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
