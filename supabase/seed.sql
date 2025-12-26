-- =============================================
-- MORTUARY MANAGEMENT SYSTEM - SEED DATA
-- =============================================
-- Run this in Supabase SQL Editor after running schema.sql
-- 
-- DEFAULT LOGIN CREDENTIALS:
-- Email: admin@mortuary.com
-- Password: Admin@123
-- =============================================

-- Step 1: Create Default Branches
INSERT INTO branches (id, name, code, address, phone, is_active) VALUES
  ('11111111-1111-1111-1111-111111111111', 'Asuom Branch', 'ASU', 'Near Community Center, Asuom', '0302123456', true),
  ('22222222-2222-2222-2222-222222222222', 'Asanteman Branch', 'ASA', 'Main Road, Asanteman', '0322654321', true),
  ('33333333-3333-3333-3333-333333333333', 'Takoradi Branch', 'TAK', '78 Market Circle, Takoradi', '0312789012', true)
ON CONFLICT (code) DO NOTHING;

-- Step 2: Create Admin User via Supabase Auth
-- NOTE: This creates the user in auth.users table
-- The trigger will automatically create a profile entry
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
  'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
  '00000000-0000-0000-0000-000000000000',
  'admin@mortuary.com',
  crypt('Admin@123', gen_salt('bf')),
  NOW(),
  NOW(),
  NOW(),
  '{"provider": "email", "providers": ["email"]}',
  '{"full_name": "System Administrator"}',
  false,
  'authenticated',
  'authenticated',
  '',
  '',
  '',
  ''
) ON CONFLICT (id) DO NOTHING;

-- Step 3: Ensure profile exists and update to super_admin
-- (The trigger should create this, but we ensure it exists)
INSERT INTO profiles (id, full_name, phone, role, is_active)
VALUES (
  'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
  'System Administrator',
  '0200000000',
  'super_admin',
  true
)
ON CONFLICT (id) DO UPDATE SET
  role = 'super_admin',
  full_name = 'System Administrator';

-- Step 4: Assign admin to all branches (super_admin has access to all)
INSERT INTO user_branch_assignments (user_id, branch_id, is_primary) VALUES
  ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', true),
  ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', false),
  ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '33333333-3333-3333-3333-333333333333', false)
ON CONFLICT (user_id, branch_id) DO NOTHING;

-- Step 5: Create a sample staff user
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
  'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',
  '00000000-0000-0000-0000-000000000000',
  'staff@mortuary.com',
  crypt('Staff@123', gen_salt('bf')),
  NOW(),
  NOW(),
  NOW(),
  '{"provider": "email", "providers": ["email"]}',
  '{"full_name": "John Staff"}',
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
  'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',
  'John Staff',
  '0241234567',
  'staff',
  true
)
ON CONFLICT (id) DO UPDATE SET
  role = 'staff',
  full_name = 'John Staff';

-- Assign staff to Asuom branch only
INSERT INTO user_branch_assignments (user_id, branch_id, is_primary) VALUES
  ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '11111111-1111-1111-1111-111111111111', true)
ON CONFLICT (user_id, branch_id) DO NOTHING;

-- Step 6: Initialize receipt sequences for each branch
INSERT INTO receipt_sequences (branch_id, receipt_type, next_number) VALUES
  ('11111111-1111-1111-1111-111111111111', 'ADM', 1),
  ('11111111-1111-1111-1111-111111111111', 'PMT', 1),
  ('11111111-1111-1111-1111-111111111111', 'DISCHARGE', 1),
  ('22222222-2222-2222-2222-222222222222', 'ADM', 1),
  ('22222222-2222-2222-2222-222222222222', 'PMT', 1),
  ('22222222-2222-2222-2222-222222222222', 'DISCHARGE', 1),
  ('33333333-3333-3333-3333-333333333333', 'ADM', 1),
  ('33333333-3333-3333-3333-333333333333', 'PMT', 1),
  ('33333333-3333-3333-3333-333333333333', 'DISCHARGE', 1)
ON CONFLICT (branch_id, receipt_type) DO NOTHING;

-- =============================================
-- SEED DATA COMPLETE!
-- =============================================
-- 
-- You can now login with:
-- 
-- SUPER ADMIN:
--   Email: admin@mortuary.com
--   Password: Admin@123
-- 
-- STAFF USER:
--   Email: staff@mortuary.com
--   Password: Staff@123
-- 
-- =============================================
