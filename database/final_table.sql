DROP TABLE IF EXISTS cleaned_data;

CREATE TABLE cleaned_data AS

WITH agg AS (
    SELECT
        (SELECT label FROM pollutant_levels p 
         WHERE p.pollutant = 'pm25' AND phq2_raw.pm25 <= p.max_value
         ORDER BY p.max_value
         LIMIT 1) AS pm25,

        (SELECT label FROM pollutant_levels p 
         WHERE p.pollutant = 'pm10' AND phq2_raw.pm10 <= p.max_value
         ORDER BY p.max_value
         LIMIT 1) AS pm10,

        (SELECT label FROM pollutant_levels p 
         WHERE p.pollutant = 'no2' AND phq2_raw.no2 <= p.max_value
         ORDER BY p.max_value
         LIMIT 1) AS no2,

        (SELECT label FROM pollutant_levels p 
         WHERE p.pollutant = 'so2' AND phq2_raw.so2 <= p.max_value
         ORDER BY p.max_value
         LIMIT 1) AS so2,

        (SELECT label FROM pollutant_levels p 
         WHERE p.pollutant = 'co' AND phq2_raw.co <= p.max_value
         ORDER BY p.max_value
         LIMIT 1) AS co,

        (SELECT label FROM pollutant_levels p 
         WHERE p.pollutant = 'o3' AND phq2_raw.o3 <= p.max_value
         ORDER BY p.max_value
         LIMIT 1) AS o3,

        CASE 
            WHEN case_count > 0 THEN 'True'
            ELSE 'False'
        END AS new_case,
        
        CASE 
            WHEN death_count > 0 THEN 'True'
            ELSE 'False'
        END AS new_death

    FROM phq2_raw
)

SELECT *
FROM agg
WHERE pm25 IS NOT NULL
  AND pm10 IS NOT NULL
  AND no2 IS NOT NULL
  AND so2 IS NOT NULL
  AND co IS NOT NULL
  AND o3 IS NOT NULL;