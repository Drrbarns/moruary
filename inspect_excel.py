import pandas as pd

file_path = r'c:\laragon\www\ampah\ASUOM-RECORDS.xlsx'

try:
    df = pd.read_excel(file_path)
    print("Columns:", df.columns.tolist())
except Exception as e:
    print(f"Error reading file: {e}")
