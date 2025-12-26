'use client'

import { useState } from 'react'
import { createClient } from '@/utils/supabase/client'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import {
    Dialog,
    DialogContent,
    DialogDescription,
    DialogFooter,
    DialogHeader,
    DialogTitle,
    DialogTrigger,
} from '@/components/ui/dialog'
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from '@/components/ui/select'
import { Loader2, Plus, ArrowUpRight, ArrowDownLeft } from 'lucide-react'
import { toast } from 'sonner'
import type { Branch } from '@/lib/types'

interface AddBankTransactionDialogProps {
    branch: Branch
    onSuccess?: () => void
}

export function AddBankTransactionDialog({ branch, onSuccess }: AddBankTransactionDialogProps) {
    const [open, setOpen] = useState(false)
    const [loading, setLoading] = useState(false)
    const supabase = createClient()

    const [formData, setFormData] = useState({
        type: 'DEPOSIT',
        amount: '',
        description: '',
        transaction_date: new Date().toISOString().split('T')[0]
    })

    const handleChange = (field: string, value: string) => {
        setFormData(prev => ({ ...prev, [field]: value }))
    }

    const handleSubmit = async () => {
        if (!formData.amount || !formData.transaction_date) {
            toast.error('Please fill all required fields')
            return
        }

        setLoading(true)

        try {
            const { data: { user } } = await supabase.auth.getUser()
            if (!user) throw new Error('Not authenticated')

            const { error } = await supabase
                .from('bank_transactions')
                .insert({
                    branch_id: branch.id,
                    type: formData.type,
                    amount: Number(formData.amount),
                    description: formData.description,
                    transaction_date: new Date(formData.transaction_date).toISOString(),
                    performed_by: user.id
                })

            if (error) throw error

            toast.success('Transaction recorded successfully')
            setOpen(false)
            setFormData({
                type: 'DEPOSIT',
                amount: '',
                description: '',
                transaction_date: new Date().toISOString().split('T')[0]
            })
            onSuccess?.()
        } catch (error: any) {
            toast.error('Failed to record transaction', {
                description: error.message,
            })
        } finally {
            setLoading(false)
        }
    }

    return (
        <Dialog open={open} onOpenChange={setOpen}>
            <DialogTrigger asChild>
                <Button variant="outline" className="border-dashed">
                    <Plus className="mr-2 h-4 w-4" />
                    Bank Transaction
                </Button>
            </DialogTrigger>
            <DialogContent className="sm:max-w-[425px]">
                <DialogHeader>
                    <DialogTitle>Record Bank Transaction</DialogTitle>
                    <DialogDescription>
                        Record a deposit or withdrawal from the bank account
                    </DialogDescription>
                </DialogHeader>

                <div className="space-y-4 py-4">
                    <div className="space-y-2">
                        <Label>Transaction Type</Label>
                        <Select
                            value={formData.type}
                            onValueChange={(v) => handleChange('type', v)}
                        >
                            <SelectTrigger>
                                <SelectValue />
                            </SelectTrigger>
                            <SelectContent>
                                <SelectItem value="DEPOSIT">
                                    <div className="flex items-center text-green-600">
                                        <ArrowUpRight className="mr-2 h-4 w-4" />
                                        Deposit (In)
                                    </div>
                                </SelectItem>
                                <SelectItem value="WITHDRAWAL">
                                    <div className="flex items-center text-red-600">
                                        <ArrowDownLeft className="mr-2 h-4 w-4" />
                                        Withdrawal (Out)
                                    </div>
                                </SelectItem>
                            </SelectContent>
                        </Select>
                    </div>

                    <div className="space-y-2">
                        <Label htmlFor="date">Date</Label>
                        <Input
                            id="date"
                            type="date"
                            value={formData.transaction_date}
                            onChange={(e) => handleChange('transaction_date', e.target.value)}
                        />
                    </div>

                    <div className="space-y-2">
                        <Label htmlFor="amount">Amount (GHS)</Label>
                        <Input
                            id="amount"
                            type="number"
                            step="0.01"
                            placeholder="0.00"
                            value={formData.amount}
                            onChange={(e) => handleChange('amount', e.target.value)}
                        />
                    </div>

                    <div className="space-y-2">
                        <Label htmlFor="description">Description (Optional)</Label>
                        <Input
                            id="description"
                            placeholder="e.g. Weekly sales deposit"
                            value={formData.description}
                            onChange={(e) => handleChange('description', e.target.value)}
                        />
                    </div>
                </div>

                <DialogFooter>
                    <Button variant="outline" onClick={() => setOpen(false)}>Cancel</Button>
                    <Button onClick={handleSubmit} disabled={loading}>
                        {loading && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
                        Save Transaction
                    </Button>
                </DialogFooter>
            </DialogContent>
        </Dialog>
    )
}
