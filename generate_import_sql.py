"""
ASUOM Records to SQL Generator
===============================
Generates SQL INSERT statements from ASUOM-RECORDS.xlsx
Can be run directly in Supabase SQL Editor

Default Settings:
- Embalming Fee: GHS 50
- Branch: Asuom Branch
"""

import pandas as pd
import sys
from datetime import datetime

# Configuration
EXCEL_FILE = r'c:\laragon\www\ampah\ASUOM-RECORDS.xlsx'
OUTPUT_FILE = r'c:\laragon\www\ampah\supabase\import_asuom_data.sql'
DEFAULT_EMBALMING_FEE = 50.0

def safe_float(value, default=0.0):
    """Safely convert to float"""
    try:
        if pd.isna(value):
            return default
        return float(value)
    except:
        return default

def safe_int(value, default=0):
    """Safely convert to int"""
    try:
        if pd.isna(value):
            return default
        return int(value)
    except:
        return default

def safe_str(value, default=''):
    """Safely convert to string for SQL"""
    if pd.isna(value):
        return default
    s = str(value).strip().replace("'", "''")  # Escape single quotes
    return s

def safe_date(value):
    """Convert to SQL date format"""
    if pd.isna(value):
        return 'NULL'
    try:
        if isinstance(value, str):
            return f"'{value}'"
        return f"'{value.strftime('%Y-%m-%d')}'"
    except:
        return 'NULL'

def safe_time(value):
    """Convert to SQL time format"""
    if pd.isna(value):
        return 'NULL'
    try:
        if isinstance(value, str):
            return f"'{value}'"
        return f"'{value.strftime('%H:%M:%S')}'"
    except:
        return 'NULL'

def transform_status(status):
    """Transform status to database format"""
    if pd.isna(status):
        return 'IN_CUSTODY'
    status_str = str(status).strip().upper()
    if 'DISCHARGE' in status_str:
        return 'DISCHARGED'
    elif 'CUSTODY' in status_str:
        return 'IN_CUSTODY'
    else:
        return 'IN_CUSTODY'

