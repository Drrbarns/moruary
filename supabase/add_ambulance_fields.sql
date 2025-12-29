-- Add ambulance information columns to deceased_cases table
ALTER TABLE public.deceased_cases
ADD COLUMN IF NOT EXISTS ambulance_number TEXT,
ADD COLUMN IF NOT EXISTS ambulance_driver_name TEXT,
ADD COLUMN IF NOT EXISTS ambulance_cost DECIMAL(10,2) DEFAULT 0;

-- Add comment for documentation
COMMENT ON COLUMN public.deceased_cases.ambulance_number IS 'Ambulance registration/number used for discharge';
COMMENT ON COLUMN public.deceased_cases.ambulance_driver_name IS 'Name of the ambulance driver';
COMMENT ON COLUMN public.deceased_cases.ambulance_cost IS 'Cost of ambulance service (optional, tracked separately from revenue)';
