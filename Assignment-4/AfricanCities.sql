/*Query the names of all cities where the CONTINENT is 'Africa'.*/

CREATE TABLE COUNTRY (
    CODE VARCHAR(3) PRIMARY KEY,
    NAME VARCHAR(50),
    CONTINENT VARCHAR(20)
);

INSERT INTO COUNTRY VALUES 
('EGY', 'Egypt', 'Africa'),
('ZAF', 'South Africa', 'Africa'),
('KEN', 'Kenya', 'Africa'),
('USA', 'United States', 'North America'),
('FRA', 'France', 'Europe');

CREATE TABLE CITY (
    ID INT PRIMARY KEY,
    NAME VARCHAR(50),
    COUNTRYCODE VARCHAR(3),
    DISTRICT VARCHAR(50), 
    POPULATION INT,
    FOREIGN KEY (COUNTRYCODE) REFERENCES COUNTRY(CODE)
);

INSERT INTO CITY VALUES
(1, 'Cairo', 'EGY', 'Cairo Governorate', 9500000),
(2, 'Johannesburg', 'ZAF', 'Gauteng', 4435000),
(3, 'Nairobi', 'KEN', 'Nairobi County', 4397000),
(4, 'Cape Town', 'ZAF', 'Western Cape', 3740000),
(5, 'Alexandria', 'EGY', 'Alexandria Governorate', 4870000),
(6, 'New York', 'USA', 'New York', 8419000),
(7, 'Paris', 'FRA', 'Île-de-France', 2148000),
(8, 'Mombasa', 'KEN', 'Mombasa County', 1200000);


SELECT CITY.NAME
FROM CITY
JOIN COUNTRY ON CITY.CountryCode = COUNTRY.Code
WHERE COUNTRY.CONTINENT = 'Africa'
ORDER BY CITY.NAME;
