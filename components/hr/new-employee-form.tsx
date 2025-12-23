"use client"

import { useState } from "react"
import { useRouter } from "next/navigation"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { Loader2, Save } from "lucide-react"
import { toast } from "sonner"
import { createEmployeeAction } from "@/app/actions/create-employee"
import { SalaryStructure } from "@/lib/types"

interface NewEmployeeFormProps {
    branchId: string
    salaryStructures: SalaryStructure[]
}

export function NewEmployeeForm({ branchId, salaryStructures }: NewEmployeeFormProps) {
    const router = useRouter()
    const [loading, setLoading] = useState(false)

    // State
    const [formData, setFormData] = useState({
        full_name: '',
        email: '',
        phone: '',
        role: 'staff',
        employee_id: '',
        department: '',
        position: '',
        employment_type: 'full_time',
        date_hired: new Date().toISOString().split('T')[0],
        salary_structure_id: '',
        base_salary: 0
    })

    const handleStructureChange = (id: string) => {
        const structure = salaryStructures.find(s => s.id === id)
        if (structure) {
            setFormData(prev => ({
                ...prev,
                salary_structure_id: id,
                base_salary: structure.base_salary
                // We could also store allowances if needed
            }))
        }
    }

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault()
        setLoading(true)

        try {
            const result = await createEmployeeAction(formData, branchId)

            if (result.error) {
                toast.error(result.error)
            } else {
                toast.success('Employee created successfully', {
                    description: 'The user account has been created.'
                })
                router.push(`/dashboard/${branchId}/hr`)
            }
        } catch (error: any) {
            toast.error('An unexpected error occurred')
        } finally {
            setLoading(false)
        }
    }

    return (
        <form onSubmit={handleSubmit} className="space-y-6">
            <div className="grid gap-6 md:grid-cols-2">
                {/* Personal Information */}
                <Card>
                    <CardHeader>
                        <CardTitle>Personal & Account</CardTitle>
                        <CardDescription>Basic information and login details</CardDescription>
                    </CardHeader>
                    <CardContent className="space-y-4">
                        <div className="space-y-2">
                            <Label htmlFor="full_name">Full Name *</Label>
                            <Input
                                id="full_name"
                                required
                                placeholder="e.g. John Doe"
                                value={formData.full_name}
                                onChange={e => setFormData({ ...formData, full_name: e.target.value })}
                            />
                        </div>
                        <div className="space-y-2">
                            <Label htmlFor="email">Email Address *</Label>
                            <Input
                                id="email"
                                type="email"
                                required
                                placeholder="john@example.com"
                                value={formData.email}
                                onChange={e => setFormData({ ...formData, email: e.target.value })}
                            />
                            <p className="text-xs text-muted-foreground">Will be used for login.</p>
                        </div>
                        <div className="space-y-2">
                            <Label htmlFor="phone">Phone Number</Label>
                            <Input
                                id="phone"
                                placeholder="024XXXXXXX"
                                value={formData.phone}
                                onChange={e => setFormData({ ...formData, phone: e.target.value })}
                            />
                        </div>
                        <div className="space-y-2">
                            <Label htmlFor="role">System Role</Label>
                            <Select
                                value={formData.role}
                                onValueChange={val => setFormData({ ...formData, role: val })}
                            >
                                <SelectTrigger>
                                    <SelectValue />
                                </SelectTrigger>
                                <SelectContent>
                                    <SelectItem value="staff">Staff</SelectItem>
                                    <SelectItem value="branch_admin">Branch Admin</SelectItem>
                                </SelectContent>
                            </Select>
                        </div>
                    </CardContent>
                </Card>

                {/* Employment Details */}
                <Card>
                    <CardHeader>
                        <CardTitle>Employment Details</CardTitle>
                        <CardDescription>Job role and compensation</CardDescription>
                    </CardHeader>
                    <CardContent className="space-y-4">
                        <div className="space-y-2">
                            <Label htmlFor="emp_id">Employee ID</Label>
                            <Input
                                id="emp_id"
                                placeholder="e.g. EMP-001"
                                value={formData.employee_id}
                                onChange={e => setFormData({ ...formData, employee_id: e.target.value })}
                            />
                        </div>
                        <div className="grid grid-cols-2 gap-4">
                            <div className="space-y-2">
                                <Label htmlFor="department">Department</Label>
                                <Input
                                    id="department"
                                    placeholder="e.g. Mortuary"
                                    value={formData.department}
                                    onChange={e => setFormData({ ...formData, department: e.target.value })}
                                />
                            </div>
                            <div className="space-y-2">
                                <Label htmlFor="position">Position</Label>
                                <Input
                                    id="position"
                                    placeholder="e.g. Attendant"
                                    value={formData.position}
                                    onChange={e => setFormData({ ...formData, position: e.target.value })}
                                />
                            </div>
                        </div>
                        <div className="grid grid-cols-2 gap-4">
                            <div className="space-y-2">
                                <Label htmlFor="type">Employment Type</Label>
                                <Select
                                    value={formData.employment_type}
                                    onValueChange={val => setFormData({ ...formData, employment_type: val })}
                                >
                                    <SelectTrigger>
                                        <SelectValue />
                                    </SelectTrigger>
                                    <SelectContent>
                                        <SelectItem value="full_time">Full Time</SelectItem>
                                        <SelectItem value="part_time">Part Time</SelectItem>
                                        <SelectItem value="contract">Contract</SelectItem>
                                    </SelectContent>
                                </Select>
                            </div>
                            <div className="space-y-2">
                                <Label htmlFor="date">Date Hired</Label>
                                <Input
                                    id="date"
                                    type="date"
                                    value={formData.date_hired}
                                    onChange={e => setFormData({ ...formData, date_hired: e.target.value })}
                                />
                            </div>
                        </div>

                        <div className="pt-4 border-t">
                            <div className="space-y-2">
                                <Label htmlFor="structure">Salary Structure</Label>
                                <Select
                                    value={formData.salary_structure_id}
                                    onValueChange={handleStructureChange}
                                >
                                    <SelectTrigger>
                                        <SelectValue placeholder="Select a structure..." />
                                    </SelectTrigger>
                                    <SelectContent>
                                        {salaryStructures.map(s => (
                                            <SelectItem key={s.id} value={s.id}>
                                                {s.name} (GHS {s.base_salary})
                                            </SelectItem>
                                        ))}
                                    </SelectContent>
                                </Select>
                                {formData.base_salary > 0 && (
                                    <p className="text-sm text-green-600 font-medium mt-1">
                                        Base Salary: GHS {formData.base_salary.toFixed(2)}
                                    </p>
                                )}
                            </div>
                        </div>
                    </CardContent>
                </Card>
            </div>

            <div className="flex justify-end gap-4">
                <Button type="button" variant="outline" onClick={() => router.back()}>
                    Cancel
                </Button>
                <Button type="submit" disabled={loading} className="bg-blue-600 hover:bg-blue-700">
                    {loading && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
                    <Save className="mr-2 h-4 w-4" />
                    Create Employee
                </Button>
            </div>
        </form>
    )
}
