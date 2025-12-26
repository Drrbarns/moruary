'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import { createClient } from '@/utils/supabase/client'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Textarea } from '@/components/ui/textarea'
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from '@/components/ui/card'
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from '@/components/ui/select'
import { Separator } from '@/components/ui/separator'
import { ArrowLeft, Loader2, Save, User, Phone, FileText, DollarSign } from 'lucide-react'
import Link from 'next/link'
import { toast } from 'sonner'
import type { Branch } from '@/lib/types'

interface CaseFormProps {
    branch: Branch
    initialData?: any
    mode: 'create' | 'edit'
}

export function CaseForm({ branch, initialData, mode }: CaseFormProps) {
    const router = useRouter()
    const supabase = createClient()
    const [loading, setLoading] = useState(false)

    // Form state
    const [formData, setFormData] = useState({
        tag_no: initialData?.tag_no || '',
        name_of_deceased: initialData?.name_of_deceased || '',
        age: initialData?.age || '',
        gender: initialData?.gender || '',
        place: initialData?.place || '',
        admission_date: initialData?.admission_date || new Date().toISOString().split('T')[0],
        admission_time: initialData?.admission_time || new Date().toTimeString().slice(0, 5),
        type: initialData?.type || 'Normal',
        relative_name: initialData?.relative_name || '',
        relative_contact: initialData?.relative_contact || '',
        relative_contact_secondary: initialData?.relative_contact_secondary || '',
        registration_fee: initialData?.registration_fee || 350,
        embalming_fee: initialData?.embalming_fee || 50,
        coldroom_fee: 0,
        initial_deposit: initialData?.total_paid || 0,
        notes: initialData?.notes || '',
    })

    const handleChange = (field: string, value: any) => {
        setFormData(prev => ({ ...prev, [field]: value }))
    }

    const calculateTotalBill = () => {
        return (
            Number(formData.registration_fee || 0) +
            Number(formData.embalming_fee || 0)
        )
    }

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault()
        setLoading(true)

        try {
            const totalBill = calculateTotalBill()
            const totalPaid = mode === 'create' ? Number(formData.initial_deposit || 0) : (initialData?.total_paid || 0)
            const balance = totalBill - totalPaid

            const caseData = {
                branch_id: branch.id,
                tag_no: formData.tag_no,
                name_of_deceased: formData.name_of_deceased,
                age: formData.age ? Number(formData.age) : null,
                gender: formData.gender || null,
                place: formData.place || null,
                admission_date: formData.admission_date,
                admission_time: formData.admission_time,
                type: formData.type,
                relative_name: formData.relative_name || null,
                relative_contact: formData.relative_contact || null,
                relative_contact_secondary: formData.relative_contact_secondary || null,
                registration_fee: Number(formData.registration_fee) || 0,
                embalming_fee: Number(formData.embalming_fee) || 0,
                coldroom_fee: Number(formData.coldroom_fee) || 0,
                storage_fee: 0,
                total_bill: totalBill,
                total_paid: totalPaid,
                balance: balance,
                notes: formData.notes || null,
                status: 'IN_CUSTODY',
            }

            if (mode === 'create') {
                const { data, error } = await supabase
                    .from('deceased_cases')
                    .insert(caseData)
                    .select()
                    .single()

                if (error) throw error

                // Record initial deposit as a payment
                const initialDeposit = Number(formData.initial_deposit || 0)
                if (initialDeposit > 0) {
                    const { error: paymentError } = await supabase
                        .from('payments')
                        .insert({
                            branch_id: branch.id,
                            case_id: data.id,
                            amount: initialDeposit,
                            method: 'CASH', // Default for initial
                            allocation: 'GENERAL',
                            receipt_no: `RCT-${Date.now()}`, // Simple receipt generation
                            paid_on: new Date().toISOString(),
                            notes: 'Initial Deposit at Admission'
                        })

                    if (paymentError) {
                        console.error('Failed to create payment record', paymentError)
                        toast.error('Case created but failed to save payment record')
                    }
                }

                toast.success('Case created successfully', {
                    description: `Tag: ${formData.tag_no}`,
                })
                // Redirect to receipt page for printing registration fee receipt
                router.push(`/dashboard/${branch.code}/receipts/registration/${data.id}`)
            } else {
                const { error } = await supabase
                    .from('deceased_cases')
                    .update({ ...caseData, updated_at: new Date().toISOString() })
                    .eq('id', initialData.id)

                if (error) throw error

                toast.success('Case updated successfully')
                router.push(`/dashboard/${branch.code}/cases/${initialData.id}`)
            }

            router.refresh()
        } catch (error: any) {
            toast.error('Failed to save case', {
                description: error.message,
            })
        } finally {
            setLoading(false)
        }
    }

    return (
        <form onSubmit={handleSubmit} className="space-y-6 p-8">
            {/* Header */}
            <div className="flex items-center gap-4">
                <Link href={`/dashboard/${branch.code}/cases`}>
                    <Button variant="ghost" size="icon">
                        <ArrowLeft className="h-5 w-5" />
                    </Button>
                </Link>
                <div>
                    <h1 className="text-3xl font-bold tracking-tight">
                        {mode === 'create' ? 'New Admission' : 'Edit Case'}
                    </h1>
                    <p className="text-muted-foreground">
                        {mode === 'create' ? 'Record a new deceased admission' : `Editing: ${initialData?.tag_no}`}
                    </p>
                </div>
            </div>

            <div className="grid gap-6 lg:grid-cols-3">
                {/* Main Form - Left Side */}
                <div className="lg:col-span-2 space-y-6">
                    {/* Deceased Information */}
                    <Card>
                        <CardHeader>
                            <CardTitle className="flex items-center gap-2">
                                <FileText className="h-5 w-5 text-blue-600" />
                                Deceased Information
                            </CardTitle>
                            <CardDescription>Basic details about the deceased</CardDescription>
                        </CardHeader>
                        <CardContent className="space-y-4">
                            <div className="grid gap-4 sm:grid-cols-2">
                                <div className="space-y-2">
                                    <Label htmlFor="tag_no">Tag Number *</Label>
                                    <Input
                                        id="tag_no"
                                        placeholder="e.g., ACC-2024-001"
                                        value={formData.tag_no}
                                        onChange={(e) => handleChange('tag_no', e.target.value)}
                                        required
                                        className="font-mono"
                                    />
                                </div>
                                <div className="space-y-2">
                                    <Label htmlFor="type">Case Type</Label>
                                    <Select value={formData.type} onValueChange={(v) => handleChange('type', v)}>
                                        <SelectTrigger>
                                            <SelectValue placeholder="Select type" />
                                        </SelectTrigger>
                                        <SelectContent>
                                            <SelectItem value="Normal">Normal</SelectItem>
                                            <SelectItem value="VIP">VIP</SelectItem>
                                        </SelectContent>
                                    </Select>
                                </div>
                            </div>

                            <div className="space-y-2">
                                <Label htmlFor="name_of_deceased">Name of Deceased *</Label>
                                <Input
                                    id="name_of_deceased"
                                    placeholder="Full name"
                                    value={formData.name_of_deceased}
                                    onChange={(e) => handleChange('name_of_deceased', e.target.value)}
                                    required
                                />
                            </div>

                            <div className="grid gap-4 sm:grid-cols-3">
                                <div className="space-y-2">
                                    <Label htmlFor="age">Age</Label>
                                    <Input
                                        id="age"
                                        type="number"
                                        placeholder="Years"
                                        value={formData.age}
                                        onChange={(e) => handleChange('age', e.target.value)}
                                    />
                                </div>
                                <div className="space-y-2">
                                    <Label htmlFor="gender">Gender</Label>
                                    <Select value={formData.gender} onValueChange={(v) => handleChange('gender', v)}>
                                        <SelectTrigger>
                                            <SelectValue placeholder="Select" />
                                        </SelectTrigger>
                                        <SelectContent>
                                            <SelectItem value="Male">Male</SelectItem>
                                            <SelectItem value="Female">Female</SelectItem>
                                            <SelectItem value="Other/Unknown">Other/Unknown</SelectItem>
                                        </SelectContent>
                                    </Select>
                                </div>
                                <div className="space-y-2">
                                    <Label htmlFor="place">Place/Town</Label>
                                    <Input
                                        id="place"
                                        placeholder="Location"
                                        value={formData.place}
                                        onChange={(e) => handleChange('place', e.target.value)}
                                    />
                                </div>
                            </div>

                            <div className="grid gap-4 sm:grid-cols-2">
                                <div className="space-y-2">
                                    <Label htmlFor="admission_date">Admission Date</Label>
                                    <Input
                                        id="admission_date"
                                        type="date"
                                        value={formData.admission_date}
                                        onChange={(e) => handleChange('admission_date', e.target.value)}
                                    />
                                </div>
                                <div className="space-y-2">
                                    <Label htmlFor="admission_time">Admission Time</Label>
                                    <Input
                                        id="admission_time"
                                        type="time"
                                        value={formData.admission_time}
                                        onChange={(e) => handleChange('admission_time', e.target.value)}
                                    />
                                </div>
                            </div>
                        </CardContent>
                    </Card>

                    {/* Relative Information */}
                    <Card>
                        <CardHeader>
                            <CardTitle className="flex items-center gap-2">
                                <User className="h-5 w-5 text-green-600" />
                                Relatives Information
                            </CardTitle>
                            <CardDescription>Contact information for relatives</CardDescription>
                        </CardHeader>
                        <CardContent className="space-y-4">
                            <div className="space-y-2">
                                <Label htmlFor="relative_name">Relative Name</Label>
                                <Input
                                    id="relative_name"
                                    placeholder="Full name of next of kin"
                                    value={formData.relative_name}
                                    onChange={(e) => handleChange('relative_name', e.target.value)}
                                />
                            </div>
                            <div className="grid gap-4 sm:grid-cols-2">
                                <div className="space-y-2">
                                    <Label htmlFor="relative_contact">Primary Contact</Label>
                                    <div className="relative">
                                        <Phone className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
                                        <Input
                                            id="relative_contact"
                                            placeholder="0244xxxxxxx"
                                            className="pl-10"
                                            value={formData.relative_contact}
                                            onChange={(e) => handleChange('relative_contact', e.target.value)}
                                        />
                                    </div>
                                </div>
                                <div className="space-y-2">
                                    <Label htmlFor="relative_contact_secondary">Secondary Contact</Label>
                                    <div className="relative">
                                        <Phone className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
                                        <Input
                                            id="relative_contact_secondary"
                                            placeholder="Optional"
                                            className="pl-10"
                                            value={formData.relative_contact_secondary}
                                            onChange={(e) => handleChange('relative_contact_secondary', e.target.value)}
                                        />
                                    </div>
                                </div>
                            </div>
                        </CardContent>
                    </Card>

                    {/* Notes */}
                    <Card>
                        <CardHeader>
                            <CardTitle>Additional Notes</CardTitle>
                        </CardHeader>
                        <CardContent>
                            <Textarea
                                placeholder="Any additional information..."
                                rows={4}
                                value={formData.notes}
                                onChange={(e) => handleChange('notes', e.target.value)}
                            />
                        </CardContent>
                    </Card>
                </div>

                {/* Right Sidebar - Fees */}
                <div className="space-y-6">
                    <Card className="sticky top-8">
                        <CardHeader>
                            <CardTitle className="flex items-center gap-2">
                                <DollarSign className="h-5 w-5 text-amber-600" />
                                Initial Charges
                            </CardTitle>
                            <CardDescription>Set the initial fees for this case</CardDescription>
                        </CardHeader>
                        <CardContent className="space-y-4">
                            <div className="space-y-2">
                                <Label htmlFor="registration_fee">Registration Fee (GHS)</Label>
                                <Input
                                    id="registration_fee"
                                    type="number"
                                    step="0.01"
                                    placeholder="0.00"
                                    value={formData.registration_fee}
                                    onChange={(e) => handleChange('registration_fee', e.target.value)}
                                />
                            </div>
                            <div className="space-y-2">
                                <Label htmlFor="embalming_fee">Embalming Fee (GHS)</Label>
                                <Input
                                    id="embalming_fee"
                                    type="number"
                                    step="0.01"
                                    placeholder="0.00"
                                    value={formData.embalming_fee}
                                    onChange={(e) => handleChange('embalming_fee', e.target.value)}
                                />
                            </div>

                            <div className="space-y-2">
                                <Label htmlFor="initial_deposit">Initial Deposit (GHS)</Label>
                                <Input
                                    id="initial_deposit"
                                    type="number"
                                    step="0.01"
                                    placeholder="0.00"
                                    value={formData.initial_deposit}
                                    onChange={(e) => handleChange('initial_deposit', e.target.value)}
                                />
                                <p className="text-xs text-muted-foreground">Amount paid upfront against the final bill</p>
                            </div>

                            <Separator />

                            <div className="flex justify-between items-center py-2">
                                <span className="font-medium">Total Bill:</span>
                                <span className="text-xl font-bold text-blue-600">
                                    GHS {calculateTotalBill().toFixed(2)}
                                </span>
                            </div>

                            <Button type="submit" className="w-full bg-blue-600 hover:bg-blue-700" disabled={loading}>
                                {loading ? <Loader2 className="mr-2 h-4 w-4 animate-spin" /> : <Save className="mr-2 h-4 w-4" />}
                                {mode === 'create' ? 'Create Case' : 'Save Changes'}
                            </Button>
                        </CardContent>
                    </Card>
                </div>
            </div>
        </form>
    )
}
