/*Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.

Input Format

The STATION table is described as follows:


| Field       | Type    |
| ----------- | ------- |
| ID          | NUMBER  |
| NAME        | VARCHAR |
| COUNTRYCODE | VARCHAR |
| DISTRICT    | VARCHAR |
| POPULATION  | NUMBER  |


*/

use  celebal;

CREATE TABLE STATION (
    ID INT,
    CITY VARCHAR(21),
    STATE VARCHAR(2),
    LAT_N DECIMAL(10,6),
    LONG_W DECIMAL(10,6)
);

INSERT INTO STATION VALUES
(1, 'Austin', 'TX', 30.26715, -97.74306),
(2, 'Orlando', 'FL', 28.53834, -81.37924),
(3, 'Albany', 'NY', 42.65258, -73.75623),
(4, 'Eugene', 'OR', 44.05207, -123.08675),
(5, 'Indianapolis', 'IN', 39.76838, -86.15804);

select*from station;

SELECT DISTINCT CITY
FROM STATION
WHERE 
    LOWER(LEFT(CITY, 1)) IN ('a', 'e', 'i', 'o', 'u')
    AND LOWER(RIGHT(CITY, 1)) IN ('a', 'e', 'i', 'o', 'u');
   
