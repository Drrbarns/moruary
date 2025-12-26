import pandas as pd
import sys

df = pd.read_excel(r'c:\laragon\www\ampah\ASUOM-RECORDS.xlsx')

sys.stdout.write(f"Total rows: {len(df)}\n\n")
sys.stdout.write("Columns:\n")
for i, col in enumerate(df.columns, 1):
    sys.stdout.write(f"{i}. {col}\n")

sys.stdout.write(f"\nStatus values:\n")
if 'STATUS' in df.columns:
    status_counts = df['STATUS'].value_counts()
    for status, count in status_counts.items():
        sys.stdout.write(f"{status}: {count}\n")
