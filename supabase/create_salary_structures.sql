-- Create salary_structures table
CREATE TABLE IF NOT EXISTS salary_structures (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    branch_id UUID NOT NULL REFERENCES branches(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    base_salary DECIMAL(10,2) NOT NULL DEFAULT 0,
    transport_allowance DECIMAL(10,2) DEFAULT 0,
    housing_allowance DECIMAL(10,2) DEFAULT 0,
    meal_allowance DECIMAL(10,2) DEFAULT 0,
    utility_allowance DECIMAL(10,2) DEFAULT 0,
    
    -- Settings
    apply_ssnit BOOLEAN DEFAULT true,
    apply_paye BOOLEAN DEFAULT true,
    
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- RLS
ALTER TABLE salary_structures ENABLE ROW LEVEL SECURITY;

CREATE POLICY "salary_structures_select" ON salary_structures
    FOR SELECT USING (auth_user_has_branch(branch_id));

CREATE POLICY "salary_structures_insert" ON salary_structures
    FOR INSERT WITH CHECK (auth_user_has_branch(branch_id));

CREATE POLICY "salary_structures_update" ON salary_structures
    FOR UPDATE USING (auth_user_has_branch(branch_id));

CREATE POLICY "salary_structures_delete" ON salary_structures
    FOR DELETE USING (auth_user_has_branch(branch_id));
