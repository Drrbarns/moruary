'use client'

import { useState } from 'react'
import { Button } from '@/components/ui/button'
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuTrigger,
    DropdownMenuSeparator,
    DropdownMenuLabel,
} from '@/components/ui/dropdown-menu'
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
import { createClient } from '@/utils/supabase/client'
import { useRouter } from 'next/navigation'
import {
    MoreHorizontal,
    CheckCircle2,
    XCircle,
    Clock,
    Calendar,
    AlertCircle,
    Edit,
    Loader2
} from 'lucide-react'
import { toast } from 'sonner'

interface AttendanceMarkerProps {
    branchId: string
    employeeId: string
    date: string
    currentStatus?: string
    clockIn?: string
    clockOut?: string
}

const statusOptions = [
    { value: 'PRESENT', label: 'Present', icon: CheckCircle2, color: 'text-green-600' },
    { value: 'ABSENT', label: 'Absent', icon: XCircle, color: 'text-red-600' },
    { value: 'LATE', label: 'Late', icon: AlertCircle, color: 'text-yellow-600' },
    { value: 'HALF_DAY', label: 'Half Day', icon: Clock, color: 'text-orange-600' },
    { value: 'ON_LEAVE', label: 'On Leave', icon: Calendar, color: 'text-blue-600' },
]

export default function AttendanceMarker({
    branchId,
    employeeId,
    date,
    currentStatus,
    clockIn,
    clockOut
}: AttendanceMarkerProps) {
    const [loading, setLoading] = useState(false)
    const [dialogOpen, setDialogOpen] = useState(false)
    const [clockInTime, setClockInTime] = useState(clockIn || '08:00')
    const [clockOutTime, setClockOutTime] = useState(clockOut || '17:00')
    const [selectedStatus, setSelectedStatus] = useState(currentStatus || 'PRESENT')
    const router = useRouter()
    const supabase = createClient()

    const markAttendance = async (status: string, withTimes = false) => {
        setLoading(true)
        try {
            const { data: { user } } = await supabase.auth.getUser()

            // Calculate hours worked
            let hoursWorked = null
            if (withTimes && clockInTime && clockOutTime) {
                const [inH, inM] = clockInTime.split(':').map(Number)
                const [outH, outM] = clockOutTime.split(':').map(Number)
                hoursWorked = (outH + outM / 60) - (inH + inM / 60)
                if (hoursWorked < 0) hoursWorked += 24 // Handle overnight shifts
            }

            const attendanceData = {
                branch_id: branchId,
                employee_id: employeeId,
                date: date,
                status: status,
                clock_in: withTimes ? clockInTime : status === 'PRESENT' || status === 'LATE' ? '08:00' : null,
                clock_out: withTimes ? clockOutTime : status === 'PRESENT' ? '17:00' : null,
                hours_worked: hoursWorked,
                marked_by: user?.id,
                updated_at: new Date().toISOString()
            }

            const { error } = await supabase
                .from('attendance')
                .upsert(attendanceData, {
                    onConflict: 'employee_id,date',
                    ignoreDuplicates: false
                })

            if (error) throw error

            toast.success(`Attendance marked as ${status}`)
            router.refresh()
            setDialogOpen(false)
        } catch (error: any) {
            console.error('Error marking attendance:', error)
            toast.error('Failed to mark attendance')
        } finally {
            setLoading(false)
        }
    }

    const quickMark = async (status: string) => {
        await markAttendance(status, false)
    }

    return (
        <>
            <DropdownMenu>
                <DropdownMenuTrigger asChild>
                    <Button
                        variant={currentStatus ? "outline" : "default"}
                        size="sm"
                        className={currentStatus ? "" : "bg-blue-600 hover:bg-blue-700"}
                        disabled={loading}
                    >
                        {loading ? (
                            <Loader2 className="h-4 w-4 animate-spin" />
                        ) : currentStatus ? (
                            <>
                                <Edit className="h-3 w-3 mr-1" />
                                Edit
                            </>
                        ) : (
                            'Mark'
                        )}
                    </Button>
                </DropdownMenuTrigger>
                <DropdownMenuContent align="end" className="w-48">
                    <DropdownMenuLabel>Quick Mark</DropdownMenuLabel>
                    <DropdownMenuSeparator />
                    {statusOptions.map((option) => (
                        <DropdownMenuItem
                            key={option.value}
                            onClick={() => quickMark(option.value)}
                            className="cursor-pointer"
                        >
                            <option.icon className={`mr-2 h-4 w-4 ${option.color}`} />
                            {option.label}
                        </DropdownMenuItem>
                    ))}
                    <DropdownMenuSeparator />
                    <DropdownMenuItem onClick={() => setDialogOpen(true)} className="cursor-pointer">
                        <Clock className="mr-2 h-4 w-4" />
                        Set Times...
                    </DropdownMenuItem>
                </DropdownMenuContent>
            </DropdownMenu>

            <Dialog open={dialogOpen} onOpenChange={setDialogOpen}>
                <DialogContent className="sm:max-w-md">
                    <DialogHeader>
                        <DialogTitle>Set Attendance Details</DialogTitle>
                        <DialogDescription>
                            Enter clock in/out times for detailed attendance tracking
                        </DialogDescription>
                    </DialogHeader>
                    <div className="space-y-4 py-4">
                        <div className="grid gap-2">
                            <Label htmlFor="status">Status</Label>
                            <select
                                id="status"
                                value={selectedStatus}
                                onChange={(e) => setSelectedStatus(e.target.value)}
                                className="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm"
                            >
                                {statusOptions.map((option) => (
                                    <option key={option.value} value={option.value}>
                                        {option.label}
                                    </option>
                                ))}
                            </select>
                        </div>
                        <div className="grid grid-cols-2 gap-4">
                            <div className="grid gap-2">
                                <Label htmlFor="clockIn">Clock In</Label>
                                <Input
                                    id="clockIn"
                                    type="time"
                                    value={clockInTime}
                                    onChange={(e) => setClockInTime(e.target.value)}
                                />
                            </div>
                            <div className="grid gap-2">
                                <Label htmlFor="clockOut">Clock Out</Label>
                                <Input
                                    id="clockOut"
                                    type="time"
                                    value={clockOutTime}
                                    onChange={(e) => setClockOutTime(e.target.value)}
                                />
                            </div>
                        </div>
                    </div>
                    <DialogFooter>
                        <Button variant="outline" onClick={() => setDialogOpen(false)}>
                            Cancel
                        </Button>
                        <Button
                            onClick={() => markAttendance(selectedStatus, true)}
                            disabled={loading}
                            className="bg-blue-600 hover:bg-blue-700"
                        >
                            {loading && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
                            Save Attendance
                        </Button>
                    </DialogFooter>
                </DialogContent>
            </Dialog>
        </>
    )
}
