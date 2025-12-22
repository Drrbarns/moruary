-- =============================================
-- UPDATE BRANCH CODES
-- =============================================
-- This script allows you to safely change the 3-letter branch codes
-- without breaking any existing data or relationships.
--
-- The branch codes are used in:
-- - Receipt numbers (e.g., ACC-PMT-0001)
-- - Tag numbers (e.g., ACC-2024-001)
-- - Display purposes
--
-- INSTRUCTIONS:
-- 1. Replace the NEW codes below with your desired 3-letter identifiers
-- 2. Run this script in Supabase SQL Editor
-- 3. Verify the changes in the branches table
-- =============================================

-- Update Accra Main Branch code
UPDATE branches 
SET code = 'ACC'  -- Change 'ACC' to your desired 3-letter code
WHERE id = '11111111-1111-1111-1111-111111111111';

-- Update Kumasi Branch code
UPDATE branches 
SET code = 'KUM'  -- Change 'KUM' to your desired 3-letter code
WHERE id = '22222222-2222-2222-2222-222222222222';

-- Update Takoradi Branch code
UPDATE branches 
SET code = 'TAK'  -- Change 'TAK' to your desired 3-letter code
WHERE id = '33333333-3333-3333-3333-333333333333';

-- Verify the changes
SELECT id, name, code, address FROM branches ORDER BY name;

-- =============================================
-- NOTES:
-- =============================================
-- - Branch codes should be UNIQUE and exactly 3 letters
-- - Codes are typically uppercase (e.g., ACC, KUM, TAK)
-- - Changing codes will affect NEW receipts/tags going forward
-- - Existing receipts/tags will keep their old codes (this is normal)
-- - The UUID IDs remain unchanged, so all relationships are preserved
-- =============================================
