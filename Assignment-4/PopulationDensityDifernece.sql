/*Query the difference between the maximum and minimum populations in CITY.

Input Format-

| Field       | Type    |
| ----------- | ------- |
| ID          | NUMBER  |
| NAME        | VARCHAR |
| COUNTRYCODE | VARCHAR |
| DISTRICT    | VARCHAR |
| POPULATION  | NUMBER  |


*/
CREATE TABLE CITY (
    ID INT PRIMARY KEY,
    NAME VARCHAR(50),
    COUNTRYCODE VARCHAR(3),
    DISTRICT VARCHAR(50),  
    POPULATION INT,
);

INSERT INTO CITY VALUES
(1, 'Cairo', 'EGY', 'Cairo Governorate', 9500000),
(2, 'Johannesburg', 'ZAF', 'Gauteng', 4435000),
(3, 'Nairobi', 'KEN', 'Nairobi County', 4397000),
(4, 'Cape Town', 'ZAF', 'Western Cape', 3740000),
(5, 'Alexandria', 'EGY', 'Alexandria Governorate', 4870000);

select*from city;
SELECT MAX(POPULATION) - MIN(POPULATION) AS population_difference
FROM CITY;
