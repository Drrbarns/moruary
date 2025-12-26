-- Migration to remove Embalming Fees from the system

BEGIN;

-- 1. Adjust 'total_paid' on cases to account for the payments we are about to delete
--    We subtract the sum of all 'EMBALMING' payments from the case's total_paid
UPDATE deceased_cases c
SET total_paid = c.total_paid - (
    SELECT COALESCE(SUM(amount), 0)
    FROM payments p
    WHERE p.case_id = c.id AND p.allocation = 'EMBALMING'
)
WHERE EXISTS (
    SELECT 1 FROM payments p
    WHERE p.case_id = c.id AND p.allocation = 'EMBALMING'
);

-- 2. Delete all payments allocated to 'EMBALMING'
DELETE FROM payments WHERE allocation = 'EMBALMING';

-- 3. Remove the embalming fee from the cases
--    - Subtract embalming_fee from total_bill
--    - Set embalming_fee to 0
--    - Recalculate balance (total_bill - total_paid)
UPDATE deceased_cases
SET 
    total_bill = total_bill - embalming_fee,
    balance = (total_bill - embalming_fee) - total_paid,
    embalming_fee = 0;

COMMIT;
