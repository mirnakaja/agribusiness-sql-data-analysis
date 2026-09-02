CREATE TABLE maize_production_raw (
    entity VARCHAR(100),
    code VARCHAR(20),
    year INT,
    maize_production NUMERIC
);

SELECT *
FROM maize_production_raw
LIMIT 10;

SELECT COUNT(*) AS total_records
FROM maize_production_raw;


SELECT MIN(year) AS first_year,
       MAX(year) AS last_year
FROM maize_production_raw;


SELECT
    COUNT(*) AS total_rows,
    COUNT(entity) AS entity_values,
    COUNT(code) AS code_values,
    COUNT(year) AS year_values,
    COUNT(maize_production) AS production_values
FROM maize_production_raw;


SELECT *
FROM maize_production_raw
WHERE entity IS NULL
   OR year IS NULL
   OR maize_production IS NULL;


SELECT
    entity,
    code,
    year,
    COUNT(*) AS duplicate_count
FROM maize_production_raw
GROUP BY entity, code, year
HAVING COUNT(*) > 1;


SELECT *
FROM maize_production_raw
WHERE maize_production < 0;


SELECT DISTINCT entity
FROM maize_production_raw
ORDER BY entity;


CREATE TABLE maize_production_clean AS
SELECT
    TRIM(entity) AS country,
    NULLIF(TRIM(code), '') AS country_code,
    year,
    maize_production
FROM maize_production_raw
WHERE entity IS NOT NULL
  AND year IS NOT NULL
  AND maize_production IS NOT NULL
  AND maize_production >= 0;



SELECT *
FROM maize_production_clean
LIMIT 10;

SELECT COUNT(*) AS clean_records
FROM maize_production_clean;

SELECT COUNT(*) AS raw_records
FROM maize_production_raw;

SELECT
    country,
    country_code,
    year,
    maize_production,
    ROUND(maize_production / 1000000.0, 2) AS production_million_tonnes
FROM maize_production_clean;


SELECT *
FROM maize_production_clean
WHERE country = 'India'
ORDER BY year;


SELECT
    country,
    maize_production
FROM maize_production_clean
WHERE year = 2024
ORDER BY maize_production DESC
LIMIT 10;


SELECT
    country,
    ROUND(SUM(maize_production) / 1000000.0, 2)
        AS total_production_million_tonnes
FROM maize_production_clean
GROUP BY country
ORDER BY total_production_million_tonnes DESC
LIMIT 10;

SELECT
    year,
    ROUND(SUM(maize_production) / 1000000.0, 2)
        AS total_production_million_tonnes
FROM maize_production_clean
WHERE country = 'World'
GROUP BY year
ORDER BY year;

CREATE VIEW maize_production_analysis AS
SELECT
    country,
    country_code,
    year,
    maize_production,
    ROUND(maize_production / 1000000.0, 2)
        AS production_million_tonnes
FROM maize_production_clean;


SELECT *
FROM maize_production_analysis
LIMIT 10;

