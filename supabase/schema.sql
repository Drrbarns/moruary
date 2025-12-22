-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Branches
CREATE TABLE branches (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  code TEXT UNIQUE NOT NULL,  -- e.g., "ACC", "KUM"
  address TEXT,
  phone TEXT,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now())
);

-- User Profiles (extends auth.users)
CREATE TABLE profiles (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  full_name TEXT,
  phone TEXT,
  role TEXT CHECK (role IN ('super_admin', 'branch_admin', 'staff')),
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now())
);

-- Branch Assignments (Many-to-Many)
CREATE TABLE user_branch_assignments (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  branch_id UUID REFERENCES branches(id) ON DELETE CASCADE,
  is_primary BOOLEAN DEFAULT false,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()),
  UNIQUE(user_id, branch_id)
);

-- Extended Employee Data
CREATE TABLE employee_profiles (
  id UUID PRIMARY KEY REFERENCES profiles(id) ON DELETE CASCADE,
  employee_id TEXT UNIQUE,
  department TEXT,
  position TEXT,
  employment_type TEXT CHECK (employment_type IN ('full_time', 'part_time', 'contract')),
  date_hired DATE,
  employment_status TEXT,
  base_salary DECIMAL(10,2)
);

-- Deceased Cases
CREATE TABLE deceased_cases (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  branch_id UUID REFERENCES branches(id),
  tag_no TEXT,  -- Branch-specific tag
  name_of_deceased TEXT NOT NULL,
  age INTEGER,
  gender TEXT CHECK (gender IN ('Male', 'Female', 'Other/Unknown')),
  place TEXT,  -- Town/Location
  admission_date DATE,
  admission_time TIME,
  type TEXT CHECK (type IN ('Normal', 'VIP')),
  status TEXT CHECK (status IN ('IN_CUSTODY', 'DISCHARGED', 'CANCELLED', 'ARCHIVED')) DEFAULT 'IN_CUSTODY',
  discharge_date DATE,
  storage_days INTEGER DEFAULT 0,
  
  -- Relative/Next of Kin
  relative_name TEXT,
  relative_contact TEXT,
  relative_contact_secondary TEXT,
  
  -- Financial
  embalming_fee DECIMAL(10,2) DEFAULT 0,
  coldroom_fee DECIMAL(10,2) DEFAULT 0,
  storage_fee DECIMAL(10,2) DEFAULT 0,
  total_bill DECIMAL(10,2) DEFAULT 0,
  total_paid DECIMAL(10,2) DEFAULT 0,
  balance DECIMAL(10,2) DEFAULT 0,
  
  -- Receipt Tracking
  embalming_receipt_no TEXT,
  coldroom_receipt_no TEXT,
  discharge_receipt_no TEXT,
  
  notes TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()),
  created_by UUID REFERENCES profiles(id),
  updated_by UUID REFERENCES profiles(id),
  UNIQUE(branch_id, tag_no)
);

-- Additional Case Charges
CREATE TABLE case_charges (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  case_id UUID REFERENCES deceased_cases(id) ON DELETE CASCADE,
  description TEXT,
  amount DECIMAL(10,2) DEFAULT 0,
  applied_on DATE DEFAULT CURRENT_DATE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now())
);

-- Payments
CREATE TABLE payments (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  branch_id UUID REFERENCES branches(id),
  case_id UUID REFERENCES deceased_cases(id) ON DELETE SET NULL,
  amount DECIMAL(10,2) NOT NULL,
  method TEXT CHECK (method IN ('CASH', 'MOMO', 'BANK', 'CARD')),
  allocation TEXT CHECK (allocation IN ('EMBALMING', 'COLDROOM', 'GENERAL')),
  receipt_no TEXT,
  paid_on TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()),
  received_by UUID REFERENCES profiles(id),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now())
);

-- Receipt Number Sequences
CREATE TABLE receipt_sequences (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  branch_id UUID REFERENCES branches(id) ON DELETE CASCADE,
  receipt_type TEXT,  -- 'ADM', 'PMT', 'DISCHARGE'
  next_number INTEGER DEFAULT 1,
  UNIQUE(branch_id, receipt_type)
);

-- Audit Logs
CREATE TABLE audit_logs (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  branch_id UUID REFERENCES branches(id),
  actor_id UUID REFERENCES profiles(id),
  action TEXT,
  entity_type TEXT,
  entity_id UUID,
  metadata JSONB,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now())
);

-- FUNCTIONS & TRIGGERS

-- Generate Sequential Receipt Numbers
CREATE OR REPLACE FUNCTION generate_receipt_number(
  branch_id_param UUID,
  receipt_type_param TEXT
) RETURNS TEXT AS $$
DECLARE
  next_num INTEGER;
  branch_code TEXT;
  receipt TEXT;
