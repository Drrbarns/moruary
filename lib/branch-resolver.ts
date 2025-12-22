// =============================================
// BRANCH RESOLVER UTILITY
// =============================================
// This utility helps convert between branch codes and IDs
// Use this when you need to work with branch codes in URLs

import { createClient } from '@/utils/supabase/server'

/**
 * Get branch by code (e.g., 'ACC', 'KUM')
 * Use this in page components to resolve the branch from URL
 */
export async function getBranchByCode(code: string) {
    const supabase = await createClient()

    const { data: branch, error } = await supabase
        .from('branches')
        .select('*')
        .eq('code', code.toUpperCase())
        .eq('is_active', true)
        .single()

    if (error || !branch) {
        return null
    }

    return branch
}

/**
 * Get branch by ID (UUID)
 * Fallback for existing functionality
 */
export async function getBranchById(id: string) {
    const supabase = await createClient()

    const { data: branch, error } = await supabase
        .from('branches')
        .select('*')
        .eq('id', id)
        .eq('is_active', true)
        .single()

    if (error || !branch) {
        return null
    }

    return branch
}

/**
 * Resolve branch from either code or ID
 * This allows backward compatibility during migration
 */
export async function resolveBranch(codeOrId: string) {
    // Check if it looks like a UUID
    const isUUID = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i.test(codeOrId)

    if (isUUID) {
        return await getBranchById(codeOrId)
    } else {
        return await getBranchByCode(codeOrId)
    }
}
