'use server'

import { createClient } from '@/utils/supabase/server'
import { revalidatePath } from 'next/cache'
import { redirect } from 'next/navigation'

export async function deleteCase(caseId: string, branchCode: string) {
    const supabase = await createClient()

    // Auth Check
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) {
        return { error: 'Unauthorized' }
    }

    // Role Check
    const { data: profile } = await supabase
        .from('profiles')
        .select('role')
        .eq('id', user.id)
        .single()

    const isAdmin = profile?.role === 'admin' || profile?.role === 'super_admin'

    if (!isAdmin) {
        return { error: 'Only admins can delete cases' }
    }

    // Delete related records first if no cascade (safe approach, though DB might cascade)
    // Deleting payments is serious, so usually we might soft delete or ensure we really want this.
    // Assuming hard delete is requested.

    // Check if payments exist?
    // Usually systems prevent deleting if payments exist.
    // For now I will attempt delete pending constraints.
    // If we rely on cascade delete, we just delete the case.

    // Let's assume database handles cascades or we need to delete straightforwardly.
    // If there are foreign keys without cascade, this will fail.
    // But forcing delete usually implies cleaning up.

    // Attempt delete
    const { error } = await supabase
        .from('deceased_cases')
        .delete()
        .eq('id', caseId)

    if (error) {
        console.error('Delete error:', error)
        return { error: error.message }
    }

    revalidatePath(`/dashboard/${branchCode}/cases`)
    return { success: true }
}
