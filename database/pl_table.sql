DROP TABLE IF EXISTS pollutant_levels;

CREATE TABLE pollutant_levels (
    pollutant TEXT,
    label TEXT,
    max_value REAL
);

INSERT INTO pollutant_levels (pollutant, label, max_value) VALUES

('pm25', 'AQG', 5),
('pm25', 'IT4', 10),
('pm25', 'IT3', 15),
('pm25', 'IT2', 25),
('pm25', 'IT1', 35),

('pm10', 'AQG', 15),
('pm10', 'IT4', 20),
('pm10', 'IT3', 30),
('pm10', 'IT2', 50),
('pm10', 'IT1', 70),

('no2', 'Trace', 0.50),
('no2', 'Moderate', 1.64),
('no2', 'Heavy', 999),

('co', 'Trace', 0.06),
('co', 'Moderate', 0.07),
('co', 'Heavy', 999),

('so2', 'Trace', 0.20),
('so2', 'Moderate', 0.52),
('so2', 'Heavy', 999),

('o3', 'Trace', 28.07),
('o3', 'Moderate', 33.22),
('o3', 'Heavy', 999);

SELECT * FROM pollutant_levels;