-- Add registration_fee column to deceased_cases
ALTER TABLE deceased_cases 
ADD COLUMN registration_fee DECIMAL(10,2) DEFAULT 0;

-- Update existing rows if necessary (defaults to 0 anyway)
