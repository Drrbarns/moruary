-- =============================================
-- ADD ASUOM BRANCH STAFF
-- =============================================
-- Run this in Supabase SQL Editor to add staff to Asuom Branch
-- =============================================

-- Note: You'll need to manually create auth users in Supabase Dashboard
-- or have staff sign up themselves. Below are the profile entries.

-- Get the Asuom Branch ID (will be used in assignments)
-- Asuom Branch ID: Should be '11111111-1111-1111-1111-111111111111' after migration

-- =============================================
-- 1. Gideon Adamali Kpodonu - Administrator/Secretary/IT Specialist
-- =============================================
-- Auth User (run this first in Supabase Dashboard > Authentication > Add User)
-- Email: gideon.kpodonu@asuom.mortuary.com
-- Temp Password: Asuom@2024 (user should change on first login)

INSERT INTO profiles (id, full_name, phone, role, is_active)
VALUES (
  'e1111111-1111-1111-1111-111111111111',  -- Replace with actual UUID from auth.users
  'Gideon Adamali Kpodonu',
  '0200000001',  -- Replace with actual phone
  'branch_admin',
  true
) ON CONFLICT (id) DO NOTHING;

INSERT INTO employee_profiles (id, employee_id, department, position, employment_type, date_hired, employment_status)
VALUES (
  'e1111111-1111-1111-1111-111111111111',
  'ASU-001',
  'Administration',
  'Administrator/Secretary/IT Specialist',
  'full_time',
  '2024-01-01',  -- Replace with actual hire date
  'active'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO user_branch_assignments (user_id, branch_id, is_primary)
VALUES (
  'e1111111-1111-1111-1111-111111111111',
  '11111111-1111-1111-1111-111111111111',  -- Asuom Branch
  true
) ON CONFLICT (user_id, branch_id) DO NOTHING;

-- =============================================
-- 2. Adolph Ndo Mensah - Senior Mortuary Attendant
-- =============================================
-- Email: adolph.mensah@asuom.mortuary.com
-- Temp Password: Asuom@2024

INSERT INTO profiles (id, full_name, phone, role, is_active)
VALUES (
  'e2222222-2222-2222-2222-222222222222',
  'Adolph Ndo Mensah',
  '0200000002',
  'staff',
  true
) ON CONFLICT (id) DO NOTHING;

INSERT INTO employee_profiles (id, employee_id, department, position, employment_type, date_hired, employment_status)
VALUES (
  'e2222222-2222-2222-2222-222222222222',
  'ASU-002',
  'Mortuary Services',
  'Senior Mortuary Attendant',
  'full_time',
  '2024-01-01',
  'active'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO user_branch_assignments (user_id, branch_id, is_primary)
VALUES (
  'e2222222-2222-2222-2222-222222222222',
  '11111111-1111-1111-1111-111111111111',
  true
) ON CONFLICT (user_id, branch_id) DO NOTHING;

-- =============================================
-- 3. Edward Boadi - Assistant Mortuary Attendant
-- =============================================
-- Email: edward.boadi@asuom.mortuary.com
-- Temp Password: Asuom@2024

INSERT INTO profiles (id, full_name, phone, role, is_active)
VALUES (
  'e3333333-3333-3333-3333-333333333333',
  'Edward Boadi',
  '0200000003',
  'staff',
  true
) ON CONFLICT (id) DO NOTHING;

INSERT INTO employee_profiles (id, employee_id, department, position, employment_type, date_hired, employment_status)
VALUES (
  'e3333333-3333-3333-3333-333333333333',
  'ASU-003',
  'Mortuary Services',
  'Assistant Mortuary Attendant',
  'full_time',
  '2024-01-01',
  'active'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO user_branch_assignments (user_id, branch_id, is_primary)
VALUES (
  'e3333333-3333-3333-3333-333333333333',
  '11111111-1111-1111-1111-111111111111',
  true
) ON CONFLICT (user_id, branch_id) DO NOTHING;

-- =============================================
-- 4. Anthony Amoabeng - Assistant Mortuary Attendant
-- =============================================
-- Email: anthony.amoabeng@asuom.mortuary.com
-- Temp Password: Asuom@2024

INSERT INTO profiles (id, full_name, phone, role, is_active)
VALUES (
  'e4444444-4444-4444-4444-444444444444',
  'Anthony Amoabeng',
  '0200000004',
  'staff',
  true
) ON CONFLICT (id) DO NOTHING;

INSERT INTO employee_profiles (id, employee_id, department, position, employment_type, date_hired, employment_status)
VALUES (
  'e4444444-4444-4444-4444-444444444444',
  'ASU-004',
  'Mortuary Services',
  'Assistant Mortuary Attendant',
  'full_time',
  '2024-01-01',
  'active'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO user_branch_assignments (user_id, branch_id, is_primary)
VALUES (
  'e4444444-4444-4444-4444-444444444444',
  '11111111-1111-1111-1111-111111111111',
  true
) ON CONFLICT (user_id, branch_id) DO NOTHING;

-- =============================================
-- 5. Edward Fosu Boateng - Gardener/Security
-- =============================================
-- Email: edward.boateng@asuom.mortuary.com
-- Temp Password: Asuom@2024

INSERT INTO profiles (id, full_name, phone, role, is_active)
VALUES (
  'e5555555-5555-5555-5555-555555555555',
  'Edward Fosu Boateng',
  '0200000005',
  'staff',
  true
) ON CONFLICT (id) DO NOTHING;

INSERT INTO employee_profiles (id, employee_id, department, position, employment_type, date_hired, employment_status)
VALUES (
  'e5555555-5555-5555-5555-555555555555',
  'ASU-005',
  'Maintenance & Security',
  'Gardener/Security',
  'full_time',
  '2024-01-01',
  'active'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO user_branch_assignments (user_id, branch_id, is_primary)
VALUES (
  'e5555555-5555-5555-5555-555555555555',
  '11111111-1111-1111-1111-111111111111',
  true
) ON CONFLICT (user_id, branch_id) DO NOTHING;

-- =============================================
-- Verify the additions
-- =============================================
SELECT 
  p.full_name,
  p.role,
  ep.position,
  ep.department,
  b.name as branch
FROM profiles p
LEFT JOIN employee_profiles ep ON p.id = ep.id
LEFT JOIN user_branch_assignments uba ON p.id = uba.user_id
LEFT JOIN branches b ON uba.branch_id = b.id
WHERE b.name = 'Asuom Branch'
ORDER BY p.full_name;

-- =============================================
-- IMPORTANT NEXT STEPS:
-- =============================================
-- You need to create actual auth users in Supabase Dashboard:
-- 
-- 1. Go to Supabase Dashboard > Authentication > Users
-- 2. Click "Add User" for each staff member
-- 3. Use the suggested emails and UUIDs above
-- 4. OR: Share signup link with staff to create their own accounts
-- 
-- SUGGESTED CREDENTIALS:
-- - Gideon Adamali Kpodonu: gideon.kpodonu@asuom.mortuary.com
-- - Adolph Ndo Mensah: adolph.mensah@asuom.mortuary.com
-- - Edward Boadi: edward.boadi@asuom.mortuary.com
-- - Anthony Amoabeng: anthony.amoabeng@asuom.mortuary.com
-- - Edward Fosu Boateng: edward.boateng@asuom.mortuary.com
-- 
-- Default Password: Asuom@2024 (users should change on first login)
-- 
-- REMEMBER TO UPDATE:
-- - Replace placeholder UUIDs with actual auth.users IDs
-- - Update phone numbers with actual contacts
-- - Update hire dates with accurate information
-- =============================================
