SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;


SELECT COUNT(*) AS total_records
FROM crop_production;

SELECT *
FROM crop_production
LIMIT 10;

SELECT
    COUNT(*) AS total_records,
    SUM(production_tonnes) AS total_production_tonnes,
    ROUND(AVG(production_tonnes), 2) AS average_production_tonnes
FROM crop_production;


SELECT
    c.country_name,
    SUM(cp.production_tonnes) AS total_production_tonnes
FROM crop_production cp
JOIN countries c
    ON cp.country_id = c.country_id
GROUP BY c.country_name
ORDER BY total_production_tonnes DESC;


SELECT
    c.country_name,
    SUM(cp.production_tonnes) AS total_production_tonnes
FROM crop_production cp
JOIN countries c
    ON cp.country_id = c.country_id
GROUP BY c.country_name
ORDER BY total_production_tonnes DESC
LIMIT 10;


SELECT
    year,
    SUM(production_tonnes) AS total_production_tonnes
FROM crop_production
GROUP BY year
ORDER BY year;


SELECT
    c.country_name,
    cp.year,
    cp.production_tonnes
FROM crop_production cp
JOIN countries c
    ON cp.country_id = c.country_id
WHERE LOWER(c.country_name) = 'india'
ORDER BY cp.year;


SELECT
    cp.year,
    cp.production_tonnes
FROM crop_production cp
JOIN countries c
    ON cp.country_id = c.country_id
WHERE LOWER(c.country_name) = 'india'
ORDER BY cp.production_tonnes DESC
LIMIT 1;

SELECT
    cp.year,
    cp.production_tonnes
FROM crop_production cp
JOIN countries c
    ON cp.country_id = c.country_id
WHERE LOWER(c.country_name) = 'india'
ORDER BY cp.production_tonnes ASC
LIMIT 1;

SELECT
    c.country_name,
    ROUND(AVG(cp.production_tonnes), 2) AS average_production_tonnes
FROM crop_production cp
JOIN countries c
    ON cp.country_id = c.country_id
GROUP BY c.country_name
ORDER BY average_production_tonnes DESC;


SELECT
    c.country_name,
    SUM(cp.production_tonnes) AS total_production_tonnes
FROM crop_production cp
JOIN countries c
    ON cp.country_id = c.country_id
GROUP BY c.country_name
ORDER BY total_production_tonnes DESC;