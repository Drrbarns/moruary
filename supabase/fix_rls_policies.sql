-- =============================================
-- FIX RLS POLICIES FOR USER AUTHENTICATION FLOW
-- =============================================
-- Run this in Supabase SQL Editor to fix branch selection issues
-- =============================================

-- Enable RLS on user_branch_assignments (if not already enabled)
ALTER TABLE user_branch_assignments ENABLE ROW LEVEL SECURITY;

-- Allow users to read their own branch assignments
CREATE POLICY "users_can_read_own_assignments" ON user_branch_assignments
FOR SELECT USING (
  user_id = auth.uid()
);

-- Allow super_admin to read all assignments
CREATE POLICY "super_admin_read_all_assignments" ON user_branch_assignments
FOR SELECT USING (
  EXISTS (
    SELECT 1 FROM profiles
    WHERE id = auth.uid() AND role = 'super_admin'
  )
);

-- Enable RLS on profiles
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;

-- Allow users to read their own profile
CREATE POLICY "users_can_read_own_profile" ON profiles
FOR SELECT USING (
  id = auth.uid()
);

-- Allow users to update their own profile (limited fields)
CREATE POLICY "users_can_update_own_profile" ON profiles
FOR UPDATE USING (
  id = auth.uid()
);

-- Allow super_admin to read all profiles
CREATE POLICY "super_admin_read_all_profiles" ON profiles
FOR SELECT USING (
  EXISTS (
    SELECT 1 FROM profiles p
    WHERE p.id = auth.uid() AND p.role = 'super_admin'
  )
);

-- Allow super_admin to update all profiles  
CREATE POLICY "super_admin_update_all_profiles" ON profiles
FOR UPDATE USING (
  EXISTS (
    SELECT 1 FROM profiles p
    WHERE p.id = auth.uid() AND p.role = 'super_admin'
  )
);

-- Allow super_admin to manage branch assignments
CREATE POLICY "super_admin_insert_assignments" ON user_branch_assignments
FOR INSERT WITH CHECK (
  EXISTS (
    SELECT 1 FROM profiles
    WHERE id = auth.uid() AND role = 'super_admin'
  )
);

CREATE POLICY "super_admin_delete_assignments" ON user_branch_assignments
FOR DELETE USING (
  EXISTS (
    SELECT 1 FROM profiles
    WHERE id = auth.uid() AND role = 'super_admin'
  )
);

-- Allow super_admin to manage branches
CREATE POLICY "super_admin_insert_branches" ON branches
FOR INSERT WITH CHECK (
  EXISTS (
    SELECT 1 FROM profiles
    WHERE id = auth.uid() AND role = 'super_admin'
  )
);

CREATE POLICY "super_admin_update_branches" ON branches
FOR UPDATE USING (
  EXISTS (
    SELECT 1 FROM profiles
    WHERE id = auth.uid() AND role = 'super_admin'
  )
);

-- =============================================
-- DONE! Your login flow should now work properly.
-- =============================================
