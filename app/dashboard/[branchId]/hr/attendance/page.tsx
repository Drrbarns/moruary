import { createClient } from '@/utils/supabase/server'
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import {
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from '@/components/ui/table'
import {
    CalendarCheck,
    CalendarX,
    Clock,
    UserCheck,
    Users,
    ChevronLeft,
    ChevronRight,
    CheckCircle2,
    XCircle,
    AlertCircle,
    Calendar
} from 'lucide-react'
import Link from 'next/link'
import { format, startOfMonth, endOfMonth, eachDayOfInterval, isWeekend, isSameDay, parseISO } from 'date-fns'
import AttendanceMarker from '@/components/hr/attendance-marker'

export default async function AttendancePage({
    params,
    searchParams
}: {
    params: Promise<{ branchId: string }>
    searchParams: Promise<{ date?: string }>
}) {
    const { branchId } = await params
    const { date: dateParam } = await searchParams
    const supabase = await createClient()

    // Get selected date or default to today
    const selectedDate = dateParam ? parseISO(dateParam) : new Date()
    const dateStr = format(selectedDate, 'yyyy-MM-dd')

    // Get month range for calendar
    const monthStart = startOfMonth(selectedDate)
    const monthEnd = endOfMonth(selectedDate)

    // Fetch staff for this branch
    const { data: assignments } = await supabase
        .from('user_branch_assignments')
        .select(`
            user_id,
            profile:profiles(id, full_name, phone, is_active)
        `)
        .eq('branch_id', branchId)

    const staff = assignments?.map((a: any) => a.profile).filter((p: any) => p?.is_active) || []

    // Fetch attendance for selected date
    const { data: attendanceRecords } = await supabase
        .from('attendance')
        .select('*')
        .eq('branch_id', branchId)
        .eq('date', dateStr)

    // Create attendance map for quick lookup
    const attendanceMap = new Map(attendanceRecords?.map((a: any) => [a.employee_id, a]) || [])

    // Calculate stats
    const totalStaff = staff.length
    const presentCount = attendanceRecords?.filter((a: any) => a.status === 'PRESENT').length || 0
    const absentCount = attendanceRecords?.filter((a: any) => a.status === 'ABSENT').length || 0
    const lateCount = attendanceRecords?.filter((a: any) => a.status === 'LATE').length || 0
    const onLeaveCount = attendanceRecords?.filter((a: any) => a.status === 'ON_LEAVE').length || 0

    // Get attendance summary for month calendar
    const { data: monthAttendance } = await supabase
        .from('attendance')
        .select('date, status')
        .eq('branch_id', branchId)
        .gte('date', format(monthStart, 'yyyy-MM-dd'))
        .lte('date', format(monthEnd, 'yyyy-MM-dd'))

    // Calculate daily rates for calendar
    const dailyRates = new Map<string, { present: number, total: number }>()
    monthAttendance?.forEach((record: any) => {
        const existing = dailyRates.get(record.date) || { present: 0, total: 0 }
        existing.total++
        if (record.status === 'PRESENT' || record.status === 'LATE') {
            existing.present++
        }
        dailyRates.set(record.date, existing)
    })

    const daysInMonth = eachDayOfInterval({ start: monthStart, end: monthEnd })

    const statusColors: Record<string, string> = {
        'PRESENT': 'bg-green-100 text-green-800',
        'ABSENT': 'bg-red-100 text-red-800',
        'LATE': 'bg-yellow-100 text-yellow-800',
        'HALF_DAY': 'bg-orange-100 text-orange-800',
        'ON_LEAVE': 'bg-blue-100 text-blue-800',
        'HOLIDAY': 'bg-purple-100 text-purple-800',
    }

    return (
        <div className="space-y-6">
            {/* Stats Row */}
            <div className="grid gap-4 md:grid-cols-5">
                <Card className="bg-gradient-to-br from-slate-700 to-slate-800 text-white border-0">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium opacity-90">Total Staff</CardTitle>
                        <Users className="h-5 w-5 opacity-80" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold">{totalStaff}</div>
                    </CardContent>
                </Card>

                <Card className="bg-gradient-to-br from-green-500 to-green-600 text-white border-0">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium opacity-90">Present</CardTitle>
                        <CheckCircle2 className="h-5 w-5 opacity-80" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold">{presentCount}</div>
                    </CardContent>
                </Card>

                <Card className="bg-gradient-to-br from-red-500 to-red-600 text-white border-0">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium opacity-90">Absent</CardTitle>
                        <XCircle className="h-5 w-5 opacity-80" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold">{absentCount}</div>
                    </CardContent>
                </Card>

                <Card className="bg-gradient-to-br from-yellow-500 to-yellow-600 text-white border-0">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium opacity-90">Late</CardTitle>
                        <AlertCircle className="h-5 w-5 opacity-80" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold">{lateCount}</div>
                    </CardContent>
                </Card>

                <Card className="bg-gradient-to-br from-blue-500 to-blue-600 text-white border-0">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium opacity-90">On Leave</CardTitle>
                        <Calendar className="h-5 w-5 opacity-80" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold">{onLeaveCount}</div>
                    </CardContent>
                </Card>
            </div>

            <div className="grid gap-6 lg:grid-cols-3">
                {/* Calendar Mini */}
                <Card className="lg:col-span-1">
                    <CardHeader>
                        <div className="flex items-center justify-between">
                            <CardTitle className="text-lg">
                                {format(selectedDate, 'MMMM yyyy')}
                            </CardTitle>
                            <div className="flex gap-1">
                                <Link href={`?date=${format(new Date(selectedDate.getFullYear(), selectedDate.getMonth() - 1, 1), 'yyyy-MM-dd')}`}>
                                    <Button variant="ghost" size="icon" className="h-8 w-8">
                                        <ChevronLeft className="h-4 w-4" />
                                    </Button>
                                </Link>
                                <Link href={`?date=${format(new Date(selectedDate.getFullYear(), selectedDate.getMonth() + 1, 1), 'yyyy-MM-dd')}`}>
                                    <Button variant="ghost" size="icon" className="h-8 w-8">
                                        <ChevronRight className="h-4 w-4" />
                                    </Button>
                                </Link>
                            </div>
                        </div>
                    </CardHeader>
                    <CardContent>
                        {/* Weekday headers */}
                        <div className="grid grid-cols-7 gap-1 mb-2">
                            {['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'].map((day) => (
                                <div key={day} className="text-center text-xs font-medium text-muted-foreground py-1">
                                    {day}
                                </div>
                            ))}
                        </div>
                        {/* Calendar grid */}
                        <div className="grid grid-cols-7 gap-1">
                            {/* Empty cells for days before month start */}
                            {Array(monthStart.getDay()).fill(null).map((_, i) => (
                                <div key={`empty-${i}`} className="aspect-square" />
                            ))}
                            {daysInMonth.map((day) => {
                                const dayStr = format(day, 'yyyy-MM-dd')
                                const isSelected = isSameDay(day, selectedDate)
                                const isToday = isSameDay(day, new Date())
                                const weekend = isWeekend(day)
                                const rate = dailyRates.get(dayStr)

                                return (
                                    <Link
                                        key={dayStr}
                                        href={`?date=${dayStr}`}
                                        className={`
                                            aspect-square flex flex-col items-center justify-center text-sm rounded-md transition-colors
                                            ${isSelected ? 'bg-blue-600 text-white' : ''}
                                            ${isToday && !isSelected ? 'ring-2 ring-blue-400' : ''}
                                            ${weekend && !isSelected ? 'text-red-400' : ''}
                                            ${!isSelected ? 'hover:bg-slate-100' : ''}
                                        `}
                                    >
                                        <span className="font-medium">{format(day, 'd')}</span>
                                        {rate && !isSelected && (
                                            <span className={`text-[10px] ${rate.present === rate.total ? 'text-green-600' : 'text-orange-500'}`}>
                                                {Math.round((rate.present / rate.total) * 100)}%
                                            </span>
                                        )}
                                    </Link>
                                )
                            })}
                        </div>

                        {/* Legend */}
                        <div className="mt-4 pt-4 border-t space-y-2">
                            <p className="text-xs font-medium text-muted-foreground">Legend</p>
                            <div className="flex flex-wrap gap-2 text-xs">
                                {Object.entries(statusColors).map(([status, color]) => (
                                    <div key={status} className="flex items-center gap-1">
                                        <div className={`w-3 h-3 rounded ${color}`} />
                                        <span className="text-muted-foreground">{status.replace('_', ' ')}</span>
                                    </div>
                                ))}
                            </div>
                        </div>
                    </CardContent>
                </Card>

                {/* Daily Attendance */}
                <Card className="lg:col-span-2">
                    <CardHeader>
                        <div className="flex items-center justify-between">
                            <div>
                                <CardTitle>Daily Attendance</CardTitle>
                                <CardDescription>
                                    {format(selectedDate, 'EEEE, MMMM d, yyyy')}
                                </CardDescription>
                            </div>
                            <Link href={`?date=${format(new Date(), 'yyyy-MM-dd')}`}>
                                <Button variant="outline" size="sm">
                                    Today
                                </Button>
                            </Link>
                        </div>
                    </CardHeader>
                    <CardContent className="p-0">
                        <Table>
                            <TableHeader>
                                <TableRow className="bg-slate-50">
                                    <TableHead className="font-semibold">Employee</TableHead>
                                    <TableHead className="font-semibold">Clock In</TableHead>
                                    <TableHead className="font-semibold">Clock Out</TableHead>
                                    <TableHead className="font-semibold">Hours</TableHead>
                                    <TableHead className="font-semibold">Status</TableHead>
                                    <TableHead className="w-[100px]">Action</TableHead>
                                </TableRow>
                            </TableHeader>
                            <TableBody>
                                {staff.length === 0 ? (
                                    <TableRow>
                                        <TableCell colSpan={6} className="h-32 text-center">
                                            <div className="flex flex-col items-center justify-center text-muted-foreground">
                                                <Users className="h-8 w-8 mb-2 opacity-50" />
                                                <p>No staff to mark attendance</p>
                                            </div>
                                        </TableCell>
                                    </TableRow>
                                ) : (
                                    staff.map((member: any) => {
                                        const attendance = attendanceMap.get(member.id)
                                        return (
                                            <TableRow key={member.id}>
                                                <TableCell>
                                                    <div className="flex items-center gap-3">
                                                        <div className="h-9 w-9 rounded-full bg-gradient-to-br from-blue-500 to-purple-600 flex items-center justify-center text-white font-semibold text-xs">
                                                            {member.full_name?.split(' ').map((n: string) => n[0]).join('').toUpperCase().slice(0, 2) || '?'}
                                                        </div>
                                                        <span className="font-medium">{member.full_name}</span>
                                                    </div>
                                                </TableCell>
                                                <TableCell>
                                                    <span className={attendance?.clock_in ? 'font-mono' : 'text-muted-foreground'}>
                                                        {attendance?.clock_in || '--:--'}
                                                    </span>
                                                </TableCell>
                                                <TableCell>
                                                    <span className={attendance?.clock_out ? 'font-mono' : 'text-muted-foreground'}>
                                                        {attendance?.clock_out || '--:--'}
                                                    </span>
                                                </TableCell>
                                                <TableCell>
                                                    <span className="font-mono">
                                                        {attendance?.hours_worked ? `${attendance.hours_worked}h` : '-'}
                                                    </span>
                                                </TableCell>
                                                <TableCell>
                                                    {attendance?.status ? (
                                                        <Badge className={statusColors[attendance.status]}>
                                                            {attendance.status.replace('_', ' ')}
                                                        </Badge>
                                                    ) : (
                                                        <Badge variant="outline" className="text-gray-500">
                                                            Not Marked
                                                        </Badge>
                                                    )}
                                                </TableCell>
                                                <TableCell>
                                                    <AttendanceMarker
                                                        branchId={branchId}
                                                        employeeId={member.id}
                                                        date={dateStr}
                                                        currentStatus={attendance?.status}
                                                        clockIn={attendance?.clock_in}
                                                        clockOut={attendance?.clock_out}
                                                    />
                                                </TableCell>
                                            </TableRow>
                                        )
                                    })
                                )}
                            </TableBody>
                        </Table>
                    </CardContent>
                </Card>
            </div>
        </div>
    )
}
