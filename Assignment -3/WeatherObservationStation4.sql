/*Weather Observation Station 4 : Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.*/

CREATE TABLE STATION (
    ID INT,
    CITY VARCHAR(21),
    STATE VARCHAR(2),
    LAT_N FLOAT,
    LONG_W FLOAT
);

INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W) VALUES (1, 'New York', 'NY', 40.71, 74.00);
INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W) VALUES (2, 'New York', 'NY', 40.71, 74.00); 
INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W) VALUES (3, 'Boston', 'MA', 42.36, 71.05);
INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W) VALUES (4, 'Los Angeles', 'CA', 34.05, 118.24); 
INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W) VALUES (5, 'San Francisco', 'CA', 37.77, 122.42);
INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W) VALUES (6, 'A', 'TX', 31.00, 100.00); 
INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W) VALUES (7, 'Zebraopolis', 'ZZ', 45.00, 122.00);

SELECT COUNT(*) - COUNT(DISTINCT CITY) FROM STATION;
