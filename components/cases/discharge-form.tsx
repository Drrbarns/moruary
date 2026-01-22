'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import Link from 'next/link'
import { createClient } from '@/utils/supabase/client'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Card, CardContent, CardHeader, CardTitle, CardDescription, CardFooter } from '@/components/ui/card'
import { Separator } from '@/components/ui/separator'
import { Checkbox } from '@/components/ui/checkbox'
import { ArrowLeft, Loader2, CheckCircle, AlertTriangle, Calendar, DollarSign } from 'lucide-react'
import { toast } from 'sonner'
import type { DeceasedCase, Branch } from '@/lib/types'
import { calculateProjectedBill } from '@/lib/pricing'

interface DischargeFormProps {
    branch: Branch
    caseData: DeceasedCase
}

export function DischargeForm({ branch, caseData }: DischargeFormProps) {
    const router = useRouter()
    const supabase = createClient()
    const [loading, setLoading] = useState(false)
    const [confirmed, setConfirmed] = useState(false)
    const [dischargeDate, setDischargeDate] = useState(new Date().toISOString().split('T')[0])

    // Calculate storage days
    const admissionDate = caseData.admission_date ? new Date(caseData.admission_date) : new Date(caseData.created_at)
    const selectedDischargeDate = new Date(dischargeDate)
    const storageDays = Math.ceil((selectedDischargeDate.getTime() - admissionDate.getTime()) / (1000 * 60 * 60 * 24)) + 1

    const hasOutstandingBalance = caseData.balance > 0

    const handleDischarge = async () => {
        if (!confirmed) {
            toast.error('Please confirm the discharge')
            return
        }

        setLoading(true)

        try {
            // Update case status
            const { error } = await supabase
                .from('deceased_cases')
                .update({
                    status: 'DISCHARGED',
                    discharge_date: dischargeDate,
                    storage_days: storageDays,
                    updated_at: new Date().toISOString(),
                })
                .eq('id', caseData.id)

            if (error) throw error

            toast.success('Case discharged successfully', {
                description: `${caseData.name_of_deceased} has been released`,
            })

            router.push(`/dashboard/${branch.code}/cases/${caseData.id}`)
            router.refresh()
        } catch (error: any) {
            toast.error('Failed to discharge case', {
                description: error.message,
            })
        } finally {
            setLoading(false)
        }
    }

    // Calculate fees dynamically based on selected date
    const calculatedFees = calculateProjectedBill(
        admissionDate,
        (caseData.type as 'Normal' | 'VIP') || 'Normal',
        {
            registration: caseData.registration_fee,
            embalming: caseData.embalming_fee // Should be 0 based on recent changes
        }
    )

    // We override the days with our locally calculated one to match the date picker
    const dailyRate = calculatedFees.dailyRate
    const currentStorageFee = storageDays * dailyRate

    // Outstanding Balance Logic:
    // Total Bill = Registration + Coldroom + ...
    // But Registration is paid at admission.
    // So Final Balance to Pay = Computed Storage Fee - (Total Paid - Registration Paid)
    // Simplified: Balance = Computed Storage Fee - (Payments made towards Coldroom)

    // We need to estimate how much was paid towards coldroom.
    // Since we don't have the payments array here, we rely on caseData.total_paid.
    // Assumption: Registration fee (350) was paid if total_paid >= 350.
    const regFee = caseData.registration_fee || 350
    const totalPaid = caseData.total_paid || 0

    // Amount paid towards storage = Total Paid - Registration Fee
    // (If total paid is less than registration, then storage paid is 0)
    const paidTowardsStorage = Math.max(0, totalPaid - regFee)

    const finalBalance = Math.max(0, currentStorageFee - paidTowardsStorage)

    return (
        <div className="space-y-6 p-8 max-w-3xl mx-auto">
            {/* Header */}
            <div className="flex items-center gap-4">
                <Link href={`/dashboard/${branch.code}/cases/${caseData.id}`}>
                    <Button variant="ghost" size="icon">
                        <ArrowLeft className="h-5 w-5" />
                    </Button>
                </Link>
                <div>
                    <h1 className="text-3xl font-bold tracking-tight">Discharge Case</h1>
                    <p className="text-muted-foreground">Release {caseData.name_of_deceased} to family</p>
                </div>
            </div>

            {/* Warning Banner for Outstanding Balance */}
            {finalBalance > 0 && (
                <div className="bg-amber-50 border border-amber-200 rounded-lg p-4 flex items-start gap-3">
                    <AlertTriangle className="h-5 w-5 text-amber-600 flex-shrink-0 mt-0.5" />
                    <div>
                        <h3 className="font-medium text-amber-800">Outstanding Balance</h3>
                        <p className="text-sm text-amber-700">
                            This case has an unpaid storage balance of <strong>GHS {finalBalance.toFixed(2)}</strong>.
                        </p>
                    </div>
                </div>
            )}

            {/* Case Summary */}
            <Card>
                <CardHeader>
                    <CardTitle>Case Summary</CardTitle>
                    <CardDescription>Review before discharging</CardDescription>
                </CardHeader>
                <CardContent className="space-y-4">
                    <div className="grid grid-cols-2 gap-4">
                        <div>
                            <p className="text-sm text-muted-foreground">Tag Number</p>
                            <p className="font-mono font-medium">{caseData.tag_no}</p>
                        </div>
                        <div>
                            <p className="text-sm text-muted-foreground">Deceased Name</p>
                            <p className="font-medium">{caseData.name_of_deceased}</p>
                        </div>
                        <div>
                            <p className="text-sm text-muted-foreground">Admission Date</p>
                            <p className="font-medium">{caseData.admission_date || '-'}</p>
                        </div>
                        <div>
                            <p className="text-sm text-muted-foreground">Next of Kin</p>
                            <p className="font-medium">{caseData.relative_name || 'Not provided'}</p>
                        </div>
                    </div>
                </CardContent>
            </Card>

            {/* Discharge Details */}
            <Card>
                <CardHeader>
                    <CardTitle className="flex items-center gap-2">
                        <Calendar className="h-5 w-5 text-blue-600" />
                        Discharge Details
                    </CardTitle>
                </CardHeader>
                <CardContent className="space-y-4">
                    <div className="space-y-2">
                        <Label htmlFor="discharge_date">Discharge Date</Label>
                        <Input
                            id="discharge_date"
                            type="date"
                            value={dischargeDate}
                            onChange={(e) => setDischargeDate(e.target.value)}
                        />
                    </div>

                    <div className="bg-slate-50 dark:bg-slate-800 rounded-lg p-4 space-y-2">
                        <div className="flex justify-between items-center">
                            <span className="text-muted-foreground">Duration</span>
                            <span className="font-medium">{storageDays} days</span>
                        </div>
                        <div className="flex justify-between items-center">
                            <span className="text-muted-foreground">Rate ({caseData.type})</span>
                            <span className="font-medium">GHS {dailyRate.toFixed(2)}/day</span>
                        </div>
                        <Separator />
                        <div className="flex justify-between items-center pt-2">
                            <span className="font-semibold">Computed Storage Fee</span>
                            <span className="text-xl font-bold text-blue-600">GHS {currentStorageFee.toFixed(2)}</span>
                        </div>
                    </div>
                </CardContent>
            </Card>

            {/* Financial Summary */}
            <Card>
                <CardHeader>
                    <CardTitle className="flex items-center gap-2">
                        <DollarSign className="h-5 w-5 text-green-600" />
                        Final Payment Due
                    </CardTitle>
                </CardHeader>
                <CardContent className="space-y-3">
                    <div className="flex justify-between">
                        <span className="text-muted-foreground">Storage Fee</span>
                        <span className="font-medium">GHS {currentStorageFee.toFixed(2)}</span>
                    </div>
                    <div className="flex justify-between">
                        <span className="text-muted-foreground">Less: Paid towards Storage</span>
                        <span className="font-medium text-green-600">- GHS {paidTowardsStorage.toFixed(2)}</span>
                    </div>
                    <Separator />
                    <div className="flex justify-between text-lg">
                        <span className="font-medium">Balance Due</span>
                        <span className={`font-bold ${finalBalance > 0 ? 'text-red-600' : 'text-green-600'}`}>
                            {finalBalance > 0 ? `GHS ${finalBalance.toFixed(2)}` : 'Cleared'}
                        </span>
                    </div>
                </CardContent>
            </Card>

            {/* Confirmation */}
            <Card>
                <CardContent className="pt-6">
                    <div className="flex items-start space-x-3">
                        <Checkbox
                            id="confirm"
                            checked={confirmed}
                            onCheckedChange={(checked) => setConfirmed(checked as boolean)}
                        />
                        <div className="grid gap-1.5 leading-none">
                            <label
                                htmlFor="confirm"
                                className="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                            >
                                I confirm this discharge
                            </label>
                            <p className="text-sm text-muted-foreground">
                                {hasOutstandingBalance
                                    ? 'I understand there is an outstanding balance and accept responsibility for this discharge.'
                                    : 'All payments have been received and the case is ready for release.'}
                            </p>
                        </div>
                    </div>
                </CardContent>
                <CardFooter className="flex gap-2">
                    <Link href={`/dashboard/${branch.code}/cases/${caseData.id}`} className="flex-1">
                        <Button variant="outline" className="w-full">Cancel</Button>
                    </Link>
                    <Button
                        onClick={handleDischarge}
                        className="flex-1 bg-green-600 hover:bg-green-700"
                        disabled={loading || !confirmed}
                    >
                        {loading ? <Loader2 className="mr-2 h-4 w-4 animate-spin" /> : <CheckCircle className="mr-2 h-4 w-4" />}
                        Confirm Discharge
                    </Button>
                </CardFooter>
            </Card>
        </div>
    )
}
