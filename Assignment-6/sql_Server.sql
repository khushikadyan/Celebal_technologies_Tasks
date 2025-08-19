CREATE DATABASE EmployeeDB;
GO

USE EmployeeDB;

CREATE TABLE Employees (
    ID INT PRIMARY KEY,
    Name NVARCHAR(50),
    Role NVARCHAR(50),
    Salary INT
);

INSERT INTO Employees VALUES 
(1, 'Alice', 'Developer', 70000),
(2, 'Bob', 'Analyst', 60000),
(3, 'Charlie', 'Tester', 55000);
