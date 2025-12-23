'use server'

import { createServiceRoleClient } from '@/utils/supabase/service'
import { revalidatePath } from 'next/cache'

export async function createEmployeeAction(formData: any, branchId: string) {
    try {
        const supabase = createServiceRoleClient()

        // 1. Create Auth User
        const tempPassword = 'ChangeMe@123'

        const { data: userData, error: userError } = await supabase.auth.admin.createUser({
            email: formData.email,
            password: tempPassword,
            email_confirm: true,
            user_metadata: { full_name: formData.full_name }
        })

        if (userError) {
            console.error('Auth Create Error:', userError)
            return { error: userError.message }
        }

        const userId = userData.user.id

        // 2. Upsert Profile
        const { error: profileError } = await supabase.from('profiles').upsert({
            id: userId,
            full_name: formData.full_name,
            phone: formData.phone,
            role: formData.role || 'staff',
            is_active: true,
            updated_at: new Date().toISOString()
        })

        if (profileError) {
            await supabase.auth.admin.deleteUser(userId)
            return { error: `Profile Creation Failed: ${profileError.message}` }
        }

        // 3. Assign to Branch
        const { error: branchError } = await supabase.from('user_branch_assignments').insert({
            user_id: userId,
            branch_id: branchId,
            is_primary: true
        })

        if (branchError) {
            return { error: `Branch Assignment Failed: ${branchError.message}` }
        }

        // 4. Create Employee Profile
        const { error: empError } = await supabase.from('employee_profiles').insert({
            id: userId,
            employee_id: formData.employee_id,
            department: formData.department,
            position: formData.position,
            employment_type: formData.employment_type,
            date_hired: formData.date_hired,
            base_salary: parseFloat(formData.base_salary) || 0,
            employment_status: 'Active'
        })

        if (empError) {
            return { error: `Employee Detail Failed: ${empError.message}` }
        }

        return { success: true }

    } catch (e: any) {
        return { error: e.message }
    }
}
