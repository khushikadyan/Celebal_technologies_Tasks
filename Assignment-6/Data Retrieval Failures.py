import time
import pandas as pd

max_retries = 3
wait_seconds = 5

for attempt in range(1, max_retries + 1):
    try:
        print(f"Attempt {attempt}: Reading file...")
        df = pd.read_csv("data_source.csv")
        print(" File read successfully!")
        break
    except FileNotFoundError as e:
        print(f" Error: {e}")
        if attempt < max_retries:
            print(f" Waiting {wait_seconds} seconds before retrying...")
            time.sleep(wait_seconds)
        else:
            print(" Failed after 3 attempts. Exiting.")
