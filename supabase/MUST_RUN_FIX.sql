-- =============================================
-- CRITICAL FIX: RUN THIS IN SUPABASE SQL EDITOR
-- =============================================
-- This fixes the login flow by allowing users to
-- read their own profile and branch assignments
-- =============================================

-- STEP 1: Drop existing problematic policies (ignore errors if they don't exist)
DROP POLICY IF EXISTS "users_can_read_own_profile" ON profiles;
DROP POLICY IF EXISTS "super_admin_read_all_profiles" ON profiles;
DROP POLICY IF EXISTS "users_can_read_own_assignments" ON user_branch_assignments;
DROP POLICY IF EXISTS "super_admin_read_all_assignments" ON user_branch_assignments;

-- STEP 2: Enable RLS on required tables
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_branch_assignments ENABLE ROW LEVEL SECURITY;
ALTER TABLE branches ENABLE ROW LEVEL SECURITY;

-- STEP 3: Create profile policies
-- Allow ALL authenticated users to read their OWN profile
CREATE POLICY "allow_users_read_own_profile" ON profiles
FOR SELECT USING (auth.uid() = id);

-- Allow users to read all profiles (needed for lookups)
CREATE POLICY "allow_authenticated_read_profiles" ON profiles
FOR SELECT USING (auth.uid() IS NOT NULL);

-- STEP 4: Create user_branch_assignments policies
-- Allow users to read their own branch assignments
CREATE POLICY "allow_users_read_own_assignments" ON user_branch_assignments
FOR SELECT USING (auth.uid() = user_id);

-- Allow users to read all assignments (for admin views)
CREATE POLICY "allow_authenticated_read_assignments" ON user_branch_assignments
FOR SELECT USING (auth.uid() IS NOT NULL);

-- STEP 5: Fix branches policy - allow all authenticated users to read branches
DROP POLICY IF EXISTS "branches_select_policy" ON branches;
CREATE POLICY "allow_authenticated_read_branches" ON branches
FOR SELECT USING (auth.uid() IS NOT NULL);

-- STEP 6: Verify the admin user exists and has correct role
-- Check current state
SELECT 
    u.id,
    u.email,
    p.full_name,
    p.role,
    p.is_active
FROM auth.users u
LEFT JOIN profiles p ON p.id = u.id
WHERE u.email = 'admin@mortuary.com';

-- Ensure the admin has super_admin role
UPDATE profiles 
SET role = 'super_admin', is_active = true
WHERE id = (SELECT id FROM auth.users WHERE email = 'admin@mortuary.com');

-- STEP 7: Verify branches exist
SELECT * FROM branches;

-- STEP 8: Verify admin is assigned to branches
SELECT 
    uba.user_id,
    u.email,
    b.name as branch_name,
    uba.is_primary
FROM user_branch_assignments uba
JOIN auth.users u ON u.id = uba.user_id
JOIN branches b ON b.id = uba.branch_id
WHERE u.email = 'admin@mortuary.com';

-- =============================================
-- DONE! Now try logging in again.
-- =============================================
