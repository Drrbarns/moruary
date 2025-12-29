import { ReactNode } from 'react'
import { DashboardLayoutClient } from '@/components/dashboard/dashboard-layout-client'
import { createClient } from '@/utils/supabase/server'
import { redirect, notFound } from 'next/navigation'
import { resolveBranch } from '@/lib/branch-resolver'

export default async function DashboardLayout({
    children,
    params,
}: {
    children: ReactNode
    params: Promise<{ branchId: string }>
}) {
    const supabase = await createClient()
    const { data: { user } } = await supabase.auth.getUser()

    if (!user) {
        redirect('/auth/login')
    }

    // Next.js 15+ params are async promises
    const { branchId } = await params

    // Resolve branch from code or UUID
    const branch = await resolveBranch(branchId)
    if (!branch) {
        notFound()
    }

    // Security Check: Does user have access to this branch?
    const { data: profile } = await supabase
        .from('profiles')
        .select('role')
        .eq('id', user.id)
        .single()

    let hasAccess = false
    if (profile?.role === 'super_admin') {
        hasAccess = true
    } else {
        const { data } = await supabase
            .from('user_branch_assignments')
            .select('branch_id')
            .eq('user_id', user.id)
            .eq('branch_id', branch.id)  // Use resolved branch ID
            .single()
        if (data) hasAccess = true
    }

    if (!hasAccess) {
        redirect('/select-branch')
    }

    return (
        <DashboardLayoutClient branch={branch} userRole={profile?.role || 'staff'}>
            {children}
        </DashboardLayoutClient>
    )
}
