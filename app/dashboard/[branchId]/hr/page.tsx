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
import { Users, Plus, Phone, UserCheck, UserX, Edit, Eye, MoreHorizontal, Mail, Briefcase } from 'lucide-react'
import Link from 'next/link'
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu'

export default async function HRStaffPage({ params }: { params: Promise<{ branchId: string }> }) {
    const { branchId } = await params
    const supabase = await createClient()

    // Fetch staff assigned to this branch with employee profiles
    const { data: assignments } = await supabase
        .from('user_branch_assignments')
        .select(`
            user_id,
            is_primary,
            profile:profiles(
                id, 
                full_name, 
                phone, 
                role, 
                is_active,
                employee_profile:employee_profiles(
                    employee_id,
                    department,
                    position,
                    employment_type,
                    date_hired,
                    base_salary
                )
            )
        `)
        .eq('branch_id', branchId)

    const staff = assignments?.map((a: any) => ({
        ...a.profile,
        employee_profile: a.profile?.employee_profile?.[0] || null,
        is_primary: a.is_primary
    })) || []

    const activeStaff = staff.filter((s: any) => s.is_active).length
    const totalStaff = staff.length

    return (
        <div className="space-y-6">
            {/* Stats Grid */}
            <div className="grid gap-4 md:grid-cols-4">
                <Card className="bg-gradient-to-br from-blue-600 to-blue-700 text-white border-0">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium opacity-90">Total Staff</CardTitle>
                        <Users className="h-5 w-5 opacity-80" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold">{totalStaff}</div>
                        <p className="text-xs opacity-75 mt-1">Assigned to this branch</p>
                    </CardContent>
                </Card>

                <Card className="bg-gradient-to-br from-blue-500 to-blue-600 text-white border-0">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium opacity-90">Active</CardTitle>
                        <UserCheck className="h-5 w-5 opacity-80" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold">{activeStaff}</div>
                        <p className="text-xs opacity-75 mt-1">Currently active</p>
                    </CardContent>
                </Card>

                <Card className="bg-gradient-to-br from-slate-600 to-slate-700 text-white border-0">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium opacity-90">Inactive</CardTitle>
                        <UserX className="h-5 w-5 opacity-80" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold">{totalStaff - activeStaff}</div>
                        <p className="text-xs opacity-75 mt-1">Deactivated accounts</p>
                    </CardContent>
                </Card>

                <Card className="bg-gradient-to-br from-blue-400 to-blue-500 text-white border-0">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium opacity-90">Departments</CardTitle>
                        <Briefcase className="h-5 w-5 opacity-80" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-3xl font-bold">
                            {new Set(staff.map((s: any) => s.employee_profile?.department).filter(Boolean)).size}
                        </div>
                        <p className="text-xs opacity-75 mt-1">Unique departments</p>
                    </CardContent>
                </Card>
            </div>

            {/* Actions Bar */}
            <div className="flex flex-col sm:flex-row gap-4 justify-between">
                <div className="flex gap-2">
                    <Link href={`/dashboard/${branchId}/hr/staff/new`}>
                        <Button className="bg-blue-600 hover:bg-blue-700">
                            <Plus className="mr-2 h-4 w-4" />
                            Add Employee
                        </Button>
                    </Link>
                </div>
            </div>

            {/* Staff Table */}
            <Card>
                <CardHeader>
                    <CardTitle>Staff Directory</CardTitle>
                    <CardDescription>All employees assigned to this branch</CardDescription>
                </CardHeader>
                <CardContent className="p-0">
                    <Table>
                        <TableHeader>
                            <TableRow className="bg-slate-50 dark:bg-slate-800">
                                <TableHead className="font-semibold">Employee</TableHead>
                                <TableHead className="font-semibold">Position</TableHead>
                                <TableHead className="font-semibold">Department</TableHead>
                                <TableHead className="font-semibold">Contact</TableHead>
                                <TableHead className="font-semibold">Status</TableHead>
                                <TableHead className="font-semibold">Type</TableHead>
                                <TableHead className="w-[60px]"></TableHead>
                            </TableRow>
                        </TableHeader>
                        <TableBody>
                            {staff.length === 0 ? (
                                <TableRow>
                                    <TableCell colSpan={7} className="h-32 text-center">
                                        <div className="flex flex-col items-center justify-center text-muted-foreground">
                                            <Users className="h-8 w-8 mb-2 opacity-50" />
                                            <p>No staff assigned to this branch</p>
                                            <Link href={`/dashboard/${branchId}/hr/staff/new`} className="mt-2">
                                                <Button variant="outline" size="sm">
                                                    <Plus className="mr-2 h-4 w-4" />
                                                    Add First Employee
                                                </Button>
                                            </Link>
                                        </div>
                                    </TableCell>
                                </TableRow>
                            ) : (
                                staff.map((member: any) => (
                                    <TableRow key={member.id} className="hover:bg-slate-50 dark:hover:bg-slate-800/50">
                                        <TableCell>
                                            <div className="flex items-center gap-3">
                                                <div className="h-10 w-10 rounded-full bg-gradient-to-br from-blue-500 to-purple-600 flex items-center justify-center text-white font-semibold text-sm">
                                                    {member.full_name?.split(' ').map((n: string) => n[0]).join('').toUpperCase().slice(0, 2) || '?'}
                                                </div>
                                                <div>
                                                    <p className="font-medium">{member.full_name || 'Unknown'}</p>
                                                    <p className="text-xs text-muted-foreground">
                                                        {member.employee_profile?.employee_id || 'No ID assigned'}
                                                    </p>
                                                </div>
                                            </div>
                                        </TableCell>
                                        <TableCell>
                                            <span className="font-medium">
                                                {member.employee_profile?.position || '-'}
                                            </span>
                                        </TableCell>
                                        <TableCell>
                                            {member.employee_profile?.department ? (
                                                <Badge variant="outline" className="bg-slate-50">
                                                    {member.employee_profile.department}
                                                </Badge>
                                            ) : (
                                                <span className="text-muted-foreground">-</span>
                                            )}
                                        </TableCell>
                                        <TableCell>
                                            <div className="flex items-center gap-1 text-sm text-muted-foreground">
                                                <Phone className="h-3 w-3" />
                                                {member.phone || 'N/A'}
                                            </div>
                                        </TableCell>
                                        <TableCell>
                                            <Badge className={member.is_active ? 'bg-green-100 text-green-800 hover:bg-green-100' : 'bg-red-100 text-red-800 hover:bg-red-100'}>
                                                {member.is_active ? 'Active' : 'Inactive'}
                                            </Badge>
                                        </TableCell>
                                        <TableCell>
                                            {member.employee_profile?.employment_type ? (
                                                <Badge variant="outline" className={
                                                    member.employee_profile.employment_type === 'full_time' ? 'border-blue-200 text-blue-700' :
                                                        member.employee_profile.employment_type === 'part_time' ? 'border-orange-200 text-orange-700' :
                                                            'border-gray-200 text-gray-700'
                                                }>
                                                    {member.employee_profile.employment_type.replace('_', ' ').replace(/\b\w/g, (l: string) => l.toUpperCase())}
                                                </Badge>
                                            ) : (
                                                <span className="text-muted-foreground">-</span>
                                            )}
                                        </TableCell>
                                        <TableCell>
                                            <DropdownMenu>
                                                <DropdownMenuTrigger asChild>
                                                    <Button variant="ghost" size="icon" className="h-8 w-8">
                                                        <MoreHorizontal className="h-4 w-4" />
                                                    </Button>
                                                </DropdownMenuTrigger>
                                                <DropdownMenuContent align="end">
                                                    <DropdownMenuItem asChild>
                                                        <Link href={`/dashboard/${branchId}/hr/staff/${member.id}`}>
                                                            <Eye className="mr-2 h-4 w-4" />
                                                            View Profile
                                                        </Link>
                                                    </DropdownMenuItem>
                                                    <DropdownMenuItem asChild>
                                                        <Link href={`/dashboard/${branchId}/hr/staff/${member.id}/edit`}>
                                                            <Edit className="mr-2 h-4 w-4" />
                                                            Edit
                                                        </Link>
                                                    </DropdownMenuItem>
                                                </DropdownMenuContent>
                                            </DropdownMenu>
                                        </TableCell>
                                    </TableRow>
                                ))
                            )}
                        </TableBody>
                    </Table>
                </CardContent>
            </Card>
        </div>
    )
}
