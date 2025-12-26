"""
Setup script for importing ASUOM records
========================================
Run this before import_asuom.py to set environment variables
"""

print("""
ASUOM IMPORT - SETUP INSTRUCTIONS
==================================

Before running the import, you need to provide your Supabase credentials.

1. Get your Supabase credentials:
   - Go to your Supabase Dashboard
   - Click on Project Settings (gear icon)
   - Go to API section
   - Copy the following:
     * Project URL (NEXT_PUBLIC_SUPABASE_URL)
     * service_role key (SUPABASE_SERVICE_ROLE_KEY) - NOT the anon key!

2. Set environment variables in PowerShell:

   $env:NEXT_PUBLIC_SUPABASE_URL="your-project-url"
   $env:SUPABASE_SERVICE_ROLE_KEY="your-service-role-key"

3. Or create a .env file in the project root with:

   NEXT_PUBLIC_SUPABASE_URL=your-project-url
   SUPABASE_SERVICE_ROLE_KEY=your-service-role-key

4. Then run the import:

   # DRY RUN (preview only)
   python import_asuom.py

   # LIVE IMPORT (actual import)
   python import_asuom.py --live

NOTE: Make sure you've run the branch migration first!
      (supabase/rename_to_asuom.sql)

""")
