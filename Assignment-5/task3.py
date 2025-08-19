from sqlalchemy import create_engine, inspect
import pandas as pd

SRC_URI = "mysql+pymysql://root:1234@localhost/celeb"
DST_URI = "mysql+pymysql://root:1234@localhost/celeb_copy"

def get_table_names(engine):
    inspector = inspect(engine)
    return inspector.get_table_names()

def replicate_table(src_engine, dst_engine, table):
    print(f"Replicating table: {table}")
    df = pd.read_sql_table(table, src_engine)
    print(f"    Rows fetched from source: {len(df)}")
    df.to_sql(table, dst_engine, if_exists='replace', index=False)
    print(f"    Written to destination: {table}\n")

def replicate_all():
    print("Connecting to source and destination databases...")
    src_engine = create_engine(SRC_URI)
    dst_engine = create_engine(DST_URI)

    print("Fetching table list from source database...")
    tables = get_table_names(src_engine)
    print(f"   Found {len(tables)} tables.\n")

    for table in tables:
        replicate_table(src_engine, dst_engine, table)

    print("All tables replicated successfully.")

if __name__ == '__main__':
    replicate_all()
