import Link from 'next/link'
import { notFound } from 'next/navigation'
import { createClient } from '@/utils/supabase/server'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from '@/components/ui/card'
import { Separator } from '@/components/ui/separator'
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs'
import {
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from '@/components/ui/table'
import {
    ArrowLeft,
    Edit,
    FileText,
    User,
    Phone,
    Calendar,
    MapPin,
    DollarSign,
    CreditCard,
    Clock,
    CheckCircle,
    AlertTriangle,
    Plus,
} from 'lucide-react'
import type { DeceasedCase, CaseStatus, Payment } from '@/lib/types'
import { resolveBranch } from '@/lib/branch-resolver'
import { DischargeDialog } from '@/components/cases/discharge-dialog'

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

export default async function CaseDetailsPage({
    params,
}: {
    params: Promise<{ branchId: string; caseId: string }>
}) {
    const { branchId, caseId } = await params
    const supabase = await createClient()

    // Resolve branch from code or UUID
    const branch = await resolveBranch(branchId)
    if (!branch) notFound()

    // Fetch case
    const { data: caseData, error } = await supabase
        .from('deceased_cases')
        .select('*')
        .eq('id', caseId)
        .eq('branch_id', branch.id)
        .single()

    if (error || !caseData) {
        notFound()
    }

    const deceased = caseData as DeceasedCase

    // Fetch payments for this case
    const { data: paymentsData } = await supabase
        .from('payments')
        .select('*')
        .eq('case_id', caseId)
        .order('paid_on', { ascending: false })

    const payments = (paymentsData || []) as Payment[]

    // Fetch additional charges
    const { data: chargesData } = await supabase
        .from('case_charges')
        .select('*')
        .eq('case_id', caseId)
        .order('applied_on', { ascending: false })

    const charges = chargesData || []

    // Calculate storage days
    const admissionDate = deceased.admission_date ? new Date(deceased.admission_date) : new Date(deceased.created_at)
    const endDate = deceased.discharge_date ? new Date(deceased.discharge_date) : new Date()
    const storageDays = Math.ceil((endDate.getTime() - admissionDate.getTime()) / (1000 * 60 * 60 * 24))

    return (
        <div className="space-y-6 p-8">
            {/* Header */}
            <div className="flex flex-col md:flex-row md:items-start md:justify-between gap-4">
                <div className="flex items-start gap-4">
                    <Link href={`/dashboard/${branch.code}/cases`}>
                        <Button variant="ghost" size="icon">
                            <ArrowLeft className="h-5 w-5" />
                        </Button>
                    </Link>
                    <div>
                        <div className="flex items-center gap-3 mb-1">
                            <h1 className="text-3xl font-bold tracking-tight">{deceased.name_of_deceased}</h1>
                            <Badge className={statusColors[deceased.status]}>
                                {statusLabels[deceased.status]}
                            </Badge>
                        </div>
                        <p className="text-muted-foreground font-mono">{deceased.tag_no}</p>
                    </div>
                </div>
                <div className="flex gap-2">
                    {deceased.status === 'IN_CUSTODY' && (
                        <>
                            <Link href={`/dashboard/${branch.code}/finance?case=${caseId}`}>
                                <Button variant="outline">
                                    <Plus className="mr-2 h-4 w-4" />
                                    Add Payment
                                </Button>
                            </Link>
                            <DischargeDialog
                                caseId={caseId}
                                admissionDate={deceased.admission_date || new Date().toISOString()} // Fallback just in case
                                caseType={deceased.type || 'Normal'}
                                currentTotalBill={deceased.total_bill || 0}
                                totalPaid={deceased.total_paid || 0}
                                branchId={branch.id}
                                tagNo={deceased.tag_no}
                                name={deceased.name_of_deceased}
                            />
                        </>
                    )}
                    <Link href={`/dashboard/${branch.code}/cases/${caseId}/edit`}>
                        <Button variant="outline">
                            <Edit className="mr-2 h-4 w-4" />
                            Edit
                        </Button>
                    </Link>
                </div>
            </div>

            {/* Financial Summary Banner */}
            <div className="grid gap-4 md:grid-cols-4">
                <Card className="bg-gradient-to-br from-blue-50 to-blue-100 dark:from-blue-900/20 dark:to-blue-800/20 border-blue-200">
                    <CardContent className="pt-6">
                        <div className="text-sm text-blue-600 font-medium">Total Bill</div>
                        <div className="text-2xl font-bold text-blue-700">GHS {deceased.total_bill.toFixed(2)}</div>
                    </CardContent>
                </Card>
                <Card className="bg-gradient-to-br from-green-50 to-green-100 dark:from-green-900/20 dark:to-green-800/20 border-green-200">
                    <CardContent className="pt-6">
                        <div className="text-sm text-green-600 font-medium">Total Paid</div>
                        <div className="text-2xl font-bold text-green-700">GHS {deceased.total_paid.toFixed(2)}</div>
                    </CardContent>
                </Card>
                <Card className={`bg-gradient-to-br ${deceased.balance > 0 ? 'from-red-50 to-red-100 border-red-200' : 'from-gray-50 to-gray-100 border-gray-200'}`}>
                    <CardContent className="pt-6">
                        <div className={`text-sm font-medium ${deceased.balance > 0 ? 'text-red-600' : 'text-gray-600'}`}>Balance</div>
                        <div className={`text-2xl font-bold ${deceased.balance > 0 ? 'text-red-700' : 'text-gray-700'}`}>
                            {deceased.balance > 0 ? `GHS ${deceased.balance.toFixed(2)}` : 'Cleared'}
                        </div>
                    </CardContent>
                </Card>
                <Card className="bg-gradient-to-br from-purple-50 to-purple-100 dark:from-purple-900/20 dark:to-purple-800/20 border-purple-200">
                    <CardContent className="pt-6">
                        <div className="text-sm text-purple-600 font-medium">Storage Days</div>
                        <div className="text-2xl font-bold text-purple-700">{storageDays} days</div>
                    </CardContent>
                </Card>
            </div>

            {/* Tabs */}
            <Tabs defaultValue="details" className="space-y-4">
                <TabsList>
                    <TabsTrigger value="details">Details</TabsTrigger>
                    <TabsTrigger value="payments">Payments ({payments.length})</TabsTrigger>
                    <TabsTrigger value="charges">Charges ({charges.length})</TabsTrigger>
                </TabsList>

                {/* Details Tab */}
                <TabsContent value="details" className="space-y-4">
                    <div className="grid gap-6 md:grid-cols-2">
                        {/* Deceased Info */}
                        <Card>
                            <CardHeader>
                                <CardTitle className="flex items-center gap-2">
                                    <FileText className="h-5 w-5 text-blue-600" />
                                    Deceased Information
                                </CardTitle>
                            </CardHeader>
                            <CardContent className="space-y-4">
                                <div className="grid grid-cols-2 gap-4">
                                    <div>
                                        <p className="text-sm text-muted-foreground">Age</p>
                                        <p className="font-medium">{deceased.age || '-'} years</p>
                                    </div>
                                    <div>
                                        <p className="text-sm text-muted-foreground">Gender</p>
                                        <p className="font-medium">{deceased.gender || '-'}</p>
                                    </div>
                                    <div>
                                        <p className="text-sm text-muted-foreground flex items-center gap-1">
                                            <MapPin className="h-3 w-3" /> Place/Town
                                        </p>
                                        <p className="font-medium">{deceased.place || '-'}</p>
                                    </div>
                                    <div>
                                        <p className="text-sm text-muted-foreground">Type</p>
                                        <Badge variant="outline" className={deceased.type === 'VIP' ? 'bg-amber-50 text-amber-700' : ''}>
                                            {deceased.type || 'Normal'}
                                        </Badge>
                                    </div>
                                </div>
                                <Separator />
                                <div className="grid grid-cols-2 gap-4">
                                    <div>
                                        <p className="text-sm text-muted-foreground flex items-center gap-1">
                                            <Calendar className="h-3 w-3" /> Admission Date
                                        </p>
                                        <p className="font-medium">{deceased.admission_date || '-'}</p>
                                    </div>
                                    <div>
                                        <p className="text-sm text-muted-foreground flex items-center gap-1">
                                            <Clock className="h-3 w-3" /> Admission Time
                                        </p>
                                        <p className="font-medium">{deceased.admission_time || '-'}</p>
                                    </div>
                                </div>
                                {deceased.discharge_date && (
                                    <div>
                                        <p className="text-sm text-muted-foreground">Discharge Date</p>
                                        <p className="font-medium">{deceased.discharge_date}</p>
                                    </div>
                                )}
                            </CardContent>
                        </Card>

                        {/* Next of Kin */}
                        <Card>
                            <CardHeader>
                                <CardTitle className="flex items-center gap-2">
                                    <User className="h-5 w-5 text-green-600" />
                                    Relatives Information
                                </CardTitle>
                            </CardHeader>
                            <CardContent className="space-y-4">
                                <div>
                                    <p className="text-sm text-muted-foreground">Name</p>
                                    <p className="font-medium">{deceased.relative_name || 'Not provided'}</p>
                                </div>
                                <div className="grid grid-cols-2 gap-4">
                                    <div>
                                        <p className="text-sm text-muted-foreground flex items-center gap-1">
                                            <Phone className="h-3 w-3" /> Primary Contact
                                        </p>
                                        <p className="font-medium font-mono">{deceased.relative_contact || '-'}</p>
                                    </div>
                                    <div>
                                        <p className="text-sm text-muted-foreground flex items-center gap-1">
                                            <Phone className="h-3 w-3" /> Secondary Contact
                                        </p>
                                        <p className="font-medium font-mono">{deceased.relative_contact_secondary || '-'}</p>
                                    </div>
                                </div>
                            </CardContent>
                        </Card>

                        {/* Fee Breakdown */}
                        <Card className="md:col-span-2">
                            <CardHeader>
                                <CardTitle className="flex items-center gap-2">
                                    <DollarSign className="h-5 w-5 text-amber-600" />
                                    Fee Breakdown
                                </CardTitle>
                            </CardHeader>
                            <CardContent>
                                <Table>
                                    <TableHeader>
                                        <TableRow>
                                            <TableHead>Description</TableHead>
                                            <TableHead>Receipt No.</TableHead>
                                            <TableHead className="text-right">Amount (GHS)</TableHead>
                                        </TableRow>
                                    </TableHeader>
                                    <TableBody>
                                        <TableRow>
                                            <TableCell>Registration Fee</TableCell>
                                            <TableCell className="font-mono text-sm">-</TableCell>
                                            <TableCell className="text-right">{(deceased.registration_fee || 0).toFixed(2)}</TableCell>
                                        </TableRow>
                                        <TableRow>
                                            <TableCell>Embalming Fee</TableCell>
                                            <TableCell className="font-mono text-sm">{deceased.embalming_receipt_no || '-'}</TableCell>
                                            <TableCell className="text-right">{deceased.embalming_fee.toFixed(2)}</TableCell>
                                        </TableRow>
                                        <TableRow>
                                            <TableCell>Coldroom Fee</TableCell>
                                            <TableCell className="font-mono text-sm">{deceased.coldroom_receipt_no || '-'}</TableCell>
                                            <TableCell className="text-right">{deceased.coldroom_fee.toFixed(2)}</TableCell>
                                        </TableRow>
                                        <TableRow className="font-bold bg-slate-50 dark:bg-slate-800">
                                            <TableCell>Total</TableCell>
                                            <TableCell></TableCell>
                                            <TableCell className="text-right">{deceased.total_bill.toFixed(2)}</TableCell>
                                        </TableRow>
                                    </TableBody>
                                </Table>
                            </CardContent>
                        </Card>

                        {/* Notes */}
                        {deceased.notes && (
                            <Card className="md:col-span-2">
                                <CardHeader>
                                    <CardTitle>Notes</CardTitle>
                                </CardHeader>
                                <CardContent>
                                    <p className="text-muted-foreground whitespace-pre-wrap">{deceased.notes}</p>
                                </CardContent>
                            </Card>
                        )}
                    </div>
                </TabsContent>

                {/* Payments Tab */}
                <TabsContent value="payments">
                    <Card>
                        <CardHeader className="flex flex-row items-center justify-between">
                            <CardTitle>Payment History</CardTitle>
                            {deceased.status === 'IN_CUSTODY' && (
                                <Link href={`/dashboard/${branch.code}/finance?case=${caseId}`}>
                                    <Button size="sm">
                                        <Plus className="mr-2 h-4 w-4" />
                                        Add Payment
                                    </Button>
                                </Link>
                            )}
                        </CardHeader>
                        <CardContent>
                            {payments.length === 0 ? (
                                <div className="text-center py-8 text-muted-foreground">
                                    <CreditCard className="h-8 w-8 mx-auto mb-2 opacity-50" />
                                    <p>No payments recorded yet</p>
                                </div>
                            ) : (
                                <Table>
                                    <TableHeader>
                                        <TableRow>
                                            <TableHead>Receipt No.</TableHead>
                                            <TableHead>Date</TableHead>
                                            <TableHead>Method</TableHead>
                                            <TableHead>Allocation</TableHead>
                                            <TableHead className="text-right">Amount (GHS)</TableHead>
                                        </TableRow>
                                    </TableHeader>
                                    <TableBody>
                                        {payments.map((payment) => (
                                            <TableRow key={payment.id}>
                                                <TableCell className="font-mono text-blue-600">{payment.receipt_no}</TableCell>
                                                <TableCell>{new Date(payment.paid_on).toLocaleDateString()}</TableCell>
                                                <TableCell>
                                                    <Badge variant="outline">{payment.method}</Badge>
                                                </TableCell>
                                                <TableCell>{payment.allocation}</TableCell>
                                                <TableCell className="text-right font-medium text-green-600">
                                                    +{payment.amount.toFixed(2)}
                                                </TableCell>
                                            </TableRow>
                                        ))}
                                    </TableBody>
                                </Table>
                            )}
                        </CardContent>
                    </Card>
                </TabsContent>

                {/* Charges Tab */}
                <TabsContent value="charges">
                    <Card>
                        <CardHeader className="flex flex-row items-center justify-between">
                            <CardTitle>Additional Charges</CardTitle>
                            {deceased.status === 'IN_CUSTODY' && (
                                <Button size="sm" variant="outline">
                                    <Plus className="mr-2 h-4 w-4" />
                                    Add Charge
                                </Button>
                            )}
                        </CardHeader>
                        <CardContent>
                            {charges.length === 0 ? (
                                <div className="text-center py-8 text-muted-foreground">
                                    <DollarSign className="h-8 w-8 mx-auto mb-2 opacity-50" />
                                    <p>No additional charges</p>
                                </div>
                            ) : (
                                <Table>
                                    <TableHeader>
                                        <TableRow>
                                            <TableHead>Description</TableHead>
                                            <TableHead>Date Applied</TableHead>
                                            <TableHead className="text-right">Amount (GHS)</TableHead>
                                        </TableRow>
                                    </TableHeader>
                                    <TableBody>
                                        {charges.map((charge: any) => (
                                            <TableRow key={charge.id}>
                                                <TableCell>{charge.description}</TableCell>
                                                <TableCell>{charge.applied_on}</TableCell>
                                                <TableCell className="text-right font-medium">{charge.amount.toFixed(2)}</TableCell>
                                            </TableRow>
                                        ))}
                                    </TableBody>
                                </Table>
                            )}
                        </CardContent>
                    </Card>
                </TabsContent>
            </Tabs>
        </div>
    )
}
