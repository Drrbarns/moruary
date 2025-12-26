-- Create table for tracking bank deposits and withdrawals
CREATE TABLE bank_transactions (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  branch_id UUID REFERENCES branches(id) ON DELETE CASCADE,
  type TEXT CHECK (type IN ('DEPOSIT', 'WITHDRAWAL')),
  amount DECIMAL(10,2) NOT NULL,
  description TEXT,
  performed_by UUID REFERENCES profiles(id),
  transaction_date TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now())
);

-- Enable RLS
ALTER TABLE bank_transactions ENABLE ROW LEVEL SECURITY;

-- Policies
CREATE POLICY "bank_tx_select_policy" ON bank_transactions
FOR SELECT USING (auth_user_has_branch(branch_id));

CREATE POLICY "bank_tx_insert_policy" ON bank_transactions
FOR INSERT WITH CHECK (auth_user_has_branch(branch_id));

-- Grant access
GRANT ALL ON bank_transactions TO authenticated;
GRANT ALL ON bank_transactions TO service_role;
