/*Query the median of the Northern Latitudes (LAT_N) from STATION 

and round your answer to decimal places.*/


SELECT ROUND(AVG(LAT_N), 4) AS median_latitude
FROM (
    SELECT LAT_N,
           PERCENT_RANK() OVER (ORDER BY LAT_N) AS percentile
    FROM STATION
) AS t
WHERE percentile BETWEEN 0.4999 AND 0.5001;