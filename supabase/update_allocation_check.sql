-- Update the check constraint for payments allocation to include 'REGISTRATION'
ALTER TABLE payments DROP CONSTRAINT IF EXISTS payments_allocation_check;
ALTER TABLE payments ADD CONSTRAINT payments_allocation_check 
CHECK (allocation IN ('EMBALMING', 'COLDROOM', 'GENERAL', 'REGISTRATION'));
