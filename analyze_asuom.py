import pandas as pd

# Read the Excel file
df = pd.read_excel(r'c:\laragon\www\ampah\ASUOM-RECORDS.xlsx')

# Print column information
print("=" * 60)
print("ASUOM-RECORDS.xlsx Analysis")
print("=" * 60)
print(f"\nTotal Rows: {len(df)}")
print(f"Total Columns: {len(df.columns)}\n")

print("Columns:")
for i, col in enumerate(df.columns, 1):
    print(f"{i}. {col}")

print("\n" + "=" * 60)
print("Data Types:")
print("=" * 60)
print(df.dtypes)

print("\n" + "=" * 60)
print("Status Distribution:")
print("=" * 60)
if 'STATUS' in df.columns:
    print(df['STATUS'].value_counts())

print("\n" + "=" * 60)
print("Sample Data (first 3 rows):")
print("=" * 60)
print(df.head(3).to_string())

print("\n" + "=" * 60)
print("Missing Values Summary:")
print("=" * 60)
print(df.isnull().sum())