def generate_sql():
    """Generate SQL INSERT statements"""
    print("Reading Excel file...")
    try:
        df = pd.read_excel(EXCEL_FILE)
        # Clean column names (remove leading/trailing spaces)
        df.columns = df.columns.str.strip()
        print(f"Found {len(df)} records\n")
        print("Columns found:", df.columns.tolist())
    except Exception as e:
        print(f"ERROR reading Excel: {e}")
        return
    
    print(f"Generating SQL INSERT statements...")
    print(f"Output file: {OUTPUT_FILE}\n")
    
    with open(OUTPUT_FILE, 'w', encoding='utf-8') as f:
        # Write header
        f.write("-- =============================================\n")
        f.write("-- ASUOM RECORDS DATA IMPORT\n")
        f.write("-- =============================================\n")
        f.write(f"-- Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
        f.write(f"-- Total Records: {len(df)}\n")
        f.write(f"-- Default Embalming Fee: GHS {DEFAULT_EMBALMING_FEE}\n")
        f.write("-- =============================================\n\n")
        
        f.write("-- Get the Asuom Branch ID\n")
        f.write("DO $$\n")
        f.write("DECLARE\n")
        f.write("  v_branch_id UUID;\n")
        f.write("BEGIN\n")
        f.write("  -- Get Asuom Branch ID\n")
        f.write("  SELECT id INTO v_branch_id FROM branches WHERE name = 'Asuom Branch' LIMIT 1;\n\n")
        f.write("  IF v_branch_id IS NULL THEN\n")
        f.write("    RAISE EXCEPTION 'Asuom Branch not found! Please run rename_to_asuom.sql first.';\n")
        f.write("  END IF;\n\n")
        f.write("  -- Insert records\n")
        
        success_count = 0
        error_count = 0
        
        for idx, row in df.iterrows():
            # Skip summary rows and invalid data
            tag_no = safe_str(row.get('TAG NO.', '')).upper()
            name = safe_str(row.get('NAME OF DECEASED', '')).strip()
            
            # Skip if it's a total/summary row or has no name
            if tag_no == 'TOTAL' or not name or name.upper() == 'TOTAL':
                print(f"  ⏭️  Skipping summary row at index {idx + 1}")
                continue
            
            try:
                # Calculate fees
                registration_fee = safe_float(row.get('REGISTRATION FEE', 0))
                coldroom_fee = safe_float(row.get('COLDROOM FEE', 0))
                storage_fee = safe_float(row.get('STORAGE FEE', 0))
                embalming_fee = DEFAULT_EMBALMING_FEE
                total_bill = registration_fee + coldroom_fee + storage_fee + embalming_fee
                total_paid = 0.0
                balance = total_bill
                
                # Generate INSERT statement
                f.write(f"\n  -- Record {idx + 1}: {safe_str(row.get('NAME OF DECEASED', 'Unknown'))}\n")
                f.write("  INSERT INTO deceased_cases (\n")
                f.write("    branch_id, tag_no, name_of_deceased, age, gender,\n")
                f.write("    place, admission_date, admission_time, type, status,\n")
                f.write("    discharge_date, storage_days, relative_name, relative_contact,\n")
                f.write("    registration_fee, embalming_fee, coldroom_fee, storage_fee,\n")
                f.write("    total_bill, total_paid, balance,\n")
                f.write("    embalming_receipt_no, coldroom_receipt_no\n")
                f.write("  ) VALUES (\n")
                f.write(f"    v_branch_id,\n")
                f.write(f"    '{safe_str(row.get('TAG NO.', ''))}',\n")
                f.write(f"    '{safe_str(row.get('NAME OF DECEASED', ''))}',\n")
                f.write(f"    {safe_int(row.get('AGE', 0)) or 'NULL'},\n")
                f.write(f"    '{safe_str(row.get('GENDER', 'Unknown'))}',\n")
                f.write(f"    '{safe_str(row.get('PLACE', ''))}',\n")
                f.write(f"    {safe_date(row.get('ADMISSION DATE'))},\n")
                f.write(f"    {safe_time(row.get('ADMISSION TIME'))},\n")
                f.write(f"    '{safe_str(row.get('TYPE', 'Normal'))}',\n")
                f.write(f"    '{transform_status(row.get('STATUS'))}',\n")
                f.write(f"    {safe_date(row.get('DISCHARGE DATE'))},\n")
                f.write(f"    {safe_int(row.get('STORAGE DAYS', 0))},\n")
                f.write(f"    '{safe_str(row.get('NAME OF RELATIVE', ''))}',\n")
                relative_contact = safe_str(row.get("RELATIVE'S CONTACT", ''))
                f.write(f"    '{relative_contact}',\n")
                f.write(f"    {registration_fee},\n")
                f.write(f"    {embalming_fee},\n")
                f.write(f"    {coldroom_fee},\n")
                f.write(f"    {storage_fee},\n")
                f.write(f"    {total_bill},\n")
                f.write(f"    {total_paid},\n")
                f.write(f"    {balance},\n")
                f.write(f"    '{safe_str(row.get('EMBALMING RECEIPT', ''))}',\n")
                f.write(f"    '{safe_str(row.get('COLDROOM RECEIPT', ''))}'\n")
                f.write("  )\n")
                f.write("  ON CONFLICT (branch_id, tag_no) DO UPDATE SET\n")
                f.write("    place = EXCLUDED.place,\n")
                f.write("    name_of_deceased = EXCLUDED.name_of_deceased,\n")
                f.write("    age = EXCLUDED.age,\n")
                f.write("    gender = EXCLUDED.gender,\n")
                f.write("    admission_date = EXCLUDED.admission_date,\n")
                f.write("    admission_time = EXCLUDED.admission_time,\n")
                f.write("    discharge_date = EXCLUDED.discharge_date,\n")
                f.write("    status = EXCLUDED.status,\n")
                f.write("    updated_at = NOW();\n")
                
                success_count += 1
                
            except Exception as e:
                error_count += 1
                f.write(f"\n  -- ERROR on record {idx + 1}: {e}\n")
                print(f"  ❌ Error on row {idx + 1}: {e}")
        
        f.write("\n  RAISE NOTICE 'Import complete! Inserted % records.', " + str(success_count) + ";\n")
        f.write("END $$;\n\n")
        
        # Verification query
        f.write("-- Verify import\n")
        f.write("SELECT COUNT(*) as total_records FROM deceased_cases WHERE branch_id = (\n")
        f.write("  SELECT id FROM branches WHERE name = 'Asuom Branch'\n")
        f.write(");\n\n")
        
        f.write("SELECT status, COUNT(*) as count FROM deceased_cases\n")
        f.write("WHERE branch_id = (SELECT id FROM branches WHERE name = 'Asuom Branch')\n")
        f.write("GROUP BY status;\n")
    
    print("\n" + "="*80)
    print("SQL GENERATION COMPLETE!")
    print("="*80)
    print(f"✅ Generated SQL for {success_count} records")
    if error_count > 0:
        print(f"❌ Errors: {error_count} records")
    print(f"\n📄 Output file: {OUTPUT_FILE}")
    print("\nNext steps:")
    print("1. Open Supabase SQL Editor")
    print("2. Run the SQL file: import_asuom_data.sql")
    print("3. Verify the import with the queries at the end")
    print("\n" + "="*80)

if __name__ == "__main__":
    generate_sql()
