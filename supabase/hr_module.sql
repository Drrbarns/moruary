-- =============================================
-- HR MODULE ENHANCEMENT - ATTENDANCE & PAYROLL
-- =============================================
-- Run this in Supabase SQL Editor to add HR tables
-- =============================================

-- Attendance Records
CREATE TABLE IF NOT EXISTS attendance (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  branch_id UUID REFERENCES branches(id) ON DELETE CASCADE,
  employee_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  date DATE NOT NULL,
  clock_in TIME,
  clock_out TIME,
  status TEXT CHECK (status IN ('PRESENT', 'ABSENT', 'LATE', 'HALF_DAY', 'ON_LEAVE', 'HOLIDAY')) DEFAULT 'PRESENT',
  hours_worked DECIMAL(4,2),
  overtime_hours DECIMAL(4,2) DEFAULT 0,
  notes TEXT,
  marked_by UUID REFERENCES profiles(id),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()),
  UNIQUE(employee_id, date)
);

-- Leave Types
CREATE TABLE IF NOT EXISTS leave_types (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL UNIQUE,
  description TEXT,
  days_per_year INTEGER DEFAULT 0,
  is_paid BOOLEAN DEFAULT true,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now())
);

-- Leave Requests
CREATE TABLE IF NOT EXISTS leave_requests (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  branch_id UUID REFERENCES branches(id) ON DELETE CASCADE,
  employee_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  leave_type_id UUID REFERENCES leave_types(id),
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  days_requested INTEGER NOT NULL,
  reason TEXT,
  status TEXT CHECK (status IN ('PENDING', 'APPROVED', 'REJECTED', 'CANCELLED')) DEFAULT 'PENDING',
  approved_by UUID REFERENCES profiles(id),
  approved_at TIMESTAMP WITH TIME ZONE,
  rejection_reason TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now())
);

-- Salary Structure (extends employee_profiles)
CREATE TABLE IF NOT EXISTS salary_structures (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  employee_id UUID REFERENCES profiles(id) ON DELETE CASCADE UNIQUE,
  base_salary DECIMAL(12,2) NOT NULL DEFAULT 0,
  housing_allowance DECIMAL(10,2) DEFAULT 0,
  transport_allowance DECIMAL(10,2) DEFAULT 0,
  meal_allowance DECIMAL(10,2) DEFAULT 0,
  other_allowances DECIMAL(10,2) DEFAULT 0,
  tax_rate DECIMAL(5,2) DEFAULT 0,
  ssnit_rate DECIMAL(5,2) DEFAULT 5.5, -- Ghana SSNIT employee contribution
  other_deductions DECIMAL(10,2) DEFAULT 0,
  bank_name TEXT,
  bank_account_no TEXT,
  effective_date DATE DEFAULT CURRENT_DATE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now())
);

-- Payroll Runs (Monthly payroll batches)
CREATE TABLE IF NOT EXISTS payroll_runs (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  branch_id UUID REFERENCES branches(id) ON DELETE CASCADE,
  month INTEGER NOT NULL CHECK (month >= 1 AND month <= 12),
  year INTEGER NOT NULL,
  status TEXT CHECK (status IN ('DRAFT', 'PROCESSING', 'APPROVED', 'PAID', 'CANCELLED')) DEFAULT 'DRAFT',
  total_gross DECIMAL(14,2) DEFAULT 0,
  total_deductions DECIMAL(14,2) DEFAULT 0,
  total_net DECIMAL(14,2) DEFAULT 0,
  employee_count INTEGER DEFAULT 0,
  processed_by UUID REFERENCES profiles(id),
  approved_by UUID REFERENCES profiles(id),
  paid_on DATE,
  notes TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()),
  UNIQUE(branch_id, month, year)
);

