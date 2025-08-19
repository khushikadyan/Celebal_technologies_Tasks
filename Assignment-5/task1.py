from utils import run_pipeline, CSV_PATH, PARQUET_PATH, AVRO_PATH
import pandas as pd
import pyarrow.parquet as pq
from fastavro import reader

def print_csv_head(path):
    print("\nCSV Head:")
    print(pd.read_csv(path).head())

def print_parquet_head(path):
    print("\nParquet Head:")
    print(pq.read_table(path).to_pandas().head())

def print_avro_head(path):
    print("\nAvro Head:")
    with open(path, "rb") as f:
        records = list(reader(f))
    print(pd.DataFrame(records).head())

def main():
    run_pipeline()
    print_csv_head(CSV_PATH)
    print_parquet_head(PARQUET_PATH)
    print_avro_head(AVRO_PATH)

if __name__ == "__main__":
    main()
