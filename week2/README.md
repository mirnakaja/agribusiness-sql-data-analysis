# Week 2 – Data Modeling and SQL Query Development for Agribusiness

This folder contains the SQL database model, relational schema, ER diagram, and analytical SQL queries developed for the Week 2 task.

# Agribusiness SQL Data Analysis

## Project Overview

This project focuses on designing a relational database model and developing SQL queries for agribusiness analysis using PostgreSQL. The same maize production dataset used in Week 1 is used as the foundation for the Week 2 database model.

The objective is to transform the cleaned agricultural dataset into a structured relational database consisting of separate tables for countries, crops, and crop production. Primary keys and foreign keys are used to establish relationships between the tables. SQL queries are then developed to answer common agribusiness questions related to crop production, country performance, production trends, and comparisons.

## Dataset

**Dataset:** Maize Production by Country  
**Source:** Our World in Data  
**Underlying Source:** Food and Agriculture Organization (FAO)  
**Data Format:** CSV  
**Time Period:** 1961–2024  
**Unit:** Tonnes  

Dataset: https://ourworldindata.org/grapher/maize-production

The dataset contains annual maize production information for different countries and regions. The dataset is relevant to agribusiness because production data can be used to compare agricultural performance, identify major producers, analyse production trends, and support data-driven agricultural decision-making.

## Tools Used

* PostgreSQL
* pgAdmin 4
* SQL
* GitHub
* CSV

## Project Objectives

The main objectives of this project are:

1. Design a relational database model for agricultural production data.
2. Identify the entities and relationships required for agribusiness analysis.
3. Create tables using PostgreSQL.
4. Define primary keys and foreign keys.
5. Populate the relational tables using the cleaned Week 1 dataset.
6. Establish relationships between countries, crops, and production records.
7. Develop SQL queries for common agribusiness business questions.
8. Analyse country-wise and year-wise maize production.
9. Identify top maize-producing countries.
10. Prepare the database model for further analysis and reporting.

## Requirements Gathering

The database model is designed to support common agribusiness analytical requirements.

The main business requirements include:

* Storing country information.
* Storing crop information.
* Recording annual crop production.
* Comparing maize production between countries.
* Analysing production by year.
* Identifying top-producing countries.
* Calculating total and average production.
* Analysing country-specific production such as India.
* Supporting future agricultural reporting and visualization.

## Database Schema

The Week 2 database consists of three main relational tables:

### 1. Countries

The `countries` table stores unique country or entity information.

**Columns:**

* `country_id` – Primary Key
* `country_name` – Name of the country or entity
* `country_code` – Country or entity code

### 2. Crops

The `crops` table stores information about agricultural crops.

**Columns:**

* `crop_id` – Primary Key
* `crop_name` – Name of the crop

The current model contains Maize as the crop used for analysis.

### 3. Crop Production

The `crop_production` table stores annual production records.

**Columns:**

* `production_id` – Primary Key
* `country_id` – Foreign Key referencing the Countries table
* `crop_id` – Foreign Key referencing the Crops table
* `year` – Production year
* `production_tonnes` – Production quantity in tonnes

## Primary Keys and Foreign Keys

Primary keys are used to uniquely identify records in each table.

The following primary keys are defined:

* `countries.country_id`
* `crops.crop_id`
* `crop_production.production_id`

Foreign keys are used to establish relationships between tables.

The following foreign keys are defined:

* `crop_production.country_id` references `countries.country_id`
* `crop_production.crop_id` references `crops.crop_id`

These relationships help maintain data consistency and reduce unnecessary duplication.

## Entity Relationship Diagram

The Entity Relationship Diagram represents the relationships between the three tables in the agribusiness database.

The `countries` table has a one-to-many relationship with the `crop_production` table because one country can have multiple production records across different years.

The `crops` table also has a one-to-many relationship with the `crop_production` table because one crop can have multiple production records for different countries and years.

The ER diagram is available in the `er_diagram` folder.

## Data Modeling

The cleaned maize production dataset from Week 1 is converted into a relational structure.