-- Payroll Items (Individual salary entries per payroll run)
CREATE TABLE IF NOT EXISTS payroll_items (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  payroll_run_id UUID REFERENCES payroll_runs(id) ON DELETE CASCADE,
  employee_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  
  -- Earnings
  base_salary DECIMAL(12,2) DEFAULT 0,
  housing_allowance DECIMAL(10,2) DEFAULT 0,
  transport_allowance DECIMAL(10,2) DEFAULT 0,
  meal_allowance DECIMAL(10,2) DEFAULT 0,
  other_allowances DECIMAL(10,2) DEFAULT 0,
  overtime_pay DECIMAL(10,2) DEFAULT 0,
  bonus DECIMAL(10,2) DEFAULT 0,
  gross_salary DECIMAL(12,2) DEFAULT 0,
  
  -- Deductions
  tax_amount DECIMAL(10,2) DEFAULT 0,
  ssnit_amount DECIMAL(10,2) DEFAULT 0,
  loan_deduction DECIMAL(10,2) DEFAULT 0,
  other_deductions DECIMAL(10,2) DEFAULT 0,
  total_deductions DECIMAL(10,2) DEFAULT 0,
  
  -- Net
  net_salary DECIMAL(12,2) DEFAULT 0,
  
  -- Attendance-based
  days_worked INTEGER DEFAULT 0,
  days_absent INTEGER DEFAULT 0,
  overtime_hours DECIMAL(5,2) DEFAULT 0,
  
  status TEXT CHECK (status IN ('PENDING', 'PAID', 'CANCELLED')) DEFAULT 'PENDING',
  payment_reference TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()),
  
  UNIQUE(payroll_run_id, employee_id)
);

-- Deduction Types (for additional deductions like loans)
CREATE TABLE IF NOT EXISTS deduction_types (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  description TEXT,
  is_recurring BOOLEAN DEFAULT false,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now())
);

-- Employee Deductions (active deductions for employees)
CREATE TABLE IF NOT EXISTS employee_deductions (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  employee_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  deduction_type_id UUID REFERENCES deduction_types(id),
  amount DECIMAL(10,2) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE,
  total_amount DECIMAL(12,2), -- For loans: total loan amount
  amount_paid DECIMAL(12,2) DEFAULT 0, -- For loans: amount already deducted
  is_active BOOLEAN DEFAULT true,
  notes TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now())
);

-- Enable RLS
ALTER TABLE attendance ENABLE ROW LEVEL SECURITY;
ALTER TABLE leave_types ENABLE ROW LEVEL SECURITY;
ALTER TABLE leave_requests ENABLE ROW LEVEL SECURITY;
ALTER TABLE salary_structures ENABLE ROW LEVEL SECURITY;
ALTER TABLE payroll_runs ENABLE ROW LEVEL SECURITY;
ALTER TABLE payroll_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE deduction_types ENABLE ROW LEVEL SECURITY;
ALTER TABLE employee_deductions ENABLE ROW LEVEL SECURITY;

-- RLS Policies
CREATE POLICY "allow_authenticated_attendance" ON attendance
FOR ALL USING (auth.uid() IS NOT NULL);

CREATE POLICY "allow_authenticated_leave_types" ON leave_types
FOR ALL USING (auth.uid() IS NOT NULL);

CREATE POLICY "allow_authenticated_leave_requests" ON leave_requests
FOR ALL USING (auth.uid() IS NOT NULL);

CREATE POLICY "allow_authenticated_salary_structures" ON salary_structures
FOR ALL USING (auth.uid() IS NOT NULL);

CREATE POLICY "allow_authenticated_payroll_runs" ON payroll_runs
FOR ALL USING (auth.uid() IS NOT NULL);

CREATE POLICY "allow_authenticated_payroll_items" ON payroll_items
FOR ALL USING (auth.uid() IS NOT NULL);

CREATE POLICY "allow_authenticated_deduction_types" ON deduction_types
FOR ALL USING (auth.uid() IS NOT NULL);

CREATE POLICY "allow_authenticated_employee_deductions" ON employee_deductions
FOR ALL USING (auth.uid() IS NOT NULL);

-- Seed default leave types
INSERT INTO leave_types (name, description, days_per_year, is_paid) VALUES
  ('Annual Leave', 'Regular annual vacation leave', 21, true),
  ('Sick Leave', 'Medical sick leave', 10, true),
  ('Maternity Leave', 'Maternity leave for female employees', 90, true),
  ('Paternity Leave', 'Paternity leave for male employees', 5, true),
  ('Compassionate Leave', 'Leave for family emergencies', 5, true),
  ('Unpaid Leave', 'Leave without pay', 0, false)
ON CONFLICT (name) DO NOTHING;

-- Seed default deduction types
INSERT INTO deduction_types (name, description, is_recurring) VALUES
  ('Salary Advance', 'Advance payment to be deducted', true),
  ('Loan Repayment', 'Company loan repayment', true),
  ('Uniform Deduction', 'Cost of company uniform', false),
  ('Damage Deduction', 'Deduction for damages', false)
ON CONFLICT DO NOTHING;

-- =============================================
-- DONE! HR tables created successfully.
-- =============================================
