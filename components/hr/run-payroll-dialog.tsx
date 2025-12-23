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
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from "@/components/ui/select"
import { Label } from "@/components/ui/label"
import { Loader2, PlayCircle } from "lucide-react"
import { toast } from "sonner"
import { runPayrollAction } from "@/app/actions/run-payroll"

export function RunPayrollDialog({ branchId }: { branchId: string }) {
    const [open, setOpen] = useState(false)
    const [loading, setLoading] = useState(false)

    const today = new Date()
    const [month, setMonth] = useState(today.getMonth() + 1) // 1-12
    const [year, setYear] = useState(today.getFullYear())

    const handleRun = async () => {
        setLoading(true)
        try {
            const res = await runPayrollAction(branchId, month, year)
            if (res.error) {
                toast.error(res.error)
            } else {
                toast.success('Payroll run created successfully!')
                setOpen(false)
            }
        } catch (e) {
            toast.error('Failed to run payroll')
        } finally {
            setLoading(false)
        }
    }

    return (
        <Dialog open={open} onOpenChange={setOpen}>
            <DialogTrigger asChild>
                <Button className="bg-green-600 hover:bg-green-700">
                    <PlayCircle className="mr-2 h-4 w-4" />
                    Run Payroll
                </Button>
            </DialogTrigger>
            <DialogContent>
                <DialogHeader>
                    <DialogTitle>Run Payroll</DialogTitle>
                    <DialogDescription>
                        Generate payslips for all active employees for the selected period.
                    </DialogDescription>
                </DialogHeader>
                <div className="grid grid-cols-2 gap-4 py-4">
                    <div className="space-y-2">
                        <Label>Month</Label>
                        <Select value={month.toString()} onValueChange={v => setMonth(parseInt(v))}>
                            <SelectTrigger>
                                <SelectValue />
                            </SelectTrigger>
                            <SelectContent>
                                {Array.from({ length: 12 }, (_, i) => (
                                    <SelectItem key={i + 1} value={(i + 1).toString()}>
                                        {new Date(2024, i, 1).toLocaleString('default', { month: 'long' })}
                                    </SelectItem>
                                ))}
                            </SelectContent>
                        </Select>
                    </div>
                    <div className="space-y-2">
                        <Label>Year</Label>
                        <Select value={year.toString()} onValueChange={v => setYear(parseInt(v))}>
                            <SelectTrigger>
                                <SelectValue />
                            </SelectTrigger>
                            <SelectContent>
                                <SelectItem value="2024">2024</SelectItem>
                                <SelectItem value="2025">2025</SelectItem>
                                <SelectItem value="2026">2026</SelectItem>
                            </SelectContent>
                        </Select>
                    </div>
                </div>
                <DialogFooter>
                    <Button variant="outline" onClick={() => setOpen(false)}>Cancel</Button>
                    <Button onClick={handleRun} disabled={loading} className="bg-green-600">
                        {loading && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
                        Generate
                    </Button>
                </DialogFooter>
            </DialogContent>
        </Dialog>
    )
}
