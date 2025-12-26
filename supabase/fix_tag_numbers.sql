
-- Fix inconsistent Tag Numbers (e.g., '1' -> '001')
-- This assumes standard 3-digit format is desired.

UPDATE deceased_cases
SET tag_no = LPAD(tag_no, 3, '0')
WHERE length(tag_no) < 3;
