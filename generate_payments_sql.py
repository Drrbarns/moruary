"""
ASUOM Payments & Financials Update Generator
============================================
Generates SQL INSERT statements for payments based on ASUOM-RECORDS.xlsx
and updates deceased_cases total_paid/balance fields.

Logic:
1. DISCHARGED Cases:
   - Assumes fully paid.
   - Creates payments for Registration (350), Embalming (50), and Coldroom/Storage.
   - Uses available receipt numbers or generates placeholders.
   - Dates: Reg/Emb on Admission, Coldroom on Discharge.
2. IN_CUSTODY Cases:
   - Creates payments only if receipt numbers exist in Excel.
   - Embalming Receipt -> Pays Embalming Fee (50).
   - Coldroom Receipt -> Pays Coldroom + Storage Fees.
"""

import pandas as pd
from datetime import datetime

# Configuration
EXCEL_FILE = r'c:\laragon\www\ampah\ASUOM-RECORDS.xlsx'
OUTPUT_FILE = r'c:\laragon\www\ampah\supabase\import_asuom_payments.sql'
DEFAULT_EMBALMING_FEE = 50.0
DEFAULT_REGISTRATION_FEE = 350.0

def safe_float(value, default=0.0):
    try:
        if pd.isna(value): return default
        return float(value)
    except: return default

def safe_str(value, default=''):
    if pd.isna(value): return default
    return str(value).strip().replace("'", "''")

def safe_date(value, fallback=None):
    if pd.isna(value): return fallback
    try:
        if isinstance(value, str): return f"'{value}'"
        return f"'{value.strftime('%Y-%m-%d')}'"
    except: return fallback

def transform_status(status):
    if pd.isna(status): return 'IN_CUSTODY'
    s = str(status).strip().upper()
    return 'DISCHARGED' if 'DISCHARGE' in s else 'IN_CUSTODY'

def generate_sql():
    print("Reading Excel...")
    try:
        df = pd.read_excel(EXCEL_FILE)
        df.columns = df.columns.str.strip()
    except Exception as e:
        print(f"Error: {e}")
        return

    print(f"Generating SQL to {OUTPUT_FILE}...")
    
    with open(OUTPUT_FILE, 'w', encoding='utf-8') as f:
        f.write("-- =============================================\n")
        f.write("-- ASUOM PAYMENTS IMPORT\n")
        f.write(f"-- Generated: {datetime.now()}\n")
        f.write("-- =============================================\n\n")
        
        f.write("DO $$\nDECLARE\n  v_branch_id UUID;\n  v_case_id UUID;\nBEGIN\n")
        f.write("  SELECT id INTO v_branch_id FROM branches WHERE name = 'Asuom Branch' LIMIT 1;\n")
        f.write("  IF v_branch_id IS NULL THEN RAISE EXCEPTION 'Branch not found'; END IF;\n\n")

        count = 0
        
        for idx, row in df.iterrows():
            tag = safe_str(row.get('TAG NO.', '')).upper()
            if tag == 'TOTAL' or not tag: continue

            name = safe_str(row.get('NAME OF DECEASED', 'Unknown'))
            status = transform_status(row.get('STATUS'))
            
            # Fees
            reg_fee = safe_float(row.get('REGISTRATION FEE', 0)) # Usually 350
            if reg_fee == 0: reg_fee = DEFAULT_REGISTRATION_FEE
            
            cold_fee = safe_float(row.get('COLDROOM FEE', 0))
            store_fee = safe_float(row.get('STORAGE FEE', 0))
            coldroom_total = cold_fee + store_fee
            
            emb_fee = DEFAULT_EMBALMING_FEE
            
            # Receipts
            emb_receipt = safe_str(row.get('EMBALMING RECEIPT', ''))
            cold_receipt = safe_str(row.get('COLDROOM RECEIPT', ''))
            
            # Dates
            adm_date_sql = safe_date(row.get('ADMISSION DATE'), 'NOW()')
            dis_date_sql = safe_date(row.get('DISCHARGE DATE'), 'NOW()')
            
            # Generate Logic
            f.write(f"  -- {name} ({tag})\n")
            f.write(f"  SELECT id INTO v_case_id FROM deceased_cases WHERE tag_no = '{tag}' AND branch_id = v_branch_id;\n")
            f.write("  IF v_case_id IS NOT NULL THEN\n")

            if status == 'DISCHARGED':
                # Fully Paid Assumption
                # 1. Registration
                f.write(f"    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, {reg_fee}, {adm_date_sql}, 'CASH', 'REGISTRATION', '{cold_receipt or 'REC-REG-' + tag}', NOW());\n")
                
                # 2. Embalming
                rec_emb = emb_receipt if emb_receipt else f"REC-EMB-{tag}"
                f.write(f"    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, {emb_fee}, {adm_date_sql}, 'CASH', 'EMBALMING', '{rec_emb}', NOW());\n")
                
                # 3. Coldroom
                rec_cold = cold_receipt if cold_receipt else f"REC-CLD-{tag}"
                if coldroom_total > 0:
                    f.write(f"    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, {coldroom_total}, {dis_date_sql}, 'CASH', 'COLDROOM', '{rec_cold}', NOW());\n")
                
                count += 3

            else:
                # Active Case - Check receipts
                if emb_receipt:
                    f.write(f"    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, {emb_fee}, {adm_date_sql}, 'CASH', 'EMBALMING', '{emb_receipt}', NOW());\n")
                    count += 1
                
                if cold_receipt:
                    # If they have a coldroom receipt, they likely paid registration too?
                    # Let's add registration payment if coldroom receipt exists, using same receipt or suffix
                    f.write(f"    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, {reg_fee}, {adm_date_sql}, 'CASH', 'REGISTRATION', '{cold_receipt}-REG', NOW());\n")
                    
                    if coldroom_total > 0:
                        f.write(f"    INSERT INTO payments (branch_id, case_id, amount, paid_on, method, allocation, receipt_no, created_at) VALUES (v_branch_id, v_case_id, {coldroom_total}, {adm_date_sql}, 'CASH', 'COLDROOM', '{cold_receipt}', NOW());\n")
                    count += 2
            
            f.write("  END IF;\n")

        f.write("\n  -- Update total_paid and balance for all cases\n")
        f.write("  UPDATE deceased_cases c SET\n")
        f.write("    total_paid = COALESCE((SELECT SUM(amount) FROM payments p WHERE p.case_id = c.id), 0),\n")
        f.write("    balance = c.total_bill - COALESCE((SELECT SUM(amount) FROM payments p WHERE p.case_id = c.id), 0)\n")
        f.write("  WHERE branch_id = v_branch_id;\n")

        f.write("END $$;\n")
        
    print(f"Done. Generated {count} payment records.")

if __name__ == "__main__":
    generate_sql()
