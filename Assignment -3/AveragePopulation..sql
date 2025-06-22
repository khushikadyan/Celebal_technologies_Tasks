/*Average Population : Query the average population for all cities in CITY, rounded down to the nearest integer.*/

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

INSERT INTO CITY (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) 
VALUES (1002, 'Tokyo', 'JPN', 'Tokyo', 13929286);

INSERT INTO CITY (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) 
VALUES (1003, 'Delhi', 'IND', 'Delhi',29000000);

INSERT INTO CITY (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) 
VALUES (1004, 'shanghai', 'CHN', 'shanghai',26000000);

INSERT INTO CITY (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) VALUES
(4, 'São Paulo', 'BRA', 'São Paulo', 22000000),
(5, 'New York', 'USA', 'New York', 19000000),
(6, 'Paris', 'FRA', 'Île-de-France', 11000000);



SELECT FLOOR(AVG(POPULATION)) AS AveragePopulation
FROM CITY;