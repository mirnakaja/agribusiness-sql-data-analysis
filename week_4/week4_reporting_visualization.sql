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
    ROUND(AVG(cp.production_tonnes), 2) AS average_production_tonnes
FROM crop_production cp
JOIN countries c
    ON cp.country_id = c.country_id
WHERE c.country_code ~ '^[A-Z]{3}$'
GROUP BY c.country_name
ORDER BY average_production_tonnes DESC;

SELECT
    year,
    SUM(production_tonnes) AS total_production_tonnes
FROM crop_production
GROUP BY year
ORDER BY total_production_tonnes DESC
LIMIT 1;


SELECT
    year,
    SUM(production_tonnes) AS total_production_tonnes
FROM crop_production
GROUP BY year
ORDER BY total_production_tonnes ASC
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
WHERE c.country_code ~ '^[A-Z]{3}$'
GROUP BY c.country_name
ORDER BY total_production_tonnes DESC;

SELECT
    c.country_name,
    SUM(cp.production_tonnes) AS total_production_tonnes
FROM crop_production cp
JOIN countries c
    ON cp.country_id = c.country_id
WHERE c.country_code ~ '^[A-Z]{3}$'
GROUP BY c.country_name
ORDER BY total_production_tonnes DESC
LIMIT 10;


-- Lowest observed India production
SELECT
    c.country_name,
    cp.year,
    cp.production_tonnes
FROM crop_production cp
JOIN countries c
    ON cp.country_id = c.country_id
WHERE LOWER(c.country_name) = 'india'
ORDER BY cp.production_tonnes ASC
LIMIT 1;


-- Highest observed India production
SELECT
    c.country_name,
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
ORDER BY cp.year;


SELECT
    c.country_name,
    ROUND(AVG(cp.production_tonnes), 2) AS average_production_tonnes
FROM crop_production cp
JOIN countries c
    ON cp.country_id = c.country_id
WHERE c.country_code ~ '^[A-Z]{3}$'
GROUP BY c.country_name
ORDER BY average_production_tonnes DESC
LIMIT 10;


WITH yearly_production AS (
    SELECT
        year,
        SUM(production_tonnes) AS total_production_tonnes
    FROM crop_production
    GROUP BY year
)
SELECT
    year,
    total_production_tonnes,
    LAG(total_production_tonnes)
        OVER (ORDER BY year) AS previous_year_production,
    ROUND(
        (
            total_production_tonnes
            - LAG(total_production_tonnes)
                OVER (ORDER BY year)
        )
        * 100.0
        /
        NULLIF(
            LAG(total_production_tonnes)
                OVER (ORDER BY year),
            0
        ),
        2
    ) AS growth_percentage
FROM yearly_production
ORDER BY year;


SELECT
    COUNT(*) AS total_records,
    COUNT(*) FILTER (WHERE production_tonnes IS NULL)
        AS missing_production,
    COUNT(*) FILTER (WHERE year IS NULL)
        AS missing_year,
    COUNT(*) FILTER (WHERE country_id IS NULL)
        AS missing_country
FROM crop_production;


SELECT
    country_id,
    year,
    COUNT(*) AS record_count
FROM crop_production
GROUP BY country_id, year
HAVING COUNT(*) > 1;

SELECT
    COUNT(*) AS negative_production_records
FROM crop_production
WHERE production_tonnes < 0;

