"""
ASUOM Records Import Script
============================
Imports deceased case records from ASUOM-RECORDS.xlsx into Supabase

Default Settings:
- Embalming Fee: GHS 50
- Branch: Asuom Branch (will be determined from database)
- Missing coldroom fees: GHS 0
"""

import pandas as pd
import os
from supabase import create_client, Client
from datetime import datetime
import sys

# Configuration
EXCEL_FILE = r'c:\laragon\www\ampah\ASUOM-RECORDS.xlsx'
DEFAULT_EMBALMING_FEE = 50.0
BRANCH_NAME = 'Asuom Branch'

# Supabase Configuration (load from environment or .env file)
# Supabase Configuration (load from environment or .env file)
import os

def load_env(path):
    try:
        with open(path, 'r') as f:
            for line in f:
                if '=' in line:
                    key, val = line.strip().split('=', 1)
                    os.environ[key] = val.strip().strip('"').strip("'")
    except Exception as e:
        print(f"Error loading env: {e}")

load_env('.env.local')

SUPABASE_URL = os.getenv('NEXT_PUBLIC_SUPABASE_URL', '')
SUPABASE_KEY = os.getenv('SUPABASE_SERVICE_ROLE_KEY', '') or os.getenv('NEXT_PUBLIC_SUPABASE_ANON_KEY', '')

if not SUPABASE_URL or not SUPABASE_KEY:
    print("ERROR: Supabase credentials not found!")
    print("Please set the following environment variables:")
    print("  - NEXT_PUBLIC_SUPABASE_URL")
    print("  - SUPABASE_SERVICE_ROLE_KEY")
    print("\nOr update the script with your credentials directly.")
    sys.exit(1)

# Initialize Supabase client
supabase: Client = create_client(SUPABASE_URL, SUPABASE_KEY)

def get_branch_id():
    """Get the Asuom Branch ID from database"""
    try:
        response = supabase.table('branches').select('id').eq('name', BRANCH_NAME).execute()
        if response.data and len(response.data) > 0:
            return response.data[0]['id']
        else:
            print(f"ERROR: Branch '{BRANCH_NAME}' not found in database!")
            print("Please run the branch migration script first (rename_to_asuom.sql)")
            sys.exit(1)
    except Exception as e:
        print(f"ERROR getting branch ID: {e}")
        sys.exit(1)

def transform_status(status):
    """Transform status from Excel format to database format"""
    if pd.isna(status):
        return 'IN_CUSTODY'  # Default
    status_str = str(status).strip().upper()
    if 'DISCHARGE' in status_str:
        return 'DISCHARGED'
    elif 'CUSTODY' in status_str:
        return 'IN_CUSTODY'
    else:
        return 'IN_CUSTODY'  # Default

def safe_float(value, default=0.0):
    """Safely convert to float, return default if null/invalid"""
    try:
        if pd.isna(value):
            return default
        return float(value)
    except:
        return default

def safe_int(value, default=0):
    """Safely convert to int, return default if null/invalid"""
    try:
        if pd.isna(value):
            return default
        return int(value)
    except:
        return default

def safe_str(value, default=''):
    """Safely convert to string, return default if null"""
    if pd.isna(value):
        return default
    return str(value).strip()

def safe_date(value):
    """Safely convert to date string, return None if null"""
    if pd.isna(value):
        return None
    try:
        if isinstance(value, str):
            return value
        return value.strftime('%Y-%m-%d')
    except:
        return None

def safe_time(value):
    """Safely convert to time string, return None if null"""
    if pd.isna(value):
        return None
    try:
        if isinstance(value, str):
            return value
        return value.strftime('%H:%M:%S')
    except:
        return None

def preview_data(df, branch_id):
    """Preview the first 5 records to be imported"""
    print("\n" + "="*80)
    print("PREVIEW: First 5 Records to Import")
    print("="*80)
    
    for idx in range(min(5, len(df))):
        row = df.iloc[idx]
        
        # Calculate fees
        registration_fee = safe_float(row.get('REGISTRATION FEE', 0))
        coldroom_fee = safe_float(row.get('COLDROOM FEE', 0))
        storage_fee = safe_float(row.get('STORAGE FEE', 0))
        embalming_fee = DEFAULT_EMBALMING_FEE
        total_bill = registration_fee + coldroom_fee + storage_fee + embalming_fee
        
        print(f"\nRecord {idx + 1}:")
        print(f"  Tag No: {safe_str(row.get('TAG NO.', ''))}")
        print(f"  Name: {safe_str(row.get('NAME OF DECEASED', ''))}")
        print(f"  Age: {safe_int(row.get('AGE', 0))}")
        print(f"  Gender: {safe_str(row.get('GENDER', ''))}")
        print(f"  Status: {transform_status(row.get('STATUS'))}")
        print(f"  Admission: {safe_date(row.get('ADMISSION DATE'))}")
        print(f"  Discharge: {safe_date(row.get('DISCHARGE DATE'))}")
        print(f"  Fees:")
        print(f"    - Registration: GHS {registration_fee:.2f}")
        print(f"    - Coldroom: GHS {coldroom_fee:.2f}")
        print(f"    - Storage: GHS {storage_fee:.2f}")
        print(f"    - Embalming: GHS {embalming_fee:.2f} (DEFAULT)")
        print(f"    - TOTAL BILL: GHS {total_bill:.2f}")
    
    print("\n" + "="*80)

