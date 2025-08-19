from sqlalchemy import create_engine
import pandas as pd

SRC_URI = "mysql+pymysql://root:1234@localhost/celeb"
DST_URI = "mysql+pymysql://root:1234@localhost/celeb_copy"

SELECTED_COLUMNS = [
    "id", "first_name", "last_name", "email", "department", "salary", "is_active"
]

TABLE_NAME = "employees"

def copy_selected_columns():
    src_engine = create_engine(SRC_URI)
    dst_engine = create_engine(DST_URI)

    print(f"Copying selected columns from `{TABLE_NAME}`")
    print("Columns:", ", ".join(SELECTED_COLUMNS))

    query = f"SELECT {', '.join(SELECTED_COLUMNS)} FROM {TABLE_NAME}"
    df = pd.read_sql(query, src_engine)

    df.to_sql(TABLE_NAME, dst_engine, if_exists="replace", index=False)
    print(f"{len(df)} rows copied to destination table `{TABLE_NAME}`.")

if __name__ == "__main__":
    copy_selected_columns()
