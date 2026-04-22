CREATE TABLE case_death_table AS 

WITH da_agg AS (
    SELECT uuid, SUM(case_total) AS case_total, SUM(death_total) AS death_total
    FROM disease_fhsis_totals
    GROUP BY uuid
),
db_agg AS (
    SELECT uuid, SUM(case_total) AS case_total, SUM(death_total) AS death_total
    FROM disease_lgu_disaggregated_totals
    GROUP BY uuid
),
dc_agg AS (
    SELECT uuid, SUM(case_total) AS case_total
    FROM disease_pidsr_totals
    GROUP BY uuid
),
dd_agg AS (
    SELECT uuid, SUM(death_total) AS death_total
    FROM disease_psa_totals
    GROUP BY uuid
)

SELECT
    m.uuid,

    COALESCE(da_agg.case_total, 0) 
  + COALESCE(db_agg.case_total, 0) 
  + COALESCE(dc_agg.case_total, 0) AS case_count,

    COALESCE(da_agg.death_total, 0) 
  + COALESCE(db_agg.death_total, 0) 
  + COALESCE(dd_agg.death_total, 0) AS death_count

FROM climate_air_quality m
LEFT JOIN da_agg ON m.uuid = da_agg.uuid
LEFT JOIN db_agg ON m.uuid = db_agg.uuid
LEFT JOIN dc_agg ON m.uuid = dc_agg.uuid
LEFT JOIN dd_agg ON m.uuid = dd_agg.uuid;