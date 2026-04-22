DROP TABLE IF EXISTS case_death_table;

CREATE TABLE case_death_table AS

WITH combined AS (
    SELECT date, adm3_pcode, case_total, death_total
    FROM disease_fhsis_totals

    UNION ALL

    SELECT date, adm3_pcode, case_total, death_total
    FROM disease_lgu_disaggregated_totals

    UNION ALL

    SELECT date, adm3_pcode, case_total, 0
    FROM disease_pidsr_totals

    UNION ALL

    SELECT date, adm3_pcode, 0, death_total
    FROM disease_psa_totals
),

agg AS (
    SELECT 
        date, 
        adm3_pcode,
        SUM(case_total) AS case_count,
        SUM(death_total) AS death_count
    FROM combined
    GROUP BY date, adm3_pcode
)

SELECT
    c.uuid,
    COALESCE(a.case_count, 0) AS case_count,
    COALESCE(a.death_count, 0) AS death_count

FROM climate_air_quality c
JOIN location l 
    ON l.adm4_pcode = c.adm4_pcode

LEFT JOIN agg a 
    ON c.date = a.date 
   AND l.adm3_pcode = a.adm3_pcode
   
WHERE c.date >= '2022-10-01';
   
SELECT * FROM case_death_table;