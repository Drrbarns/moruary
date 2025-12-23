"use client"

import { useState } from "react"
import { useRouter } from "next/navigation"
import { createClient } from "@/utils/supabase/client"
import {
    Dialog,
    DialogContent,
    DialogDescription,
    DialogFooter,
    DialogHeader,
    DialogTitle,
    DialogTrigger,
} from "@/components/ui/dialog"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Checkbox } from "@/components/ui/checkbox"
import { Loader2 } from "lucide-react"
import { toast } from "sonner"
import { SalaryStructure } from "@/lib/types"

interface SalaryStructureDialogProps {
    branchId: string
    structure?: SalaryStructure
    children: React.ReactNode
}

export function SalaryStructureDialog({ branchId, structure, children }: SalaryStructureDialogProps) {
    const [open, setOpen] = useState(false)
    const [loading, setLoading] = useState(false)
    const router = useRouter()
    const supabase = createClient()

    const [formData, setFormData] = useState({
        name: structure?.name || "",
        base_salary: structure?.base_salary || 0,
        transport_allowance: structure?.transport_allowance || 0,
        housing_allowance: structure?.housing_allowance || 0,
        meal_allowance: structure?.meal_allowance || 0,
        utility_allowance: structure?.utility_allowance || 0,
        apply_ssnit: structure?.apply_ssnit ?? true,
        apply_paye: structure?.apply_paye ?? true,
    })

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault()
        setLoading(true)

        try {
            const dataToSave = {
                branch_id: branchId,
                name: formData.name,
                base_salary: Number(formData.base_salary),
                transport_allowance: Number(formData.transport_allowance),
                housing_allowance: Number(formData.housing_allowance),
                meal_allowance: Number(formData.meal_allowance),
                utility_allowance: Number(formData.utility_allowance),
                apply_ssnit: formData.apply_ssnit,
                apply_paye: formData.apply_paye,
            }

            if (structure) {
                const { error } = await supabase
                    .from('salary_structures')
                    .update({ ...dataToSave, updated_at: new Date().toISOString() })
                    .eq('id', structure.id)
                if (error) throw error
                toast.success('Structure updated successfully')
            } else {
                const { error } = await supabase
                    .from('salary_structures')
                    .insert(dataToSave)
                if (error) throw error
                toast.success('Structure created successfully')
            }

            setOpen(false)
            router.refresh()
        } catch (error: any) {
            toast.error('Failed to save structure', { description: error.message })
        } finally {
            setLoading(false)
        }
    }

    return (
        <Dialog open={open} onOpenChange={setOpen}>
            <DialogTrigger asChild>
                {children}
            </DialogTrigger>
            <DialogContent className="sm:max-w-[600px]">
                <form onSubmit={handleSubmit}>
                    <DialogHeader>
                        <DialogTitle>{structure ? 'Edit Salary Structure' : 'Create Salary Structure'}</DialogTitle>
                        <DialogDescription>
                            Define the base salary and standard allowances for this role template.
                        </DialogDescription>
                    </DialogHeader>

                    <div className="grid gap-4 py-4">
                        <div className="grid gap-2">
                            <Label htmlFor="name">Structure Name</Label>
                            <Input
                                id="name"
                                placeholder="e.g. Senior Nurse, Junior Driver"
                                value={formData.name}
                                onChange={(e) => setFormData({ ...formData, name: e.target.value })}
                                required
                            />
                        </div>

                        <div className="grid grid-cols-2 gap-4">
                            <div className="grid gap-2">
                                <Label htmlFor="base">Base Salary (GHS)</Label>
                                <Input
                                    id="base"
                                    type="number"
                                    step="0.01"
                                    value={formData.base_salary}
                                    onChange={(e) => setFormData({ ...formData, base_salary: parseFloat(e.target.value) || 0 })}
                                />
                            </div>
                        </div>

                        <div className="border rounded-md p-4 space-y-4 bg-slate-50 dark:bg-slate-900/50">
                            <h4 className="text-sm font-medium mb-2">Monthly Allowances</h4>
                            <div className="grid grid-cols-2 gap-4">
                                <div className="grid gap-2">
                                    <Label htmlFor="transport">Transport</Label>
                                    <Input
                                        id="transport"
                                        type="number" step="0.01"
                                        value={formData.transport_allowance}
                                        onChange={(e) => setFormData({ ...formData, transport_allowance: parseFloat(e.target.value) || 0 })}
                                    />
                                </div>
                                <div className="grid gap-2">
                                    <Label htmlFor="housing">Housing</Label>
                                    <Input
                                        id="housing"
                                        type="number" step="0.01"
                                        value={formData.housing_allowance}
                                        onChange={(e) => setFormData({ ...formData, housing_allowance: parseFloat(e.target.value) || 0 })}
                                    />
                                </div>
                                <div className="grid gap-2">
                                    <Label htmlFor="meal">Meal</Label>
                                    <Input
                                        id="meal"
                                        type="number" step="0.01"
                                        value={formData.meal_allowance}
                                        onChange={(e) => setFormData({ ...formData, meal_allowance: parseFloat(e.target.value) || 0 })}
                                    />
                                </div>
                                <div className="grid gap-2">
                                    <Label htmlFor="utility">Utility</Label>
                                    <Input
                                        id="utility"
                                        type="number" step="0.01"
                                        value={formData.utility_allowance}
                                        onChange={(e) => setFormData({ ...formData, utility_allowance: parseFloat(e.target.value) || 0 })}
                                    />
                                </div>
                            </div>
                        </div>

                        <div className="flex flex-col gap-3">
                            <div className="flex items-center space-x-2">
                                <Checkbox
                                    id="ssnit"
                                    checked={formData.apply_ssnit}
                                    onCheckedChange={(c) => setFormData({ ...formData, apply_ssnit: !!c })}
                                />
                                <Label htmlFor="ssnit">Apply SSNIT Deductions</Label>
                            </div>
                            <div className="flex items-center space-x-2">
                                <Checkbox
                                    id="paye"
                                    checked={formData.apply_paye}
                                    onCheckedChange={(c) => setFormData({ ...formData, apply_paye: !!c })}
                                />
                                <Label htmlFor="paye">Apply PAYE Tax</Label>
                            </div>
                        </div>

                        <div className="bg-blue-50 dark:bg-blue-900/20 p-3 rounded text-sm flex justify-between font-semibold">
                            <span>Total Gross Salary:</span>
                            <span>GHS {(
                                Number(formData.base_salary) +
                                Number(formData.transport_allowance) +
                                Number(formData.housing_allowance) +
                                Number(formData.meal_allowance) +
                                Number(formData.utility_allowance)
                            ).toFixed(2)}</span>
                        </div>
                    </div>

                    <DialogFooter>
                        <Button type="button" variant="outline" onClick={() => setOpen(false)}>Cancel</Button>
                        <Button type="submit" disabled={loading}>
                            {loading && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
                            Save Structure
                        </Button>
                    </DialogFooter>
                </form>
            </DialogContent>
        </Dialog>
    )
}
