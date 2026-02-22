-- =============================================
-- STAFF CREDENTIALS + REMOVE TAKORADI + UPDATE LOCATIONS
-- =============================================
-- Run this in the Supabase SQL Editor for the LIVE project
-- =============================================

-- ==========================================
-- STEP 1: UPDATE BRANCH ADDRESSES
-- ==========================================
UPDATE branches SET address = 'Near Moffram Junction' WHERE code = 'ASA';
UPDATE branches SET address = 'Near Apam River' WHERE code = 'ASU';

-- ==========================================
-- STEP 2: REMOVE TAKORADI BRANCH
-- ==========================================
DELETE FROM receipt_sequences WHERE branch_id = (SELECT id FROM branches WHERE code = 'TAK');
DELETE FROM user_branch_assignments WHERE branch_id = (SELECT id FROM branches WHERE code = 'TAK');
DELETE FROM audit_logs WHERE branch_id = (SELECT id FROM branches WHERE code = 'TAK');
DELETE FROM payments WHERE branch_id = (SELECT id FROM branches WHERE code = 'TAK');
DELETE FROM deceased_cases WHERE branch_id = (SELECT id FROM branches WHERE code = 'TAK');
DELETE FROM branches WHERE code = 'TAK';

-- Also remove admin assignment to Takoradi (already handled above via branch delete cascade)

-- ==========================================
-- STEP 3: CREATE ASUOM STAFF USER
-- ==========================================
-- Email: asuom.staff@amprahmortuary.com
-- Password: AsuomStaff@2026

INSERT INTO auth.users (
  id,
  instance_id,
  email,
  encrypted_password,
  email_confirmed_at,
  created_at,
  updated_at,
  raw_app_meta_data,
  raw_user_meta_data,
  is_super_admin,
  role,
  aud,
  confirmation_token,
  recovery_token,
  email_change_token_new,
  email_change
) VALUES (
  'cccccccc-cccc-cccc-cccc-cccccccccccc',
  '00000000-0000-0000-0000-000000000000',
  'asuom.staff@amprahmortuary.com',
  crypt('AsuomStaff@2026', gen_salt('bf')),
  NOW(),
  NOW(),
  NOW(),
  '{"provider": "email", "providers": ["email"]}',
  '{"full_name": "Asuom Staff"}',
  false,
  'authenticated',
  'authenticated',
  '',
  '',
  '',
  ''
) ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, full_name, phone, role, is_active)
VALUES (
  'cccccccc-cccc-cccc-cccc-cccccccccccc',
  'Asuom Staff',
  '',
  'staff',
  true
)
ON CONFLICT (id) DO UPDATE SET
  role = 'staff',
  full_name = 'Asuom Staff';

INSERT INTO user_branch_assignments (user_id, branch_id, is_primary)
SELECT 'cccccccc-cccc-cccc-cccc-cccccccccccc', id, true
FROM branches WHERE code = 'ASU'
ON CONFLICT (user_id, branch_id) DO NOTHING;

-- ==========================================
-- STEP 4: CREATE ASANTEMAN STAFF USER
-- ==========================================
-- Email: asanteman.staff@amprahmortuary.com
-- Password: AsantemanStaff@2026

INSERT INTO auth.users (
  id,
  instance_id,
  email,
  encrypted_password,
  email_confirmed_at,
  created_at,
  updated_at,
  raw_app_meta_data,
  raw_user_meta_data,
  is_super_admin,
  role,
  aud,
  confirmation_token,
  recovery_token,
  email_change_token_new,
  email_change
) VALUES (
  'dddddddd-dddd-dddd-dddd-dddddddddddd',
  '00000000-0000-0000-0000-000000000000',
  'asanteman.staff@amprahmortuary.com',
  crypt('AsantemanStaff@2026', gen_salt('bf')),
  NOW(),
  NOW(),
  NOW(),
  '{"provider": "email", "providers": ["email"]}',
  '{"full_name": "Asanteman Staff"}',
  false,
  'authenticated',
  'authenticated',
  '',
  '',
  '',
  ''
) ON CONFLICT (id) DO NOTHING;

INSERT INTO profiles (id, full_name, phone, role, is_active)
VALUES (
  'dddddddd-dddd-dddd-dddd-dddddddddddd',
  'Asanteman Staff',
  '',
  'staff',
  true
)
ON CONFLICT (id) DO UPDATE SET
  role = 'staff',
  full_name = 'Asanteman Staff';

INSERT INTO user_branch_assignments (user_id, branch_id, is_primary)
SELECT 'dddddddd-dddd-dddd-dddd-dddddddddddd', id, true
FROM branches WHERE code = 'ASA'
ON CONFLICT (user_id, branch_id) DO NOTHING;

-- =============================================
-- DONE!
-- =============================================
--
-- STAFF CREDENTIALS:
--
-- ASUOM STAFF:
--   Email: asuom.staff@amprahmortuary.com
--   Password: AsuomStaff@2026
--   Branch: Asuom (auto-redirects on login)
--
-- ASANTEMAN STAFF:
--   Email: asanteman.staff@amprahmortuary.com
--   Password: AsantemanStaff@2026
--   Branch: Asanteman (auto-redirects on login)
--
-- =============================================
