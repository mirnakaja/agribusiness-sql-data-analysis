# Week 1 – Agricultural Data Acquisition and Cleaning

This folder contains the SQL script and screenshots related to the Week 1 task.

# Agribusiness SQL Data Analysis

## Project Overview

This project focuses on agricultural data acquisition, cleaning, and preliminary transformation using PostgreSQL. The objective is to demonstrate how raw agricultural data can be imported into a relational database, checked for quality issues, cleaned using SQL, and prepared for further analysis.

## Dataset

**Dataset:** Maize Production by Country
**Source:** Our World in Data
**Underlying Source:** Food and Agriculture Organization (FAO)
**Data Format:** CSV
**Time Period:** 1961–2024
**Unit:** Tonnes

Dataset: https://ourworldindata.org/grapher/maize-production

The dataset contains maize production information for different countries and regions across multiple years. It is relevant to agribusiness because agricultural production data can be used to understand production trends, compare countries, and support data-driven agricultural decision-making.

## Tools Used

* PostgreSQL
* pgAdmin 4
* SQL
* GitHub
* CSV

## Project Objectives

The main objectives of this project are:

1. Acquire a publicly available agricultural dataset.
2. Import the dataset into PostgreSQL.
3. Inspect the raw data.
4. Identify missing and duplicate records.
5. Validate data values and data types.
6. Clean the dataset using SQL.
7. Perform preliminary data transformations.
8. Prepare the cleaned data for further analysis.

## Data Cleaning

The following data quality checks were performed using PostgreSQL:

* Missing value identification
* Duplicate record detection
* Invalid production value checking
* Year validation
* Country/entity validation
* Removal of incomplete or invalid records
* Trimming unnecessary spaces
* Handling empty country codes

The original dataset is preserved in a raw table, while a separate cleaned table is created for analysis.

## Preliminary Transformations

The following transformations are performed:

* Conversion of maize production from tonnes to million tonnes
* Filtering country-specific records
* Year-wise production analysis
* Identification of top maize-producing countries
* Creation of an analysis view for further use

## Project Structure

```text
agribusiness-sql-data-analysis/
│
├── README.md
│
├── data/
│   └── data.md
    ├── maize_production_analysis.sql
│
└── screenshots/
    ├── raw_data.png
    ├── null_check.png
    ├── duplicate_check.png
    ├── cleaned_data.png
    ├── india_data.png
    └── top_producers.png
```

## SQL Analysis

The SQL file contains queries for:

* Creating database tables
* Importing and inspecting agricultural data
* Checking missing values
* Checking duplicate records
* Validating data
* Creating the cleaned dataset
* Transforming production values
* Analysing India-specific data
* Identifying top producers

## Expected Outcome

The final cleaned dataset provides a structured and reliable foundation for further agricultural data analysis, visualization, reporting, and agribusiness decision-making.

## Author

**Mirna K**
