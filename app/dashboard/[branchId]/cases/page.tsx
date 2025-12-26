import Link from 'next/link'
import { createClient } from '@/utils/supabase/server'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import {
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from '@/components/ui/table'
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu'
import { Plus, MoreHorizontal, Eye, Edit, FileText, Search, Filter } from 'lucide-react'
import { Input } from '@/components/ui/input'
import type { DeceasedCase, CaseStatus } from '@/lib/types'
import { resolveBranch } from '@/lib/branch-resolver'
import { notFound } from 'next/navigation'
import { CaseActions } from '@/components/cases/case-actions'

const statusColors: Record<CaseStatus, string> = {
    IN_CUSTODY: 'bg-blue-100 text-blue-800 border-blue-200',
    DISCHARGED: 'bg-green-100 text-green-800 border-green-200',
    CANCELLED: 'bg-red-100 text-red-800 border-red-200',
    ARCHIVED: 'bg-gray-100 text-gray-800 border-gray-200',
}

const statusLabels: Record<CaseStatus, string> = {
    IN_CUSTODY: 'In Custody',
    DISCHARGED: 'Discharged',
    CANCELLED: 'Cancelled',
    ARCHIVED: 'Archived',
}

export default async function CasesPage({ params }: { params: Promise<{ branchId: string }> }) {
    const { branchId } = await params
    const supabase = await createClient()

    // Resolve branch from code or UUID
    const branch = await resolveBranch(branchId)
    if (!branch) notFound()

    // Fetch cases for this branch using resolved branch ID
    const { data: cases, error } = await supabase
        .from('deceased_cases')
        .select('*')
        .eq('branch_id', branch.id)
        .order('created_at', { ascending: false })

    const casesData = (cases || []) as DeceasedCase[]

    // Stats
    const activeCases = casesData.filter(c => c.status === 'IN_CUSTODY').length
    const dischargedCases = casesData.filter(c => c.status === 'DISCHARGED').length
    const totalDeposits = casesData.reduce((sum, c) => sum + (c.total_paid || 0), 0)

    return (
        <div className="space-y-6 p-8">
            {/* Header */}
            <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
                <div>
                    <h1 className="text-3xl font-bold tracking-tight">Case Management</h1>
                    <p className="text-muted-foreground">Manage deceased admissions, storage, and discharges</p>
                </div>
                <Link href={`/dashboard/${branch.code}/cases/new`}>
                    <Button className="bg-blue-600 hover:bg-blue-700">
                        <Plus className="mr-2 h-4 w-4" />
                        New Admission
                    </Button>
                </Link>
            </div>

            {/* Stats Cards */}
            <div className="grid gap-4 md:grid-cols-3">
                <Card>
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium">Active Cases</CardTitle>
                        <div className="h-8 w-8 rounded-full bg-blue-100 flex items-center justify-center">
                            <FileText className="h-4 w-4 text-blue-600" />
                        </div>
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold">{activeCases}</div>
                        <p className="text-xs text-muted-foreground">Currently in custody</p>
                    </CardContent>
                </Card>
                <Card>
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium">Discharged</CardTitle>
                        <div className="h-8 w-8 rounded-full bg-green-100 flex items-center justify-center">
                            <FileText className="h-4 w-4 text-green-600" />
                        </div>
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold">{dischargedCases}</div>
                        <p className="text-xs text-muted-foreground">Released to family</p>
                    </CardContent>
                </Card>
                <Card>
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium">Deposits Made</CardTitle>
                        <div className="h-8 w-8 rounded-full bg-green-100 flex items-center justify-center">
                            <FileText className="h-4 w-4 text-green-600" />
                        </div>
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold text-green-600">GHS {totalDeposits.toFixed(2)}</div>
                        <p className="text-xs text-muted-foreground">collected at admission</p>
                    </CardContent>
                </Card>
            </div>

            {/* Search & Filters */}
            <Card>
                <CardHeader className="pb-3">
                    <div className="flex flex-col md:flex-row md:items-center gap-4">
                        <div className="relative flex-1">
                            <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
                            <Input placeholder="Search by name, tag number..." className="pl-10" />
                        </div>
                        <Button variant="outline" size="sm">
                            <Filter className="mr-2 h-4 w-4" />
                            Filters
                        </Button>
                    </div>
                </CardHeader>
                <CardContent className="p-0">
                    <Table>
                        <TableHeader>
                            <TableRow className="bg-slate-50 dark:bg-slate-800">
                                <TableHead className="font-semibold">Tag No.</TableHead>
                                <TableHead className="font-semibold">Name of Deceased</TableHead>
                                <TableHead className="font-semibold">Age</TableHead>
                                <TableHead className="font-semibold">Gender</TableHead>
                                <TableHead className="font-semibold">Place/Town</TableHead>
                                <TableHead className="font-semibold">Relative's Contact</TableHead>
                                <TableHead className="font-semibold">Admission Date</TableHead>
                                <TableHead className="font-semibold">Type</TableHead>
                                <TableHead className="font-semibold">Status</TableHead>
                                <TableHead className="font-semibold text-right">Balance (GHS)</TableHead>
                                <TableHead className="w-[50px]"></TableHead>
                            </TableRow>
                        </TableHeader>
                        <TableBody>
                            {casesData.length === 0 ? (
                                <TableRow>
                                    <TableCell colSpan={11} className="h-32 text-center">
                                        <div className="flex flex-col items-center justify-center text-muted-foreground">
                                            <FileText className="h-8 w-8 mb-2 opacity-50" />
                                            <p>No cases found</p>
                                            <Link href={`/dashboard/${branch.code}/cases/new`} className="mt-2">
                                                <Button variant="link" size="sm">Create your first admission</Button>
                                            </Link>
                                        </div>
                                    </TableCell>
                                </TableRow>
                            ) : (
                                casesData.map((caseItem) => (
                                    <TableRow key={caseItem.id} className="hover:bg-slate-50 dark:hover:bg-slate-800/50">
                                        <TableCell className="font-mono font-medium text-blue-600">{caseItem.tag_no}</TableCell>
                                        <TableCell>
                                            <div>
                                                <p className="font-medium">{caseItem.name_of_deceased}</p>
                                                <p className="text-xs text-muted-foreground">{caseItem.relative_name || 'No relative info'}</p>
                                            </div>
                                        </TableCell>
                                        <TableCell>
                                            <span className="text-sm">{caseItem.age ? `${caseItem.age} yrs` : '-'}</span>
                                        </TableCell>
                                        <TableCell>
                                            <span className="text-sm">{caseItem.gender || '-'}</span>
                                        </TableCell>
                                        <TableCell>
                                            <span className="text-sm">{caseItem.place || '-'}</span>
                                        </TableCell>
                                        <TableCell>
                                            <span className="text-sm font-mono">{caseItem.relative_contact || '-'}</span>
                                        </TableCell>
                                        <TableCell>{caseItem.admission_date || '-'}</TableCell>
                                        <TableCell>
                                            <Badge variant="outline" className={caseItem.type === 'VIP' ? 'bg-amber-50 text-amber-700 border-amber-200' : ''}>
                                                {caseItem.type || 'Normal'}
                                            </Badge>
                                        </TableCell>
                                        <TableCell>
                                            <Badge className={statusColors[caseItem.status]}>
                                                {statusLabels[caseItem.status]}
                                            </Badge>
                                        </TableCell>
                                        <TableCell className={`text-right font-medium ${caseItem.balance > 0 ? 'text-red-600' : 'text-green-600'}`}>
                                            {caseItem.balance > 0 ? caseItem.balance.toFixed(2) : 'Cleared'}
                                        </TableCell>
                                        <TableCell>
                                            <CaseActions
                                                caseItem={caseItem}
                                                branchCode={branch.code}
                                                branchId={branch.id}
                                            />
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
