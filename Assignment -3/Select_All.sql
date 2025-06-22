/*
Query all columns (attributes) for every row in the CITY table.
*/

create database celebal;
use celebal;

CREATE TABLE CITY (
    ID INT,
    NAME VARCHAR(17),
    COUNTRYCODE VARCHAR(3),
    DISTRICT VARCHAR(20),
    POPULATION INT
);

INSERT INTO CITY (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) 
VALUES (1661, 'Panipat', 'IND', 'Haryana', 294292);

INSERT INTO CITY (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) 
VALUES (1001, 'Mumbai', 'IND', 'Maharashtra', 12442373);

SELECT * FROM CITY;