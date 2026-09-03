SELECT *
FROM maize_production_clean
LIMIT 10;


CREATE TABLE countries (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL,
    country_code VARCHAR(20)
);


CREATE TABLE crops (
    crop_id SERIAL PRIMARY KEY,
    crop_name VARCHAR(100) NOT NULL
);


INSERT INTO crops (crop_name)
VALUES ('Maize');

SELECT *
FROM crops;


CREATE TABLE crop_production (
    production_id SERIAL PRIMARY KEY,
    country_id INT NOT NULL,
    crop_id INT NOT NULL,
    year INT NOT NULL,
    production_tonnes NUMERIC NOT NULL,

    FOREIGN KEY (country_id)
        REFERENCES countries(country_id),

    FOREIGN KEY (crop_id)
        REFERENCES crops(crop_id)
);

INSERT INTO countries (country_name, country_code)
SELECT DISTINCT
    country,
    country_code
FROM maize_production_clean
WHERE country IS NOT NULL;


SELECT *
FROM countries
ORDER BY country_name;

SELECT
    cp.production_id,
    c.country_name,
    c.country_code,
    cr.crop_name,
    cp.year,
    cp.production_tonnes
FROM crop_production cp
JOIN countries c
    ON cp.country_id = c.country_id
JOIN crops cr
    ON cp.crop_id = cr.crop_id
LIMIT 10;

SELECT
    c.country_name,
    cp.year,
    cp.production_tonnes
FROM crop_production cp
JOIN countries c
    ON cp.country_id = c.country_id
WHERE c.country_name = 'India'
ORDER BY cp.year;

SELECT
    c.country_name,
    cp.production_tonnes
FROM crop_production cp
JOIN countries c
    ON cp.country_id = c.country_id
WHERE cp.year = 2024
ORDER BY cp.production_tonnes DESC
LIMIT 10;

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
    ROUND(AVG(cp.production_tonnes), 2)
        AS average_annual_production
FROM crop_production cp
JOIN countries c
    ON cp.country_id = c.country_id
GROUP BY c.country_name
ORDER BY average_annual_production DESC;

SELECT
    c.country_name,
    cp.year,
    cp.production_tonnes
FROM crop_production cp
JOIN countries c
    ON cp.country_id = c.country_id
WHERE c.country_name = 'India'
ORDER BY cp.production_tonnes DESC
LIMIT 1;

SELECT
    c.country_name,
    cp.year,
    cp.production_tonnes
FROM crop_production cp
JOIN countries c
    ON cp.country_id = c.country_id
WHERE c.country_name = 'India'
ORDER BY cp.production_tonnes ASC
LIMIT 1;

SELECT
    c.country_name,
    COUNT(cp.production_id) AS number_of_records
FROM countries c
LEFT JOIN crop_production cp
    ON c.country_id = cp.country_id
GROUP BY c.country_name
ORDER BY number_of_records DESC;

SELECT
    cp.year,
    SUM(cp.production_tonnes) AS total_production_tonnes
FROM crop_production cp
GROUP BY cp.year
ORDER BY cp.year;

SELECT
    c.country_name,
    cp.production_tonnes
FROM crop_production cp
JOIN countries c
    ON cp.country_id = c.country_id
WHERE cp.year = 2024
  AND cp.production_tonnes > 1000000
ORDER BY cp.production_tonnes DESC;

SELECT
    c.country_name,
    ROUND(AVG(cp.production_tonnes), 2)
        AS average_production
FROM crop_production cp
JOIN countries c
    ON cp.country_id = c.country_id
GROUP BY c.country_name
ORDER BY average_production DESC
LIMIT 10;

