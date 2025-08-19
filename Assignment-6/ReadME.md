# Celebal Technologies – Data Engineering Intern Assignment 6

This repository includes 5 simulated tasks for the Azure Data Engineering role at **Celebal Technologies**. Each task is implemented using local tools (Python, SQL, CSV) to represent Azure Data Factory functionalities.

---

##  Tasks Covered

### 1.  **Data Retrieval Failure with Retry Logic**
Simulates retrying file reading on transient failure using Python.

- `Data Retrieval Failure.py`
- `Task-3_source_data.csv`
- Includes retry logic with delay on failure

---

### 2.  **FTP/SFTP Data Extraction Simulation**
Simulates extraction of data from an SFTP server.

- `extract_from_sftp.py`
- `Employee.csv`
- Mimics ADF FTP connection and data pulling

---

### 3. **Incremental Load Pipeline**
Demonstrates watermark-based incremental load logic.

- `incremental_load.py`
- `Task-3_source_data.csv`
- `sql_Server.sql` (simulates database)
- Uses pandas + SQL to filter new data

---

### 4.  **Last Saturday of Month Trigger**
Implements custom Python logic to calculate the last Saturday.

- `last_saturday_trigger.py`
- Simulates custom time-based trigger

---

### 5.  **Simulated Azure SQL Load**
Demonstrates data loading to a mock Azure SQL Database.

- `Simulate Azure SQL.sql`
- `sql_Server.sql`
- Performs insert/update operations

---

## Folder Organization

Each folder contains:
- Script file (`.py` or `.sql`)
- Input file(s) (e.g., `.csv`)
- `Report.md` describing approach, logic, and output

---

## Technologies Used

- Python 3.10+
- Pandas
- SQLite (simulating Azure SQL)
- Bash (optional)
- CSV files
- SQL scripts

---

## How to Run

1. Clone the repository
```bash
git clone https://github.com/your-username/celebal-assignment-6.git
cd celebal-assignment-6
```
2. Navigate to each folder and run the Python scripts using:
```bash
python filename.py
```
3. View Report.md in each folder for task explanation and work input.

---

## Author
Khushi Kadyan  && Sarthak Maan

B.Tech CSE (DSAI) && Btech CSE (CORE)

Celebal Technologies Intern (2025)

SRM University ,Sonepat
