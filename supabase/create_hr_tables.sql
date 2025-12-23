-- Attendance
CREATE TABLE IF NOT EXISTS attendance (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    branch_id UUID REFERENCES branches(id) ON DELETE CASCADE,
    employee_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
    date DATE NOT NULL DEFAULT CURRENT_DATE,
    clock_in TEXT,
    clock_out TEXT,
    hours_worked DECIMAL(4,2),
    status TEXT CHECK (status IN ('PRESENT', 'LATE', 'ABSENT', 'ON_LEAVE', 'HALF_DAY', 'HOLIDAY')),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(employee_id, date)
);

-- Payroll Runs
CREATE TABLE IF NOT EXISTS payroll_runs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    branch_id UUID REFERENCES branches(id) ON DELETE CASCADE,
    year INTEGER NOT NULL,
    month INTEGER NOT NULL,
    status TEXT CHECK (status IN ('DRAFT', 'APPROVED', 'PAID', 'CANCELLED')) DEFAULT 'DRAFT',
    total_gross DECIMAL(10,2) DEFAULT 0,
    total_deductions DECIMAL(10,2) DEFAULT 0,
    total_net DECIMAL(10,2) DEFAULT 0,
    employee_count INTEGER DEFAULT 0,
    processed_by UUID REFERENCES profiles(id),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(branch_id, year, month)
);

-- Payslips
CREATE TABLE IF NOT EXISTS payslips (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    run_id UUID REFERENCES payroll_runs(id) ON DELETE CASCADE,
    user_id UUID REFERENCES profiles(id),
    
    base_salary DECIMAL(10,2) DEFAULT 0,
    total_allowances DECIMAL(10,2) DEFAULT 0,
    gross_pay DECIMAL(10,2) DEFAULT 0,
    
    tax_deduction DECIMAL(10,2) DEFAULT 0,
    ssnit_deduction DECIMAL(10,2) DEFAULT 0,
    total_deductions DECIMAL(10,2) DEFAULT 0,
    
    net_pay DECIMAL(10,2) DEFAULT 0,
    
    allowance_details JSONB DEFAULT '{}'::jsonb,
    
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- RLS
ALTER TABLE attendance ENABLE ROW LEVEL SECURITY;
ALTER TABLE payroll_runs ENABLE ROW LEVEL SECURITY;
ALTER TABLE payslips ENABLE ROW LEVEL SECURITY;

CREATE POLICY "attendance_all" ON attendance FOR ALL USING (auth_user_has_branch(branch_id));
CREATE POLICY "payroll_all" ON payroll_runs FOR ALL USING (auth_user_has_branch(branch_id));
CREATE POLICY "payslips_all" ON payslips FOR ALL USING (
    EXISTS (SELECT 1 FROM payroll_runs WHERE id = payslips.run_id AND auth_user_has_branch(payroll_runs.branch_id))
    OR user_id = auth.uid()
);
