'use client'

import { useState } from 'react'
import { Button } from '@/components/ui/button'
import {
    Dialog,
    DialogContent,
    DialogDescription,
    DialogFooter,
    DialogHeader,
    DialogTitle,
} from '@/components/ui/dialog'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Textarea } from '@/components/ui/textarea'
import { createClient } from '@/utils/supabase/client'
import { useRouter } from 'next/navigation'
import { Plus, Loader2 } from 'lucide-react'
import { toast } from 'sonner'
import { differenceInDays, parseISO } from 'date-fns'

interface NewLeaveRequestButtonProps {
    branchId: string
    staff: any[]
    leaveTypes: any[]
}

export default function NewLeaveRequestButton({ branchId, staff, leaveTypes }: NewLeaveRequestButtonProps) {
    const [loading, setLoading] = useState(false)
    const [dialogOpen, setDialogOpen] = useState(false)
    const [employeeId, setEmployeeId] = useState('')
    const [leaveTypeId, setLeaveTypeId] = useState('')
    const [startDate, setStartDate] = useState('')
    const [endDate, setEndDate] = useState('')
    const [reason, setReason] = useState('')
    const router = useRouter()
    const supabase = createClient()

    const calculateDays = () => {
        if (!startDate || !endDate) return 0
        const start = parseISO(startDate)
        const end = parseISO(endDate)
        return Math.max(1, differenceInDays(end, start) + 1)
    }

    const createLeaveRequest = async () => {
        if (!employeeId || !leaveTypeId || !startDate || !endDate) {
            toast.error('Please fill in all required fields')
            return
        }

        setLoading(true)
        try {
            const daysRequested = calculateDays()

            const { error } = await supabase
                .from('leave_requests')
                .insert({
                    branch_id: branchId,
                    employee_id: employeeId,
                    leave_type_id: leaveTypeId,
                    start_date: startDate,
                    end_date: endDate,
                    days_requested: daysRequested,
                    reason: reason,
                    status: 'PENDING'
                })

            if (error) throw error

            toast.success('Leave request submitted successfully')
            setDialogOpen(false)
            resetForm()
            router.refresh()
        } catch (error: any) {
            console.error('Error creating leave request:', error)
            toast.error('Failed to submit leave request')
        } finally {
            setLoading(false)
        }
    }

    const resetForm = () => {
        setEmployeeId('')
        setLeaveTypeId('')
        setStartDate('')
        setEndDate('')
        setReason('')
    }

    return (
        <>
            <Button onClick={() => setDialogOpen(true)} className="bg-blue-600 hover:bg-blue-700">
                <Plus className="mr-2 h-4 w-4" />
                New Leave Request
            </Button>

            <Dialog open={dialogOpen} onOpenChange={(open) => { setDialogOpen(open); if (!open) resetForm() }}>
                <DialogContent className="sm:max-w-lg">
                    <DialogHeader>
                        <DialogTitle>New Leave Request</DialogTitle>
                        <DialogDescription>
                            Submit a leave request for an employee
                        </DialogDescription>
                    </DialogHeader>
                    <div className="space-y-4 py-4">
                        <div className="grid gap-2">
                            <Label htmlFor="employee">Employee *</Label>
                            <select
                                id="employee"
                                value={employeeId}
                                onChange={(e) => setEmployeeId(e.target.value)}
                                className="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm"
                            >
                                <option value="">Select employee</option>
                                {staff.map((s) => (
                                    <option key={s.id} value={s.id}>{s.full_name}</option>
                                ))}
                            </select>
                        </div>

                        <div className="grid gap-2">
                            <Label htmlFor="leaveType">Leave Type *</Label>
                            <select
                                id="leaveType"
                                value={leaveTypeId}
                                onChange={(e) => setLeaveTypeId(e.target.value)}
                                className="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm"
                            >
                                <option value="">Select leave type</option>
                                {leaveTypes.map((lt) => (
                                    <option key={lt.id} value={lt.id}>
                                        {lt.name} {!lt.is_paid && '(Unpaid)'}
                                    </option>
                                ))}
                            </select>
                        </div>

                        <div className="grid grid-cols-2 gap-4">
                            <div className="grid gap-2">
                                <Label htmlFor="startDate">Start Date *</Label>
                                <Input
                                    id="startDate"
                                    type="date"
                                    value={startDate}
                                    onChange={(e) => setStartDate(e.target.value)}
                                />
                            </div>
                            <div className="grid gap-2">
                                <Label htmlFor="endDate">End Date *</Label>
                                <Input
                                    id="endDate"
                                    type="date"
                                    value={endDate}
                                    onChange={(e) => setEndDate(e.target.value)}
                                    min={startDate}
                                />
                            </div>
                        </div>

                        {startDate && endDate && (
                            <div className="text-sm text-muted-foreground bg-slate-50 p-3 rounded-md">
                                Total days requested: <span className="font-semibold">{calculateDays()}</span>
                            </div>
                        )}

                        <div className="grid gap-2">
                            <Label htmlFor="reason">Reason</Label>
                            <Textarea
                                id="reason"
                                placeholder="Brief explanation for the leave request..."
                                value={reason}
                                onChange={(e) => setReason(e.target.value)}
                                rows={3}
                            />
                        </div>
                    </div>
                    <DialogFooter>
                        <Button variant="outline" onClick={() => setDialogOpen(false)}>
                            Cancel
                        </Button>
                        <Button
                            onClick={createLeaveRequest}
                            disabled={loading || !employeeId || !leaveTypeId || !startDate || !endDate}
                            className="bg-blue-600 hover:bg-blue-700"
                        >
                            {loading && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
                            Submit Request
                        </Button>
                    </DialogFooter>
                </DialogContent>
            </Dialog>
        </>
    )
}
