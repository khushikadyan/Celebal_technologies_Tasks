import pandas as pd
from datetime import datetime

# File paths
source_file = "source_data.csv"
target_file = "target_data.csv"
watermark_file = "last_updated.txt"

# Load watermark
try:
    with open(watermark_file, 'r') as f:
        last_updated = datetime.strptime(f.read().strip(), "%Y-%m-%d %H:%M:%S")
except FileNotFoundError:
    last_updated = datetime.min  # Load all data initially

# Read source
df = pd.read_csv(source_file, parse_dates=['ModifiedDate'])

# Filter new records
new_data = df[df['ModifiedDate'] > last_updated]

if not new_data.empty:
    # Append to target
    try:
        pd.read_csv(target_file)  # Check if exists
        new_data.to_csv(target_file, mode='a', header=False, index=False)
    except FileNotFoundError:
        new_data.to_csv(target_file, index=False)
    
    # Update watermark
    new_max_time = new_data['ModifiedDate'].max().strftime("%Y-%m-%d %H:%M:%S")
    with open(watermark_file, 'w') as f:
        f.write(new_max_time)
    print(" New records appended.")
else:
    print("ℹ No new records to load.")
