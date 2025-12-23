ALTER TABLE employee_profiles 
ADD COLUMN IF NOT EXISTS salary_structure_id UUID REFERENCES salary_structures(id);