BEGIN
  -- Get branch code
  SELECT code INTO branch_code FROM branches WHERE id = branch_id_param;
  
  -- Get and increment next number
  INSERT INTO receipt_sequences (branch_id, receipt_type, next_number)
  VALUES (branch_id_param, receipt_type_param, 2)
  ON CONFLICT (branch_id, receipt_type)
  DO UPDATE SET next_number = receipt_sequences.next_number + 1
  RETURNING next_number - 1 INTO next_num; -- Return the number used (which was prev value)
  
  -- Actually, the prompt logic: INSERT... DEFAULT 1. DO UPDATE... RETURNING next_number.
  -- Let's stick to prompt logic but ensure we return the CURRENT number to use.
  
  -- Refined logic:
  -- We want the number we are about to use.
  -- If it doesn't exist, start at 1. Next time will be 2.
  -- If exists, increment and return new value?
  -- Prompt says: "INSERT ... VALUES(..., 1) ... DO UPDATE SET next_number + 1 RETURNING next_number"
  -- This implies the returned value is the NEW number.
  -- So if it's the first time, we insert 1. 
  -- But usually we want to start with 1, then 2.
  -- If we return after update, we get 2 on second call.
  -- Let's assume the table stores the NEXT available number.
  
  -- My implementation: Table stores the LAST USED number or NEXT number?
  -- Prompt: "Receipt Number Sequences... next_number DEFAULT 1"
  -- Function Logic:
  --   INSERT ... VALUES (..., 1) ... CONFLICT ... UPDATE SET next = next + 1 RETURNING next_number
  --   This means the function returns the NEW value.
  --   If 1st time: insert 1, return 1? No, conflict not triggered?
  --   Wait, if insert succeeds, it returns what was inserted? We need to capture that.
  
  -- Let's fix the function to be robust:
  INSERT INTO receipt_sequences (branch_id, receipt_type, next_number)
  VALUES (branch_id_param, receipt_type_param, 1)
  ON CONFLICT (branch_id, receipt_type)
  DO UPDATE SET next_number = receipt_sequences.next_number + 1
  RETURNING next_number INTO next_num;
  
  receipt := branch_code || '-' || receipt_type_param || '-' || LPAD(next_num::TEXT, 4, '0');
  RETURN receipt;
END;
$$ LANGUAGE plpgsql;

-- Check User Has Branch Access
CREATE OR REPLACE FUNCTION auth_user_has_branch(branch_id_param UUID) RETURNS BOOLEAN AS $$
BEGIN
  RETURN EXISTS (
    SELECT 1 FROM profiles
    WHERE id = auth.uid()
    AND (
      role = 'super_admin'
      OR EXISTS (
        SELECT 1 FROM user_branch_assignments
        WHERE user_id = auth.uid()
        AND branch_id = branch_id_param
      )
    )
  );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- RLS POLICIES
ALTER TABLE deceased_cases ENABLE ROW LEVEL SECURITY;
ALTER TABLE payments ENABLE ROW LEVEL SECURITY;
ALTER TABLE audit_logs ENABLE ROW LEVEL SECURITY;
ALTER TABLE branches ENABLE ROW LEVEL SECURITY; -- Generally readable but maybe restricted
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;

-- Deceased Cases Policy
CREATE POLICY "cases_select_policy" ON deceased_cases
FOR SELECT USING (
  auth_user_has_branch(branch_id)
);

CREATE POLICY "cases_insert_policy" ON deceased_cases
FOR INSERT WITH CHECK (
  auth_user_has_branch(branch_id)
);

CREATE POLICY "cases_update_policy" ON deceased_cases
FOR UPDATE USING (
  auth_user_has_branch(branch_id)
);

-- Payments Policy
CREATE POLICY "payments_select_policy" ON payments
FOR SELECT USING (
  auth_user_has_branch(branch_id)
);

CREATE POLICY "payments_insert_policy" ON payments
FOR INSERT WITH CHECK (
  auth_user_has_branch(branch_id)
);

-- Audit Logs Policy
CREATE POLICY "audit_select_policy" ON audit_logs
FOR SELECT USING (
  EXISTS (
    SELECT 1 FROM profiles
    WHERE id = auth.uid()
    AND (role = 'super_admin' OR auth_user_has_branch(branch_id))
  )
);

CREATE POLICY "audit_insert_policy" ON audit_logs
FOR INSERT WITH CHECK (true); -- Allow system to write logs, or restrict to auth user

-- Branch Policy (Read access for authenticated users to see accessible branches)
CREATE POLICY "branches_select_policy" ON branches
FOR SELECT USING (
  EXISTS (
    SELECT 1 FROM profiles
    WHERE id = auth.uid()
    AND (
      role = 'super_admin'
      OR EXISTS (
        SELECT 1 FROM user_branch_assignments
        WHERE user_id = auth.uid()
        AND branch_id = branches.id
      )
    )
  )
);

-- Handle user creation trigger
CREATE OR REPLACE FUNCTION public.handle_new_user() 
RETURNS trigger AS $$
BEGIN
  INSERT INTO public.profiles (id, full_name, role)
  VALUES (new.id, new.raw_user_meta_data->>'full_name', 'staff'); 
  -- Default to 'staff', admin can change later
  RETURN new;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Trigger to create profile on signup
CREATE OR REPLACE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE PROCEDURE public.handle_new_user();