def import_records(dry_run=True):
    """
    Import records from Excel to Supabase
    
    Args:
        dry_run: If True, only preview data without importing
    """
    print("\n" + "="*80)
    print("ASUOM Records Import Script")
    print("="*80)
    print(f"Mode: {'DRY RUN (Preview Only)' if dry_run else 'LIVE IMPORT'}")
    print(f"Excel File: {EXCEL_FILE}")
    print(f"Default Embalming Fee: GHS {DEFAULT_EMBALMING_FEE}")
    print(f"Target Branch: {BRANCH_NAME}")
    print("="*80)
    
    # Read Excel file
    print("\n📂 Reading Excel file...")
    try:
        df = pd.read_excel(EXCEL_FILE)
        print(f"✅ Found {len(df)} records")
    except Exception as e:
        print(f"❌ ERROR reading Excel file: {e}")
        return
    
    # Get branch ID
    print(f"\n🔍 Looking up '{BRANCH_NAME}' in database...")
    branch_id = get_branch_id()
    print(f"✅ Branch ID: {branch_id}")
    
    # Preview data
    preview_data(df, branch_id)
    
    if dry_run:
        print("\n⚠️  DRY RUN MODE - No data will be imported")
        print("To perform actual import, run: python import_asuom.py --live")
        return
    
    # Confirm import
    print("\n" + "="*80)
    response = input(f"⚠️  Ready to import {len(df)} records. Continue? (yes/no): ")
    if response.lower() != 'yes':
        print("❌ Import cancelled")
        return
    
    # Import records
    print("\n📥 Importing records...")
    success_count = 0
    error_count = 0
    errors = []
    
    for idx, row in df.iterrows():
        try:
            # Calculate fees
            registration_fee = safe_float(row.get('REGISTRATION FEE', 0))
            coldroom_fee = safe_float(row.get('COLDROOM FEE', 0))
            storage_fee = safe_float(row.get('STORAGE FEE', 0))
            embalming_fee = DEFAULT_EMBALMING_FEE
            total_bill = registration_fee + coldroom_fee + storage_fee + embalming_fee
            total_paid = 0.0  # No payment data in Excel
            balance = total_bill - total_paid
            
            # Prepare case data
            case_data = {
                'branch_id': branch_id,
                'tag_no': safe_str(row.get('TAG NO.', '')),
                'name_of_deceased': safe_str(row.get('NAME OF DECEASED', '')),
                'age': safe_int(row.get('AGE', 0)) or None,
                'gender': safe_str(row.get('GENDER', 'Unknown')),
                'place': safe_str(row.get('PLACE', '')),
                'admission_date': safe_date(row.get('ADMISSION DATE')),
                'admission_time': safe_time(row.get('ADMISSION TIME')),
                'type': safe_str(row.get('TYPE', 'Normal')),
                'status': transform_status(row.get('STATUS')),
                'discharge_date': safe_date(row.get('DISCHARGE DATE')),
                'storage_days': safe_int(row.get('STORAGE DAYS', 0)),
                'relative_name': safe_str(row.get('NAME OF RELATIVE', '')),
                'relative_contact': safe_str(row.get("RELATIVE'S CONTACT", '')),
                'registration_fee': registration_fee,
                'embalming_fee': embalming_fee,
                'coldroom_fee': coldroom_fee,
                'storage_fee': storage_fee,
                'total_bill': total_bill,
                'total_paid': total_paid,
                'balance': balance,
                'embalming_receipt_no': safe_str(row.get('EMBALMING RECEIPT', '')),
                'coldroom_receipt_no': safe_str(row.get('COLDROOM RECEIPT', '')),
            }
            
            # Insert into Supabase
            response = supabase.table('deceased_cases').insert(case_data).execute()
            success_count += 1
            
            if (idx + 1) % 10 == 0:
                print(f"  Imported {idx + 1}/{len(df)} records...")
                
        except Exception as e:
            error_count += 1
            errors.append({
                'row': idx + 1,
                'tag_no': safe_str(row.get('TAG NO.', 'Unknown')),
                'error': str(e)
            })
            print(f"  ❌ Error on row {idx + 1}: {e}")
    
    # Summary
    print("\n" + "="*80)
    print("IMPORT SUMMARY")
    print("="*80)
    print(f"✅ Successfully imported: {success_count} records")
    print(f"❌ Errors: {error_count} records")
    
    if errors:
        print("\nErrors:")
        for err in errors:
            print(f"  Row {err['row']} (Tag: {err['tag_no']}): {err['error']}")
    
    print("\n✨ Import complete!")

if __name__ == "__main__":
    # Check command line arguments
    is_live = '--live' in sys.argv or '--import' in sys.argv
    
    # Run import
    import_records(dry_run=not is_live)
