export type CaseStatus = 'IN_CUSTODY' | 'DISCHARGED' | 'CANCELLED' | 'ARCHIVED'
export type CaseType = 'Normal' | 'VIP'
export type Gender = 'Male' | 'Female' | 'Other/Unknown'
export type PaymentMethod = 'CASH' | 'MOMO' | 'BANK' | 'CARD'
export type PaymentAllocation = 'EMBALMING' | 'COLDROOM' | 'GENERAL' | 'REGISTRATION'

export interface Branch {
    id: string
    name: string
    code: string
    address?: string
    phone?: string
    is_active: boolean
    created_at: string
    updated_at: string
}

export interface Profile {
    id: string
    full_name?: string
    phone?: string
    role: 'super_admin' | 'branch_admin' | 'staff'
    is_active: boolean
    created_at: string
    updated_at: string
}

export interface DeceasedCase {
    id: string
    branch_id: string
    tag_no: string
    name_of_deceased: string
    age?: number
    gender?: Gender
    place?: string
    admission_date?: string
    admission_time?: string
    type?: CaseType
    status: CaseStatus
    discharge_date?: string
    storage_days: number
    relative_name?: string
    relative_contact?: string
    relative_contact_secondary?: string
    registration_fee: number
    embalming_fee: number
    coldroom_fee: number
    storage_fee: number
    total_bill: number
    total_paid: number
    balance: number
    embalming_receipt_no?: string
    coldroom_receipt_no?: string
    discharge_receipt_no?: string
    notes?: string
    created_at: string
    updated_at: string
    created_by?: string
    updated_by?: string
}

export interface CaseCharge {
    id: string
    case_id: string
    description: string
    amount: number
    applied_on: string
    created_at: string
}

export interface Payment {
    id: string
    branch_id: string
    case_id: string
    amount: number
    method: PaymentMethod
    allocation: PaymentAllocation
    receipt_no: string
    paid_on: string
    received_by?: string
    created_at: string
    // Joined data
    receiver?: Profile
    case?: DeceasedCase
}

export interface AuditLog {
    id: string
    branch_id?: string
    actor_id?: string
    action: string
    entity_type: string
    entity_id?: string
    metadata?: Record<string, any>
    created_at: string
    // Joined data
    actor?: Profile
}

export interface SalaryStructure {
    id: string
    branch_id: string
    name: string
    base_salary: number
    transport_allowance: number
    housing_allowance: number
    meal_allowance: number
    utility_allowance: number
    apply_ssnit: boolean
    apply_paye: boolean
    created_at: string
    updated_at: string
}

export interface BankTransaction {
    id: string
    branch_id: string
    type: 'DEPOSIT' | 'WITHDRAWAL'
    amount: number
    description: string
    performed_by: string
    transaction_date: string
    created_at: string
    // Joined data
    performer?: Profile
}

export type ExpenseCategory = 'UTILITIES' | 'SUPPLIES' | 'MAINTENANCE' | 'SALARY' | 'TRANSPORT' | 'FUEL' | 'OTHER'

export interface Expense {
    id: string
    branch_id: string
    category: ExpenseCategory
    description: string
    amount: number
    expense_date: string
    recorded_by: string
    created_at: string
    // Joined data
    recorder?: Profile
}
