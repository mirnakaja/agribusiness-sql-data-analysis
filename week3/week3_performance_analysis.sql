SELECT COUNT(*)
FROM crop_production;

SELECT *
FROM crop_production
LIMIT 10;

CREATE TABLE operational_metrics (
    metric_id SERIAL PRIMARY KEY,
    country_id INT NOT NULL,
    crop_id INT NOT NULL,
    year INT NOT NULL,
    production_tonnes NUMERIC NOT NULL,
    cultivated_acres NUMERIC NOT NULL,
    operational_cost NUMERIC NOT NULL,

    FOREIGN KEY (country_id)
        REFERENCES countries(country_id),

    FOREIGN KEY (crop_id)
        REFERENCES crops(crop_id)
);


INSERT INTO operational_metrics
(
    country_id,
    crop_id,
    year,
    production_tonnes,
    cultivated_acres,
    operational_cost
)
SELECT
    country_id,
    crop_id,
    year,
    production_tonnes,
    ROUND(production_tonnes / 0.50),
    ROUND(production_tonnes * 180)
FROM crop_production
WHERE production_tonnes > 0;

SELECT *
FROM operational_metrics
LIMIT 10;

SELECT
    c.country_name,
    om.year,
    om.production_tonnes,
    om.cultivated_acres,
    ROUND(
        om.production_tonnes /
        NULLIF(om.cultivated_acres, 0),
        2
    ) AS production_efficiency
FROM operational_metrics om
JOIN countries c
    ON om.country_id = c.country_id
ORDER BY production_efficiency DESC;

SELECT
    c.country_name,
    om.year,
    ROUND(
        om.production_tonnes /
        NULLIF(om.cultivated_acres, 0),
        2
    ) AS yield_per_acre
FROM operational_metrics om
JOIN countries c
    ON om.country_id = c.country_id
ORDER BY yield_per_acre DESC;

SELECT
    c.country_name,
    om.year,
    om.operational_cost,
    om.production_tonnes,
    ROUND(
        om.operational_cost /
        NULLIF(om.production_tonnes, 0),
        2
    ) AS cost_per_tonne
FROM operational_metrics om
JOIN countries c
    ON om.country_id = c.country_id
ORDER BY cost_per_tonne;

SELECT
    c.country_name,
    SUM(om.production_tonnes) AS total_production_tonnes,
    ROUND(AVG(om.production_tonnes), 2)
        AS average_production_tonnes,
    SUM(om.cultivated_acres)
        AS total_cultivated_acres,
    SUM(om.operational_cost)
        AS total_operational_cost
FROM operational_metrics om
JOIN countries c
    ON om.country_id = c.country_id
GROUP BY c.country_name
ORDER BY total_production_tonnes DESC;


SELECT
    year,
    SUM(production_tonnes) AS total_production_tonnes
FROM operational_metrics
GROUP BY year
ORDER BY year;

SELECT
    c.country_name,
    om.year,
    om.production_tonnes,
    om.cultivated_acres,
    om.operational_cost,

    ROUND(
        om.production_tonnes /
        NULLIF(om.cultivated_acres, 0),
        2
    ) AS yield_per_acre,

    ROUND(
        om.operational_cost /
        NULLIF(om.production_tonnes, 0),
        2
    ) AS cost_per_tonne

FROM operational_metrics om

JOIN countries c
    ON om.country_id = c.country_id

WHERE c.country_name = 'India'

ORDER BY om.year;


SELECT
    c.country_name,
    SUM(om.production_tonnes)
        AS total_production_tonnes
FROM operational_metrics om
JOIN countries c
    ON om.country_id = c.country_id
GROUP BY c.country_name
ORDER BY total_production_tonnes DESC
LIMIT 10;


SELECT
    c.country_name,
    ROUND(
        AVG(om.production_tonnes),
        2
    ) AS average_production
FROM operational_metrics om
JOIN countries c
    ON om.country_id = c.country_id
GROUP BY c.country_name
ORDER BY average_production DESC;


SELECT
    year,
    SUM(production_tonnes)
        AS total_production_tonnes
FROM operational_metrics
GROUP BY year
ORDER BY total_production_tonnes DESC
LIMIT 1;


SELECT
    year,
    SUM(production_tonnes)
        AS total_production_tonnes
FROM operational_metrics
GROUP BY year
ORDER BY total_production_tonnes ASC
LIMIT 1;


SELECT
    c.country_name,
    ROUND(
        SUM(om.operational_cost) /
        NULLIF(SUM(om.production_tonnes), 0),
        2
    ) AS cost_per_tonne
FROM operational_metrics om
JOIN countries c
    ON om.country_id = c.country_id
GROUP BY c.country_name
ORDER BY cost_per_tonne ASC
LIMIT 10;


SELECT
    COUNT(*) AS total_records,

    ROUND(
        SUM(production_tonnes), 2
    ) AS total_production_tonnes,

    ROUND(
        AVG(production_tonnes), 2
    ) AS average_production_tonnes,

    ROUND(
        SUM(cultivated_acres), 2
    ) AS total_cultivated_acres,

    ROUND(
        SUM(operational_cost), 2
    ) AS total_operational_cost,

    ROUND(
        SUM(operational_cost) /
        NULLIF(SUM(production_tonnes), 0),
        2
    ) AS overall_cost_per_tonne

FROM operational_metrics;