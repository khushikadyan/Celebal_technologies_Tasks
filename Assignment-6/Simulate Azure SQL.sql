CREATE DATABASE CloudDB;
GO

USE CloudDB;

CREATE TABLE EmployeesCloud (
    ID INT,
    Name NVARCHAR(50),
    Role NVARCHAR(50),
    Salary INT
);


/*   Simulate the Data Transfer (Extraction + Load)    */
INSERT INTO CloudDB.dbo.EmployeesCloud
SELECT * FROM EmployeeDB.dbo.Employees;
