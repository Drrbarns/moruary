import { createClient } from '@/utils/supabase/server'
import { redirect } from 'next/navigation'
import Link from 'next/link'
import { Card, CardHeader, CardTitle, CardContent, CardDescription } from '@/components/ui/card'
import { Building2, ArrowRight, Shield, LogOut, ArrowLeft } from 'lucide-react'
import { Button } from '@/components/ui/button'

interface PageProps {
    searchParams: Promise<{ switch?: string }>
}

export default async function SelectBranchPage({ searchParams }: PageProps) {
    const supabase = await createClient()
    const { data: { user } } = await supabase.auth.getUser()
    const params = await searchParams

    // Check if this is a manual switch request
    const isManualSwitch = params?.switch === 'true'

    if (!user) {
        redirect('/auth/login')
    }

    // Fetch user profile to check role
    const { data: profile } = await supabase
        .from('profiles')
        .select('role, full_name')
        .eq('id', user.id)
        .single()

    const isSuperAdmin = profile?.role === 'super_admin'

    // SUPER ADMIN handling
    if (isSuperAdmin) {
        // If NOT manual switch, auto-redirect to primary/first branch
        if (!isManualSwitch) {
            // Get primary branch for super admin
            const { data: primaryAssignment } = await supabase
                .from('user_branch_assignments')
                .select('branch_id')
                .eq('user_id', user.id)
                .eq('is_primary', true)
                .single()

            if (primaryAssignment?.branch_id) {
                redirect(`/dashboard/${primaryAssignment.branch_id}`)
            }

            // If no primary, get the first available branch
            const { data: firstBranch } = await supabase
                .from('branches')
                .select('id')
                .eq('is_active', true)
                .order('name')
                .limit(1)
                .single()

            if (firstBranch?.id) {
                redirect(`/dashboard/${firstBranch.id}`)
            }
        }

        // Manual switch OR no branches: Show ALL branches for super admin
        const { data: allBranches } = await supabase
            .from('branches')
            .select('*')
            .eq('is_active', true)
            .order('name')

        const branches = allBranches || []

        if (branches.length === 0) {
            // No branches exist at all - show admin a message
            return (
                <div className="min-h-screen bg-gray-50 flex flex-col items-center justify-center p-6">
                    <Card className="max-w-md w-full text-center p-8">
                        <div className="flex justify-center mb-4">
                            <div className="p-3 bg-yellow-100 rounded-full">
                                <Shield className="h-8 w-8 text-yellow-600" />
                            </div>
                        </div>
                        <CardTitle className="mb-2">No Branches Available</CardTitle>
                        <CardDescription className="mb-4">
                            Welcome, {profile?.full_name || 'Admin'}! There are no active branches in the system yet.
                            Please create a branch to get started.
                        </CardDescription>
                    </Card>
                </div>
            )
        }

        // Show branch selection for super admin
        return (
            <div className="min-h-screen bg-gray-50 flex flex-col items-center justify-center p-6">
                <div className="max-w-4xl w-full space-y-8">
                    <div className="text-center space-y-2">
                        <div className="flex items-center justify-center gap-2 mb-2">
                            <span className="bg-gradient-to-r from-blue-600 to-purple-600 text-white text-xs font-semibold px-3 py-1 rounded-full">
                                Super Admin
                            </span>
                        </div>
                        <h1 className="text-3xl font-bold tracking-tight text-gray-900">Switch Branch</h1>
                        <p className="text-gray-500">Select a branch to manage. You have access to all branches.</p>
                    </div>

                    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                        {branches.map((branch) => (
                            <Link key={branch.id} href={`/dashboard/${branch.id}`} className="group">
                                <Card className="h-full transition-all hover:shadow-lg hover:border-blue-500 cursor-pointer bg-white">
                                    <CardHeader>
                                        <div className="flex items-center justify-between mb-2">
                                            <div className="p-2 bg-blue-50 rounded-lg text-blue-600 group-hover:bg-blue-600 group-hover:text-white transition-colors">
                                                <Building2 className="h-6 w-6" />
                                            </div>
                                            <span className="text-xs font-medium font-mono bg-slate-100 px-2 py-1 rounded text-slate-600">{branch.code}</span>
                                        </div>
                                        <CardTitle className="text-xl group-hover:text-blue-600 transition-colors">{branch.name}</CardTitle>
                                        <CardDescription className="line-clamp-1">{branch.address || 'No address provided'}</CardDescription>
                                    </CardHeader>
                                    <CardContent>
                                        <div className="text-sm font-medium text-blue-600 flex items-center gap-1 opacity-0 group-hover:opacity-100 transform translate-x-[-10px] group-hover:translate-x-0 transition-all duration-300">
                                            Enter Dashboard <ArrowRight className="h-4 w-4" />
                                        </div>
                                    </CardContent>
                                </Card>
                            </Link>
                        ))}
                    </div>
                </div>
            </div>
        )
    }

    // STAFF/BRANCH_ADMIN: Show only their assigned branches
    let branches: any[] = []

    const { data: assignments } = await supabase
        .from('user_branch_assignments')
        .select(`
            branch_id,
            is_primary,
            branches:branch_id (
                id,
                name,
                code,
                address,
                phone,
                is_active
            )
        `)
        .eq('user_id', user.id)

    // Extract branches from assignments
    branches = assignments
        ?.map((item: any) => item.branches)
        .filter((b: any) => b?.is_active) || []

    // If staff has only one branch and NOT manual switch, redirect directly
    if (branches.length === 1 && !isManualSwitch) {
        redirect(`/dashboard/${branches[0].id}`)
    }

    return (
        <div className="min-h-screen bg-gray-50 flex flex-col items-center justify-center p-6">
            <div className="max-w-4xl w-full space-y-8">
                <div className="text-center space-y-2">
                    <h1 className="text-3xl font-bold tracking-tight text-gray-900">Select Branch</h1>
                    <p className="text-gray-500">Choose a location to manage operations</p>
                </div>

                {branches.length === 0 ? (
                    <Card className="text-center p-6 border-dashed">
                        <CardContent className="pt-6 space-y-4">
                            <div className="flex justify-center mb-2">
                                <div className="p-3 bg-red-50 rounded-full">
                                    <Building2 className="h-8 w-8 text-red-500" />
                                </div>
                            </div>
                            <p className="text-muted-foreground">No branches assigned to your account. Please contact an administrator.</p>
                            <Link href="/auth/logout" className="inline-flex items-center gap-2 text-sm text-blue-600 hover:underline">
                                <LogOut className="h-4 w-4" />
                                Sign out and try a different account
                            </Link>
                        </CardContent>
                    </Card>
                ) : (
                    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                        {branches.map((branch) => (
                            <Link key={branch.id} href={`/dashboard/${branch.id}`} className="group">
                                <Card className="h-full transition-all hover:shadow-lg hover:border-blue-500 cursor-pointer bg-white">
                                    <CardHeader>
                                        <div className="flex items-center justify-between mb-2">
                                            <div className="p-2 bg-blue-50 rounded-lg text-blue-600 group-hover:bg-blue-600 group-hover:text-white transition-colors">
                                                <Building2 className="h-6 w-6" />
                                            </div>
                                            <span className="text-xs font-medium font-mono bg-slate-100 px-2 py-1 rounded text-slate-600">{branch.code}</span>
                                        </div>
                                        <CardTitle className="text-xl group-hover:text-blue-600 transition-colors">{branch.name}</CardTitle>
                                        <CardDescription className="line-clamp-1">{branch.address || 'No address provided'}</CardDescription>
                                    </CardHeader>
                                    <CardContent>
                                        <div className="text-sm font-medium text-blue-600 flex items-center gap-1 opacity-0 group-hover:opacity-100 transform translate-x-[-10px] group-hover:translate-x-0 transition-all duration-300">
                                            Enter Dashboard <ArrowRight className="h-4 w-4" />
                                        </div>
                                    </CardContent>
                                </Card>
                            </Link>
                        ))}
                    </div>
                )}
            </div>
        </div>
    )
}