Instead of storing country names and crop names repeatedly in every production record, separate reference tables are created for countries and crops.

The `crop_production` table uses foreign keys to connect these reference tables. This improves organization, reduces data redundancy, and makes the database easier to maintain and analyse.

## Database Implementation

The database model was implemented using PostgreSQL.

The following operations were performed:

* Created the `countries` table.
* Created the `crops` table.
* Created the `crop_production` table.
* Defined primary keys.
* Defined foreign key relationships.
* Inserted unique country information.
* Inserted crop information.
* Populated production records from the cleaned Week 1 dataset.
* Verified relationships using SQL JOIN operations.

## SQL Query Development

SQL queries were developed to answer typical agribusiness business questions.

The analysis includes:

* Retrieving India's maize production by year.
* Identifying the top maize-producing countries.
* Calculating total production by country.
* Calculating average annual production.
* Finding India's highest production record.
* Finding India's lowest production record.
* Counting production records by country.
* Calculating total production by year.
* Identifying countries producing more than one million tonnes.
* Ranking countries based on average production.

## Business Questions

The following business questions are addressed using SQL:

### Question 1

What is India's maize production by year?

### Question 2

Which countries produced the most maize in 2024?

### Question 3

What is the total maize production for each country?

### Question 4

What is the average annual maize production for each country?

### Question 5

What is India's highest recorded maize production?

### Question 6

What is India's lowest recorded maize production?

### Question 7

How many production records are available for each country?

### Question 8

What is the total maize production for each year?

### Question 9

Which countries produced more than one million tonnes of maize in 2024?

### Question 10

Which countries have the highest average maize production?

## SQL JOIN Operations

SQL JOIN operations are used to combine information from multiple tables.

For example, the `crop_production` table is joined with the `countries` and `crops` tables to display meaningful country names, crop names, production years, and production quantities.

This demonstrates how relational database structures can be used to retrieve integrated information for analysis.

## Agribusiness Applications

The database model can support several agribusiness use cases, including:

* Monitoring agricultural production.
* Comparing crop performance between countries.
* Identifying major producing countries.
* Analysing historical production trends.
* Supporting agricultural planning.
* Preparing data for dashboards and visualization.
* Supporting future forecasting and predictive analysis.
* Providing structured data for business reporting.

## SQL Efficiency and Optimization

The database model separates country, crop, and production information into related tables to reduce unnecessary data duplication.

Primary keys provide unique identification of records, while foreign keys maintain relationships between tables.

SQL JOIN operations are used to retrieve related information when required. Filtering with `WHERE`, grouping with `GROUP BY`, sorting with `ORDER BY`, and limiting results with `LIMIT` are used to efficiently retrieve relevant analytical results.

For larger datasets, indexes can also be added to frequently queried columns such as foreign keys, country names, and years to improve query performance.

## Challenges Encountered

The following challenges were considered during the database modeling and query development process:

### Challenge 1 – Designing the relational structure

The original agricultural dataset contains country, crop, year, and production information in a single structure. The data needed to be divided into logical relational tables.

### Challenge 2 – Maintaining relationships

Foreign keys were used to ensure that production records are connected to valid countries and crops.

### Challenge 3 – Populating relational tables

The cleaned Week 1 dataset was used to populate the new relational tables using SQL INSERT and JOIN operations.

### Challenge 4 – Writing analytical queries

SQL queries were designed to answer practical agribusiness questions using filtering, aggregation, grouping, sorting, and JOIN operations.

### Challenge 5 – Avoiding data redundancy

Separate country and crop tables were created to reduce repeated values in the production table.

## Project Structure

```text
week2/
│
├── README.md
│
├── week2_database_model.sql
│
├── er_diagram/
│   └── agribusiness_er_diagram.png
│
└── screenshots/
    ├── countries_table.png
    ├── crops_table.png
    ├── crop_production_table.png
    ├── populated_countries.png
    ├── populated_production.png
    ├── joined_data.png
    ├── india_production.png
    ├── top_producers.png
    ├── country_summary.png
    ├── average_production.png
    └── yearly_production.png
