DROP TABLE IF EXISTS phq2_raw;

CREATE TABLE phq2_raw AS

SELECT DISTINCT
    c.uuid,
    l.adm3_pcode,
    c.date,
    c.no2,
    c.co,
    c.so2,
    c.o3,
    c.pm10,
    c.pm25,
	cd.case_count,
	cd.death_count

FROM climate_air_quality c
INNER JOIN location l ON l.adm4_pcode = c.adm4_pcode
LEFT JOIN case_death_table cd ON c.uuid = cd.uuid
   
WHERE c.date >= '2022-10-01';

SELECT * FROM phq2_raw LIMIT 10;
