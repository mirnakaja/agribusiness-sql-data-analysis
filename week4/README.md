# Week 4 – Reporting and Visualization for Agribusiness Insights

## Project Overview

This project focuses on the final stage of the agribusiness data analysis process: reporting, visualization, and communicating data-driven insights to non-technical stakeholders.

Using the maize production dataset analyzed in the previous weeks, SQL queries were used to extract important agribusiness performance information. The extracted results were then visualized using Power BI to identify production trends, compare country performance, and summarize key performance indicators.

The final findings and recommendations are documented in a comprehensive business report.

---

## Dataset

**Dataset:** Maize Production by Country

**Source:** Our World in Data – Food and Agriculture Organization (FAO)

**Period:** 1961–2024

**Unit:** Tonnes

The dataset contains maize production information across countries and years.

---

## Tools Used

- PostgreSQL
- pgAdmin 4
- SQL
- Power BI
- Microsoft Word
- GitHub

---

## Objectives

The main objectives of Week 4 are:

- Extract important business insights using SQL queries.
- Analyze maize production trends across years.
- Compare production performance between countries.
- Analyze India's maize production performance.
- Calculate and present key performance indicators.
- Create clear and understandable visualizations using Power BI.
- Communicate analytical findings to non-technical stakeholders.
- Develop strategic recommendations based on the analysis.

---

## Data Extraction

SQL queries were developed to extract the following information:

- Total maize production
- Average maize production
- Country-wise production
- Top 10 producing countries
- Year-wise production trends
- India's production trend
- Highest production year
- Lowest production year
- Average production by country

---

## Visualizations

Power BI was used to create the following visualizations:

### 1. KPI Summary

Displays important summary metrics such as:

- Total Production
- Average Production
- Total Production Records

### 2. Top 10 Maize Producing Countries

A bar chart is used to compare the total maize production of the top 10 producing countries.

### 3. Year-wise Maize Production Trend

A line chart is used to visualize changes in maize production over the years.

### 4. India Maize Production Trend

A line chart is used to analyze India's maize production performance across different years.

### 5. Average Production by Country

A bar chart is used to compare the average maize production across countries.

---

## Visualization Planning

Different visualization formats were selected based on the type of business question being addressed.

- **Bar charts** were used for country comparisons because they make differences between categories easy to identify.
- **Line charts** were used for yearly production because they clearly show trends and changes over time.
- **KPI cards** were used to provide a quick summary of important business metrics.

These visualizations help non-technical stakeholders understand production performance without requiring knowledge of SQL.

---

## Business Insights

The analysis helps identify:

- Countries with higher maize production.
- Changes in maize production over time.
- India's production trends.
- Years with relatively high or low production.
- Differences in average production between countries.

These insights can support agricultural planning, performance monitoring, and data-driven decision making.

---

## Strategic Recommendations

Based on the analysis, the following recommendations can be considered:

1. Use historical production trends to improve agricultural production planning and forecasting.

2. Monitor yearly production fluctuations to identify periods of significant performance changes.

3. Analyze lower-performing regions to identify opportunities for improving agricultural productivity.

4. Use SQL-based reporting for regular monitoring of agribusiness performance.

5. Develop an interactive Power BI dashboard in the future to allow stakeholders to filter production by country and year.

---

## Project Structure

```text
week4/
├── README.md
│
├── week4_reporting_visualization.sql
│
├── visualizations/
│   ├── kpi_summary.png
│   ├── top_10_producers.png
│   ├── yearly_production.png
│   ├── india_production.png
│   └── average_production.png
│
└── screenshots/
    ├── database_tables.png
    ├── kpi_query.png
    ├── country_production.png
    ├── yearly_query.png
    ├── india_query.png
    └── top_producers_query.png
