# ASUOM Records Import Guide

This guide will help you import 275 historical records from ASUOM-RECORDS.xlsx into your Mortuary Management System.

## 📊 Import Summary

- **Total Records**: 275 cases
- **Discharged**: 214 cases  
- **In Custody**: 60 cases
- **Target Branch**: Asuom Branch
- **Default Embalming Fee**: GHS 50.00

---

## ✅ Prerequisites

Before importing, ensure you have completed:

1. ✅ Run branch migration: `supabase/rename_to_asuom.sql`
   - This renames "Accra Main Branch" → "Asuom Branch"
   - This renames "Kumasi Branch" → "Asanteman Branch"

2. ✅ Run database migrations:
   - `supabase/add_registration_fee.sql` (adds registration_fee column)
   - `supabase/update_allocation_check.sql` (adds REGISTRATION to payment types)

---

## 🚀 Import Steps

### Step 1: Open Supabase Dashboard

1. Go to your Supabase project
2. Navigate to **SQL Editor**

### Step 2: Run Import SQL

1. Click **"New Query"**
2. Open the file: `supabase/import_asuom_data.sql`
3. Copy the entire contents
4. Paste into the SQL Editor
5. Click **"Run"** or press `Ctrl+Enter`

### Step 3: Verify Import

The import script includes verification queries at the end. You should see:

```sql
-- Total records for Asuom Branch
SELECT COUNT(*) as total_records FROM deceased_cases 
WHERE branch_id = (SELECT id FROM branches WHERE name = 'Asuom Branch');
-- Expected: 275

-- Status distribution
SELECT status, COUNT(*) as count FROM deceased_cases
WHERE branch_id = (SELECT id FROM branches WHERE name = 'Asuom Branch')
GROUP BY status;
-- Expected: DISCHARGED: 214, IN_CUSTODY: 60
```

---

## 📝 Data Transformation Details

### Fees Calculation

For each record:
- **Registration Fee**: From Excel (direct)
- **Coldroom Fee**: From Excel (defaults to 0 if missing)
- **Storage Fee**: From Excel (defaults to 0 if missing)  
- **Embalming Fee**: GHS 50.00 (default, not in Excel)
- **Total Bill** = Registration + Coldroom + Storage + Embalming
- **Total Paid** = 0 (no payment data in Excel)
- **Balance** = Total Bill - Total Paid

### Status Transformation

- Excel: "DISCHARGED" → Database: "DISCHARGED"
- Excel: "IN CUSTODY" → Database: "IN_CUSTODY"

### Missing Values

- Missing COLDROOM FEE (55 records) → Default to 0
- Missing DISCHARGE DATE (40 records) → NULL (expected for IN_CUSTODY)
- Missing RELATIVE'S CONTACT (5 records) → Empty string
- Missing AGE (1 record) → NULL

---

## 🔧 Troubleshooting

### Error: "Asuom Branch not found"
**Solution**: Run `supabase/rename_to_asuom.sql` first

### Error: "column registration_fee does not exist"
**Solution**: Run `supabase/add_registration_fee.sql` first

### Error: Duplicate tag_no violations
**Solution**: Tag numbers are per-branch, so duplicates across branches are OK. If you see errors within the same branch, check for duplicate TAG NO. values in the Excel file.

---

## 📊 After Import

Once import is complete, you can:

1. **View Records**: Navigate to `/dashboard/ASU/cases` in your application
2. **Browse by Status**: 
   - Active cases: Filter by "IN_CUSTODY"
   - Historical: Filter by "DISCHARGED"
3. **Add Payments**: Use the Finance module to record payments against outstanding balances

---

## 🎯 Next Steps

After importing ASUOM records, consider:

1. **Import ASANTEMAN records** (if you have a similar Excel file)
2. **Add historical payments** (if available)
3. **Configure staff access** using `supabase/add_asuom_staff.sql`
4. **Train staff** on the new system

---

## 📞 Support

If you encounter any issues:
1. Check the error message in Supabase SQL Editor
2. Review the Excel file for data quality issues
3. Verify all prerequisite migrations have been run
4. Check that branch names match exactly ("Asuom Branch")

---

**Generated**: 2025-12-26  
**Script**: `generate_import_sql.py`  
**SQL File**: `supabase/import_asuom_data.sql`
