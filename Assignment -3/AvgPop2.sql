/*Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.*/

CREATE TABLE COUNTRY (
    CODE VARCHAR(3),
    NAME VARCHAR(44),
    CONTINENT VARCHAR(20)
);

INSERT INTO COUNTRY (CODE, NAME, CONTINENT) VALUES
('JPN', 'Japan', 'Asia'),
('IND', 'India', 'Asia'),
('BRA', 'Brazil', 'South America'),
('USA', 'United States', 'North America'),
('FRA', 'France', 'Europe');

/*city table already exist*/

SELECT co.Continent, FLOOR(AVG(ci.Population)) AS AvgCityPopulation
FROM CITY ci
JOIN COUNTRY co ON ci.CountryCode = co.Code
GROUP BY co.Continent;