'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import { createClient } from '@/utils/supabase/client'
import { Button } from '@/components/ui/button'
import {
    Dialog,
    DialogContent,
    DialogDescription,
    DialogFooter,
    DialogHeader,
    DialogTitle,
    DialogTrigger,
} from '@/components/ui/dialog'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Textarea } from '@/components/ui/textarea'
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from '@/components/ui/select'
import { toast } from 'sonner'
import { MinusCircle, Loader2 } from 'lucide-react'
import type { Branch, ExpenseCategory } from '@/lib/types'

interface AddExpenseDialogProps {
    branch: Branch
}

const expenseCategories: { value: ExpenseCategory; label: string }[] = [
    { value: 'UTILITIES', label: 'Utilities (Electricity, Water, etc.)' },
    { value: 'SUPPLIES', label: 'Supplies (Chemicals, Materials)' },
    { value: 'MAINTENANCE', label: 'Maintenance & Repairs' },
    { value: 'SALARY', label: 'Salary & Wages' },
    { value: 'TRANSPORT', label: 'Transport & Logistics' },
    { value: 'FUEL', label: 'Fuel & Energy' },
    { value: 'OTHER', label: 'Other Expenses' },
]

export function AddExpenseDialog({ branch }: AddExpenseDialogProps) {
    const [open, setOpen] = useState(false)
    const [loading, setLoading] = useState(false)
    const [category, setCategory] = useState<ExpenseCategory | ''>('')
    const [description, setDescription] = useState('')
    const [amount, setAmount] = useState('')
    const [expenseDate, setExpenseDate] = useState(new Date().toISOString().split('T')[0])

    const router = useRouter()
    const supabase = createClient()

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault()

        if (!category) {
            toast.error('Please select an expense category')
            return
        }

        if (!description.trim()) {
            toast.error('Please enter a description')
            return
        }

        const amountNum = parseFloat(amount)
        if (isNaN(amountNum) || amountNum <= 0) {
            toast.error('Please enter a valid amount')
            return
        }

        setLoading(true)

        try {
            const { data: { user } } = await supabase.auth.getUser()
            if (!user) throw new Error('Not authenticated')

            const { error } = await supabase
                .from('expenses')
                .insert({
                    branch_id: branch.id,
                    category,
                    description: description.trim(),
                    amount: amountNum,
                    expense_date: expenseDate,
                    recorded_by: user.id,
                })

            if (error) throw error

            toast.success('Expense recorded successfully!')
            setOpen(false)
            resetForm()
            router.refresh()
        } catch (error: any) {
            console.error('Error recording expense:', error)
            toast.error(error.message || 'Failed to record expense')
        } finally {
            setLoading(false)
        }
    }

    const resetForm = () => {
        setCategory('')
        setDescription('')
        setAmount('')
        setExpenseDate(new Date().toISOString().split('T')[0])
    }

    return (
        <Dialog open={open} onOpenChange={setOpen}>
            <DialogTrigger asChild>
                <Button variant="outline" className="border-red-200 text-red-600 hover:bg-red-50">
                    <MinusCircle className="mr-2 h-4 w-4" />
                    Add Expense
                </Button>
            </DialogTrigger>
            <DialogContent className="sm:max-w-[500px]">
                <form onSubmit={handleSubmit}>
                    <DialogHeader>
                        <DialogTitle>Record Expense</DialogTitle>
                        <DialogDescription>
                            Track business expenses for {branch.name}
                        </DialogDescription>
                    </DialogHeader>
                    <div className="grid gap-4 py-4">
                        <div className="space-y-2">
                            <Label htmlFor="category">Category *</Label>
                            <Select
                                value={category}
                                onValueChange={(val) => setCategory(val as ExpenseCategory)}
                            >
                                <SelectTrigger>
                                    <SelectValue placeholder="Select expense category" />
                                </SelectTrigger>
                                <SelectContent>
                                    {expenseCategories.map((cat) => (
                                        <SelectItem key={cat.value} value={cat.value}>
                                            {cat.label}
                                        </SelectItem>
                                    ))}
                                </SelectContent>
                            </Select>
                        </div>

                        <div className="space-y-2">
                            <Label htmlFor="description">Description *</Label>
                            <Textarea
                                id="description"
                                placeholder="Enter expense details..."
                                value={description}
                                onChange={(e) => setDescription(e.target.value)}
                                rows={2}
                            />
                        </div>

                        <div className="grid grid-cols-2 gap-4">
                            <div className="space-y-2">
                                <Label htmlFor="amount">Amount (GHS) *</Label>
                                <Input
                                    id="amount"
                                    type="number"
                                    step="0.01"
                                    min="0"
                                    placeholder="0.00"
                                    value={amount}
                                    onChange={(e) => setAmount(e.target.value)}
                                />
                            </div>

                            <div className="space-y-2">
                                <Label htmlFor="date">Date *</Label>
                                <Input
                                    id="date"
                                    type="date"
                                    value={expenseDate}
                                    onChange={(e) => setExpenseDate(e.target.value)}
                                />
                            </div>
                        </div>
                    </div>
                    <DialogFooter>
                        <Button
                            type="button"
                            variant="outline"
                            onClick={() => setOpen(false)}
                            disabled={loading}
                        >
                            Cancel
                        </Button>
                        <Button type="submit" disabled={loading} className="bg-red-600 hover:bg-red-700">
                            {loading && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
                            Record Expense
                        </Button>
                    </DialogFooter>
                </form>
            </DialogContent>
        </Dialog>
    )
}
