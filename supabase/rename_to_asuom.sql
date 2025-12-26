-- =============================================
-- RENAME BRANCHES TO MATCH ACTUAL LOCATIONS
-- =============================================
-- Run this in Supabase SQL Editor to update the existing branches
-- =============================================

-- Update Accra Main Branch to Asuom Branch
UPDATE branches 
SET 
    name = 'Asuom Branch',
    code = 'ASU',
    address = 'Near Community Center, Asuom'
WHERE name = 'Accra Main Branch';

-- Update Kumasi Branch to Asanteman Branch
UPDATE branches 
SET 
    name = 'Asanteman Branch',
    code = 'ASA',
    address = 'Main Road, Asanteman'
WHERE name = 'Kumasi Branch';

-- Verify the changes
SELECT id, name, code, address FROM branches ORDER BY name;

-- =============================================
-- NOTES:
-- =============================================
-- After running this:
-- - Asuom Branch will be accessible at /dashboard/ASU (was /dashboard/ACC)
-- - Asanteman Branch will be accessible at /dashboard/ASA (was /dashboard/KUM)
-- - Existing receipts/tags with old prefixes will remain unchanged (historical)
-- - New receipts/tags will use the new prefixes
-- =============================================
