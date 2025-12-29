-- Create expenses table for tracking business expenses
CREATE TABLE IF NOT EXISTS public.expenses (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    branch_id UUID NOT NULL REFERENCES public.branches(id) ON DELETE CASCADE,
    category TEXT NOT NULL CHECK (category IN ('UTILITIES', 'SUPPLIES', 'MAINTENANCE', 'SALARY', 'TRANSPORT', 'FUEL', 'OTHER')),
    description TEXT NOT NULL,
    amount DECIMAL(10,2) NOT NULL CHECK (amount > 0),
    expense_date DATE NOT NULL DEFAULT CURRENT_DATE,
    recorded_by UUID REFERENCES public.profiles(id),
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Add RLS policies
ALTER TABLE public.expenses ENABLE ROW LEVEL SECURITY;

-- Policy: Users can view expenses for their branch
CREATE POLICY "Users can view branch expenses"
    ON public.expenses FOR SELECT
    USING (
        branch_id IN (
            SELECT branch_id FROM public.profiles WHERE id = auth.uid()
        )
        OR EXISTS (
            SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = 'super_admin'
        )
    );

-- Policy: Branch admins and super admins can insert expenses
CREATE POLICY "Admins can insert expenses"
    ON public.expenses FOR INSERT
    WITH CHECK (
        EXISTS (
            SELECT 1 FROM public.profiles 
            WHERE id = auth.uid() 
            AND role IN ('super_admin', 'branch_admin')
        )
    );

-- Policy: Branch admins and super admins can update expenses
CREATE POLICY "Admins can update expenses"
    ON public.expenses FOR UPDATE
    USING (
        EXISTS (
            SELECT 1 FROM public.profiles 
            WHERE id = auth.uid() 
            AND role IN ('super_admin', 'branch_admin')
        )
    );

-- Policy: Super admins can delete expenses
CREATE POLICY "Super admins can delete expenses"
    ON public.expenses FOR DELETE
    USING (
        EXISTS (
            SELECT 1 FROM public.profiles 
            WHERE id = auth.uid() 
            AND role = 'super_admin'
        )
    );

-- Create index for faster queries
CREATE INDEX idx_expenses_branch_id ON public.expenses(branch_id);
CREATE INDEX idx_expenses_expense_date ON public.expenses(expense_date);
CREATE INDEX idx_expenses_category ON public.expenses(category);
