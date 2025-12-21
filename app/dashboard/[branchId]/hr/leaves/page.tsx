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
    ClipboardList,
    Plus,
    Calendar,
    Clock,
    CheckCircle2,
    XCircle,
    AlertCircle,
    Eye,
    MoreHorizontal,
    CalendarDays
} from 'lucide-react'
import Link from 'next/link'
import { format, differenceInDays } from 'date-fns'
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu'
import NewLeaveRequestButton from '@/components/hr/new-leave-request-button'
import LeaveActionButtons from '@/components/hr/leave-action-buttons'

export default async function LeavesPage({ params }: { params: Promise<{ branchId: string }> }) {
    const { branchId } = await params
    const supabase = await createClient()

    // Fetch leave requests for this branch
    const { data: leaveRequests } = await supabase
        .from('leave_requests')
        .select(`
            *,
            employee:profiles!leave_requests_employee_id_fkey(id, full_name),
            leave_type:leave_types(name, is_paid),
            approver:profiles!leave_requests_approved_by_fkey(full_name)
        `)
        .eq('branch_id', branchId)
        .order('created_at', { ascending: false })
        .limit(50)

    // Fetch leave types
    const { data: leaveTypes } = await supabase
        .from('leave_types')
        .select('*')
        .eq('is_active', true)

    // Fetch staff for this branch (for the new request dialog)
    const { data: assignments } = await supabase
        .from('user_branch_assignments')
        .select(`profile:profiles(id, full_name, is_active)`)
        .eq('branch_id', branchId)

    const staff = assignments?.map((a: any) => a.profile).filter((p: any) => p?.is_active) || []

    // Calculate stats
    const pendingCount = leaveRequests?.filter(l => l.status === 'PENDING').length || 0
    const approvedCount = leaveRequests?.filter(l => l.status === 'APPROVED').length || 0
    const rejectedCount = leaveRequests?.filter(l => l.status === 'REJECTED').length || 0
    const totalDaysApproved = leaveRequests
        ?.filter(l => l.status === 'APPROVED')
        .reduce((sum, l) => sum + l.days_requested, 0) || 0

    const statusStyles: Record<string, { bg: string, text: string, icon: any }> = {
        'PENDING': { bg: 'bg-yellow-100', text: 'text-yellow-800', icon: Clock },
        'APPROVED': { bg: 'bg-green-100', text: 'text-green-800', icon: CheckCircle2 },
        'REJECTED': { bg: 'bg-red-100', text: 'text-red-800', icon: XCircle },
        'CANCELLED': { bg: 'bg-gray-100', text: 'text-gray-800', icon: AlertCircle },
    }

    return (
        <div className="space-y-6">
            {/* Stats Row */}
            <div className="grid gap-4 md:grid-cols-4">
                <Card className="bg-gradient-to-br from-yellow-500 to-yellow-600 text-white border-0">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium opacity-90">Pending</CardTitle>
                        <Clock className="h-5 w-5 opacity-80" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold">{pendingCount}</div>
                        <p className="text-xs opacity-75 mt-1">Awaiting approval</p>
                    </CardContent>
                </Card>

                <Card className="bg-gradient-to-br from-green-500 to-green-600 text-white border-0">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium opacity-90">Approved</CardTitle>
                        <CheckCircle2 className="h-5 w-5 opacity-80" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold">{approvedCount}</div>
                        <p className="text-xs opacity-75 mt-1">This period</p>
                    </CardContent>
                </Card>

                <Card className="bg-gradient-to-br from-red-500 to-red-600 text-white border-0">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium opacity-90">Rejected</CardTitle>
                        <XCircle className="h-5 w-5 opacity-80" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold">{rejectedCount}</div>
                        <p className="text-xs opacity-75 mt-1">Not approved</p>
                    </CardContent>
                </Card>

                <Card className="bg-gradient-to-br from-blue-500 to-blue-600 text-white border-0">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium opacity-90">Days Approved</CardTitle>
                        <CalendarDays className="h-5 w-5 opacity-80" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold">{totalDaysApproved}</div>
                        <p className="text-xs opacity-75 mt-1">Total leave days</p>
                    </CardContent>
                </Card>
            </div>

            {/* Actions */}
            <div className="flex flex-col sm:flex-row gap-4 justify-between">
                <div className="flex gap-2">
                    <NewLeaveRequestButton
                        branchId={branchId}
                        staff={staff}
                        leaveTypes={leaveTypes || []}
                    />
                </div>
            </div>

            {/* Leave Requests Table */}
            <Card>
                <CardHeader>
                    <CardTitle>Leave Requests</CardTitle>
                    <CardDescription>All leave requests for this branch</CardDescription>
                </CardHeader>
                <CardContent className="p-0">
                    <Table>
                        <TableHeader>
                            <TableRow className="bg-slate-50">
                                <TableHead className="font-semibold">Employee</TableHead>
                                <TableHead className="font-semibold">Leave Type</TableHead>
                                <TableHead className="font-semibold">Period</TableHead>
                                <TableHead className="font-semibold">Days</TableHead>
                                <TableHead className="font-semibold">Reason</TableHead>
                                <TableHead className="font-semibold">Status</TableHead>
                                <TableHead className="font-semibold">Approved By</TableHead>
                                <TableHead className="w-[120px]">Actions</TableHead>
                            </TableRow>
                        </TableHeader>
                        <TableBody>
                            {!leaveRequests || leaveRequests.length === 0 ? (
                                <TableRow>
                                    <TableCell colSpan={8} className="h-32 text-center">
                                        <div className="flex flex-col items-center justify-center text-muted-foreground">
                                            <ClipboardList className="h-8 w-8 mb-2 opacity-50" />
                                            <p>No leave requests yet</p>
                                        </div>
                                    </TableCell>
                                </TableRow>
                            ) : (
                                leaveRequests.map((request) => {
                                    const statusStyle = statusStyles[request.status] || statusStyles['PENDING']
                                    const StatusIcon = statusStyle.icon

                                    return (
                                        <TableRow key={request.id} className="hover:bg-slate-50">
                                            <TableCell>
                                                <div className="flex items-center gap-3">
                                                    <div className="h-9 w-9 rounded-full bg-gradient-to-br from-blue-500 to-purple-600 flex items-center justify-center text-white font-semibold text-xs">
                                                        {request.employee?.full_name?.split(' ').map((n: string) => n[0]).join('').toUpperCase().slice(0, 2) || '?'}
                                                    </div>
                                                    <span className="font-medium">{request.employee?.full_name}</span>
                                                </div>
                                            </TableCell>
                                            <TableCell>
                                                <Badge variant="outline" className={request.leave_type?.is_paid ? 'border-green-200 text-green-700' : 'border-gray-200 text-gray-700'}>
                                                    {request.leave_type?.name}
                                                    {!request.leave_type?.is_paid && ' (Unpaid)'}
                                                </Badge>
                                            </TableCell>
                                            <TableCell>
                                                <div className="text-sm">
                                                    <div>{format(new Date(request.start_date), 'MMM d, yyyy')}</div>
                                                    <div className="text-muted-foreground">to {format(new Date(request.end_date), 'MMM d, yyyy')}</div>
                                                </div>
                                            </TableCell>
                                            <TableCell>
                                                <Badge variant="outline">{request.days_requested} days</Badge>
                                            </TableCell>
                                            <TableCell className="max-w-[200px]">
                                                <p className="text-sm text-muted-foreground truncate" title={request.reason}>
                                                    {request.reason || '-'}
                                                </p>
                                            </TableCell>
                                            <TableCell>
                                                <Badge className={`${statusStyle.bg} ${statusStyle.text} gap-1`}>
                                                    <StatusIcon className="h-3 w-3" />
                                                    {request.status}
                                                </Badge>
                                            </TableCell>
                                            <TableCell className="text-sm text-muted-foreground">
                                                {request.approver?.full_name || '-'}
                                            </TableCell>
                                            <TableCell>
                                                {request.status === 'PENDING' ? (
                                                    <LeaveActionButtons
                                                        requestId={request.id}
                                                        employeeName={request.employee?.full_name}
                                                    />
                                                ) : (
                                                    <span className="text-xs text-muted-foreground">
                                                        {request.approved_at && format(new Date(request.approved_at), 'MMM d, yyyy')}
                                                    </span>
                                                )}
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
    )
}
