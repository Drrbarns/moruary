import { createClient } from '@/utils/supabase/server'
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Separator } from '@/components/ui/separator'
import { Settings, Building2, Phone, MapPin, Save } from 'lucide-react'
import type { Branch } from '@/lib/types'
import { resolveBranch } from '@/lib/branch-resolver'
import { notFound } from 'next/navigation'

export default async function SettingsPage({ params }: { params: Promise<{ branchId: string }> }) {
    const { branchId } = await params
    const supabase = await createClient()

    // Resolve branch from code or UUID
    const branch = await resolveBranch(branchId)
    if (!branch) notFound()

    // Branch is already resolved, no need to fetch again
    // const branch = resolvedBranch as Branch

    return (
        <div className="space-y-6 p-8 max-w-4xl">
            {/* Header */}
            <div>
                <h1 className="text-3xl font-bold tracking-tight">Settings</h1>
                <p className="text-muted-foreground">Manage branch configuration</p>
            </div>

            {/* Branch Information */}
            <Card>
                <CardHeader>
                    <CardTitle className="flex items-center gap-2">
                        <Building2 className="h-5 w-5 text-blue-600" />
                        Branch Information
                    </CardTitle>
                    <CardDescription>Basic details about this branch</CardDescription>
                </CardHeader>
                <CardContent className="space-y-4">
                    <div className="grid gap-4 md:grid-cols-2">
                        <div className="space-y-2">
                            <Label htmlFor="name">Branch Name</Label>
                            <Input id="name" defaultValue={branch?.name || ''} disabled />
                        </div>
                        <div className="space-y-2">
                            <Label htmlFor="code">Branch Code</Label>
                            <Input id="code" defaultValue={branch?.code || ''} disabled className="font-mono" />
                        </div>
                    </div>
                    <div className="space-y-2">
                        <Label htmlFor="address">
                            <MapPin className="h-3 w-3 inline mr-1" />
                            Address
                        </Label>
                        <Input id="address" defaultValue={branch?.address || ''} disabled />
                    </div>
                    <div className="space-y-2">
                        <Label htmlFor="phone">
                            <Phone className="h-3 w-3 inline mr-1" />
                            Phone Number
                        </Label>
                        <Input id="phone" defaultValue={branch?.phone || ''} disabled />
                    </div>

                    <div className="pt-4">
                        <Button disabled>
                            <Save className="mr-2 h-4 w-4" />
                            Save Changes
                        </Button>
                        <p className="text-xs text-muted-foreground mt-2">
                            Contact a Super Admin to modify branch settings.
                        </p>
                    </div>
                </CardContent>
            </Card>

            {/* Fee Configuration */}
            <Card>
                <CardHeader>
                    <CardTitle className="flex items-center gap-2">
                        <Settings className="h-5 w-5 text-amber-600" />
                        Default Fee Configuration
                    </CardTitle>
                    <CardDescription>Set default fees for new admissions</CardDescription>
                </CardHeader>
                <CardContent className="space-y-4">
                    <div className="grid gap-4 md:grid-cols-3">
                        <div className="space-y-2">
                            <Label htmlFor="default_embalming">Default Embalming Fee (GHS)</Label>
                            <Input id="default_embalming" type="number" placeholder="0.00" disabled />
                        </div>
                        <div className="space-y-2">
                            <Label htmlFor="default_coldroom">Default Coldroom Fee (GHS)</Label>
                            <Input id="default_coldroom" type="number" placeholder="0.00" disabled />
                        </div>
                        <div className="space-y-2">
                            <Label htmlFor="daily_storage">Daily Storage Rate (GHS)</Label>
                            <Input id="daily_storage" type="number" placeholder="0.00" disabled />
                        </div>
                    </div>

                    <Separator />

                    <div className="grid gap-4 md:grid-cols-2">
                        <div className="space-y-2">
                            <Label htmlFor="vip_multiplier">VIP Rate Multiplier</Label>
                            <Input id="vip_multiplier" type="number" step="0.1" placeholder="1.5" disabled />
                            <p className="text-xs text-muted-foreground">e.g., 1.5 means VIP costs 50% more</p>
                        </div>
                    </div>

                    <div className="pt-4">
                        <Button disabled>
                            <Save className="mr-2 h-4 w-4" />
                            Save Fee Settings
                        </Button>
                        <p className="text-xs text-muted-foreground mt-2">
                            Fee configuration coming soon.
                        </p>
                    </div>
                </CardContent>
            </Card>

            {/* Receipt Settings */}
            <Card>
                <CardHeader>
                    <CardTitle>Receipt Numbering</CardTitle>
                    <CardDescription>Current receipt sequence numbers</CardDescription>
                </CardHeader>
                <CardContent>
                    <div className="grid gap-4 md:grid-cols-3">
                        <div className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg text-center">
                            <p className="text-sm text-muted-foreground">Admission (ADM)</p>
                            <p className="text-xl font-mono font-bold mt-1">{branch?.code}-ADM-0001</p>
                        </div>
                        <div className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg text-center">
                            <p className="text-sm text-muted-foreground">Payment (PMT)</p>
                            <p className="text-xl font-mono font-bold mt-1">{branch?.code}-PMT-0001</p>
                        </div>
                        <div className="p-4 bg-slate-50 dark:bg-slate-800 rounded-lg text-center">
                            <p className="text-sm text-muted-foreground">Discharge (DIS)</p>
                            <p className="text-xl font-mono font-bold mt-1">{branch?.code}-DIS-0001</p>
                        </div>
                    </div>
                    <p className="text-xs text-muted-foreground mt-4">
                        Receipt numbers are automatically incremented for each transaction type.
                    </p>
                </CardContent>
            </Card>
        </div>
    )
}
