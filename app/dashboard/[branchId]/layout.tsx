import { ReactNode } from 'react'
import { Sidebar } from '@/components/dashboard/sidebar'
import { createClient } from '@/utils/supabase/server'
import { redirect } from 'next/navigation'

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
            .eq('branch_id', branchId)
            .single()
        if (data) hasAccess = true
    }

    if (!hasAccess) {
        redirect('/select-branch')
    }

    return (
        <div className="flex min-h-screen bg-gray-50 dark:bg-gray-900">
            <div className="hidden md:flex flex-col w-64 fixed inset-y-0 z-50">
                <Sidebar branchId={branchId} />
            </div>
            <main className="flex-1 md:pl-64 transition-all duration-300">
                <div className="h-full">
                    {children}
                </div>
            </main>
        </div>
    )
}
