# MySQL Data Pipeline Tasks – Complete Setup and Description

This repository demonstrates a complete MySQL-based data pipeline system using Python. It includes:

1. Exporting relational data to multiple formats (CSV, Parquet, Avro)
2. Automating pipeline execution with scheduling and event triggers
3. Full database table replication
4. Selective table and column replication

Each task is handled in a separate script and builds on a real-world `employees` table in a MySQL database.

---

## ✅ MySQL Setup

### Create Databases:

```sql
CREATE DATABASE celeb;
CREATE DATABASE celeb_copy;
```

### Use `celeb` database and create the table:

```sql
USE celeb;

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(150),
    phone_number VARCHAR(20),
    age INT,
    gender ENUM('Male', 'Female', 'Other'),
    date_of_birth DATE,
    hire_date DATE,
    department VARCHAR(100),
    job_title VARCHAR(100),
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    manager_id INT,
    address TEXT,
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    postal_code VARCHAR(20),
    performance_score INT,
    is_active BOOLEAN,
    last_login DATETIME,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

### Insert Sample Data:

```sql
INSERT INTO employees 
(first_name, last_name, email, phone_number, age, gender, date_of_birth, hire_date, department, job_title, salary, bonus, manager_id, address, city, state, country, postal_code, performance_score, is_active, last_login) 
VALUES
('Alice', 'Johnson', 'alice.johnson@example.com', '1234567890', 30, 'Female', '1993-04-21', '2020-01-15', 'HR', 'HR Manager', 75000.00, 5000.00, NULL, '123 Oak St', 'New York', 'NY', 'USA', '10001', 85, TRUE, '2024-06-01 08:45:00'),
('Bob', 'Smith', 'bob.smith@example.com', '0987654321', 28, 'Male', '1995-07-12', '2021-06-20', 'Engineering', 'Software Engineer', 90000.00, 7000.00, 1, '456 Pine St', 'San Francisco', 'CA', 'USA', '94107', 92, TRUE, '2024-06-02 09:30:00'),
('Charlie', 'Lee', 'charlie.lee@example.com', '1122334455', 35, 'Male', '1988-11-05', '2019-09-10', 'Finance', 'Financial Analyst', 82000.00, 4000.00, 1, '789 Elm St', 'Chicago', 'IL', 'USA', '60601', 88, TRUE, '2024-06-03 10:00:00'),
('Diana', 'Nguyen', 'diana.nguyen@example.com', '1231231234', 40, 'Female', '1983-03-18', '2017-04-12', 'Marketing', 'Marketing Director', 98000.00, 9000.00, NULL, '321 Cedar St', 'Seattle', 'WA', 'USA', '98101', 95, TRUE, '2024-06-01 07:50:00'),
('Ethan', 'Wright', 'ethan.wright@example.com', '3213214321', 25, 'Male', '1998-10-30', '2022-11-01', 'Support', 'Support Engineer', 62000.00, 2000.00, 2, '654 Birch St', 'Austin', 'TX', 'USA', '73301', 78, TRUE, '2024-06-04 11:15:00'),
('Fatima', 'Khan', 'fatima.khan@example.com', '7778889999', 32, 'Female', '1991-09-09', '2018-07-18', 'Sales', 'Sales Executive', 67000.00, 3500.00, 4, '987 Spruce St', 'Boston', 'MA', 'USA', '02108', 89, TRUE, '2024-06-02 10:30:00'),
('George', 'Patel', 'george.patel@example.com', '6665554444', 29, 'Male', '1994-01-25', '2021-03-25', 'Engineering', 'DevOps Engineer', 87000.00, 5500.00, 2, '543 Willow St', 'Denver', 'CO', 'USA', '80202', 83, TRUE, '2024-06-03 09:50:00'),
('Hannah', 'Lopez', 'hannah.lopez@example.com', '9990001111', 27, 'Female', '1996-06-17', '2023-02-14', 'Design', 'UI/UX Designer', 74000.00, 2500.00, 3, '432 Aspen St', 'Portland', 'OR', 'USA', '97201', 90, TRUE, '2024-06-05 12:00:00'),
('Ivan', 'Garcia', 'ivan.garcia@example.com', '8887776666', 31, 'Male', '1992-12-03', '2020-10-01', 'Engineering', 'Backend Developer', 91000.00, 6000.00, 2, '321 Redwood St', 'Los Angeles', 'CA', 'USA', '90001', 87, TRUE, '2024-06-01 08:30:00'),
('Julia', 'Kim', 'julia.kim@example.com', '4443332222', 38, 'Female', '1985-02-28', '2016-05-10', 'Leadership', 'CTO', 150000.00, 20000.00, NULL, '210 Maple St', 'Atlanta', 'GA', 'USA', '30301', 98, TRUE, '2024-06-01 07:00:00');
```

---

## 🛠️ Python Setup

### Install Dependencies

```bash
pip install pandas sqlalchemy pymysql pyarrow fastavro schedule watchdog
```

---

## 🔍 Task Descriptions

### Task 1: Export to CSV, Parquet, and Avro

**File:** `task1.py`
**How it works:**

* Fetches data from the `employees` table.
* Saves it to three formats:

  * CSV for general compatibility.
  * Parquet for analytics and compression.
  * Avro for efficient schema-based storage.
* Prints first 5 rows of each exported file to verify content.

> Run using:

```bash
python task1.py
```

---

### Task 2: Schedule and Event-Based Automation

**File:** `task2.py`
**How it works:**

* Schedules the pipeline to run daily at 2:00 AM using `schedule`.
* Also sets up a file watcher using `watchdog` to re-trigger export if a `.csv` file arrives in `exported_data/`.
* Uses the same export logic from `utils.py`.

> Run using:

```bash
python task2.py
```

> Stop using `Ctrl+C`.

---

### Task 3: Full Database Replication

**File:** `task3.py`
**How it works:**

* Connects to source DB (`celeb`) and destination DB (`celeb_copy`).
* Automatically lists all tables in source DB.
* For each table, reads its contents and writes them to the destination DB.
* Reports table-by-table progress and row counts.

> Run using:

```bash
python task3.py
```

---

### Task 4: Selective Column Replication

**File:** `task4.py`
**How it works:**

* Only selected columns from the `employees` table are copied to the destination.
* This is useful for migrating sensitive or business-specific fields only.

**Selected Columns:**

```text
id, first_name, last_name, email, department, salary, is_active
```

> Run using:

```bash
python task4.py
```

---

## 📁 Output Location

All exported files are saved to the `exported_data/` directory:

* `data.csv`
* `data.parquet`
* `data.avro`

---

## 📌 Notes

* All database connections use SQLAlchemy with `pymysql` to avoid warnings.
* Avro conversion handles schema and date serialization properly.
* Code is modular and reusable using `utils.py`.
* Ensure MySQL server is running and accessible on `localhost`.
