import os
import datetime
import pandas as pd
import pyarrow as pa
import pyarrow.parquet as pq
from fastavro import writer, parse_schema
from sqlalchemy import create_engine

MYSQL_URI = "mysql+pymysql://root:1234@localhost/celeb"
QUERY = "SELECT * FROM employees"
OUTPUT_DIR = "exported_data"
CSV_PATH = os.path.join(OUTPUT_DIR, "data.csv")
PARQUET_PATH = os.path.join(OUTPUT_DIR, "data.parquet")
AVRO_PATH = os.path.join(OUTPUT_DIR, "data.avro")

def fetch_data():
    engine = create_engine(MYSQL_URI)
    with engine.connect() as connection:
        return pd.read_sql(QUERY, con=connection)

def export_to_csv(df):
    df.to_csv(CSV_PATH, index=False)

def export_to_parquet(df):
    table = pa.Table.from_pandas(df)
    pq.write_table(table, PARQUET_PATH)

def generate_avro_schema(df):
    fields = []
    for col, dtype in zip(df.columns, df.dtypes):
        avro_type = "string"
        if pd.api.types.is_integer_dtype(dtype):
            avro_type = "long"
        elif pd.api.types.is_float_dtype(dtype):
            avro_type = "double"
        elif pd.api.types.is_bool_dtype(dtype):
            avro_type = "boolean"
        elif pd.api.types.is_datetime64_any_dtype(dtype):
            avro_type = {"type": "long", "logicalType": "timestamp-millis"}
        fields.append({"name": col, "type": ["null", avro_type], "default": None})
    return {
        "type": "record",
        "name": "MyRecord",
        "namespace": "export.mysql",
        "doc": "MySQL export Avro schema",
        "fields": fields
    }

def preprocess_avro_records(df):
    df_copy = df.where(pd.notnull(df), None).copy()
    for col in df_copy.columns:
        if pd.api.types.is_object_dtype(df_copy[col]):
            df_copy[col] = df_copy[col].apply(
                lambda x: str(x) if isinstance(x, datetime.date) and not isinstance(x, datetime.datetime) else x
            )
    return df_copy.to_dict(orient="records")

def export_to_avro(df):
    schema = parse_schema(generate_avro_schema(df))
    records = preprocess_avro_records(df)
    with open(AVRO_PATH, "wb") as f:
        writer(f, schema, records)

def run_pipeline():
    print(f"[{datetime.datetime.now()}] Running export pipeline...")
    os.makedirs(OUTPUT_DIR, exist_ok=True)
    df = fetch_data()
    export_to_csv(df)
    export_to_parquet(df)
    export_to_avro(df)
    print("Export complete.\n")
