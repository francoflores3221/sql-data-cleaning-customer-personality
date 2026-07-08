-- =====================================================
-- Customer Personality Data Cleaning Project
-- Phase 1: Data Quality Assessment
-- Author: Franco Flores
-- =====================================================
-- Objective:
-- Explore the dataset and identify potential data quality issues
-- before applying any cleaning transformations.
-- =====================================================


-- ===========================================
-- Dataset Overview
-- ===========================================

-- Total records

SELECT COUNT(*) AS total_records
FROM `portafolio-data-analytics.customer_personality.customer_personality`;

-- Total columns

SELECT COUNT(*) AS total_columns
FROM `portafolio-data-analytics.customer_personality.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'customer_personality';

-- Column names and data types

SELECT
    column_name,
    data_type
FROM `portafolio-data-analytics.customer_personality.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'customer_personality'
ORDER BY ordinal_position;


-- ===========================================
-- Customer ID
-- ===========================================

-- Check for duplicate customer IDs

SELECT
    ID,
    COUNT(*) AS duplicate_count
FROM `portafolio-data-analytics.customer_personality.customer_personality`
GROUP BY ID
HAVING COUNT(*) > 1;


-- ===========================================
-- Income
-- ===========================================

-- Check missing values

SELECT *
FROM `portafolio-data-analytics.customer_personality.customer_personality`
WHERE Income IS NULL;

-- Calculate percentage of missing values

SELECT
    COUNT(*) AS total_records,
    COUNTIF(Income IS NULL) AS missing_income,
    SAFE_DIVIDE(COUNTIF(Income IS NULL), COUNT(*)) * 100 AS missing_percentage
FROM `portafolio-data-analytics.customer_personality.customer_personality`;

-- Check negative values

SELECT *
FROM `portafolio-data-analytics.customer_personality.customer_personality`
WHERE Income < 0;

-- Summary statistics

SELECT
    MIN(Income) AS minimum_income,
    MAX(Income) AS maximum_income,
    AVG(Income) AS average_income
FROM `portafolio-data-analytics.customer_personality.customer_personality`;

-- Review highest income values

SELECT
    ID,
    Income
FROM `portafolio-data-analytics.customer_personality.customer_personality`
ORDER BY Income DESC
LIMIT 10;


-- ===========================================
-- Education
-- ===========================================

-- Review education categories

SELECT
    Education,
    COUNT(*) AS customer_count
FROM `portafolio-data-analytics.customer_personality.customer_personality`
GROUP BY Education
ORDER BY customer_count DESC;


-- ===========================================
-- Marital_Status
-- ===========================================

-- Review marital status categories

SELECT
    Marital_Status,
    COUNT(*) AS customer_count
FROM `portafolio-data-analytics.customer_personality.customer_personality`
GROUP BY Marital_Status
ORDER BY customer_count DESC;


-- ===========================================
-- Year_Birth
-- ===========================================

-- Review oldest customers based on registration year

SELECT
    ID,
    Year_Birth,
    EXTRACT(YEAR FROM Dt_Customer) - Year_Birth AS age_at_registration,
    Income,
    Education,
    Marital_Status
FROM `portafolio-data-analytics.customer_personality.customer_personality`
ORDER BY age_at_registration DESC
LIMIT 10;


-- ===========================================
-- Dt_Customer
-- ===========================================

-- Check missing values

SELECT *
FROM `portafolio-data-analytics.customer_personality.customer_personality`
WHERE Dt_Customer IS NULL;

-- Date range

SELECT
    MIN(Dt_Customer) AS oldest_date,
    MAX(Dt_Customer) AS newest_date
FROM `portafolio-data-analytics.customer_personality.customer_personality`;

-- Customer registrations by year

SELECT
    EXTRACT(YEAR FROM Dt_Customer) AS registration_year,
    COUNT(*) AS customer_count
FROM `portafolio-data-analytics.customer_personality.customer_personality`
GROUP BY registration_year
ORDER BY registration_year;


-- ===========================================
-- Kidhome
-- ===========================================

-- Validate Kidhome values

SELECT
    MIN(Kidhome) AS minimum_value,
    MAX(Kidhome) AS maximum_value
FROM `portafolio-data-analytics.customer_personality.customer_personality`;

SELECT DISTINCT Kidhome
FROM `portafolio-data-analytics.customer_personality.customer_personality`
ORDER BY Kidhome;

SELECT *
FROM `portafolio-data-analytics.customer_personality.customer_personality`
WHERE Kidhome < 0;


-- ===========================================
-- Teenhome
-- ===========================================

-- Validate Teenhome values

SELECT
    MIN(Teenhome) AS minimum_value,
    MAX(Teenhome) AS maximum_value
FROM `portafolio-data-analytics.customer_personality.customer_personality`;

SELECT DISTINCT Teenhome
FROM `portafolio-data-analytics.customer_personality.customer_personality`
ORDER BY Teenhome;

SELECT *
FROM `portafolio-data-analytics.customer_personality.customer_personality`
WHERE Teenhome < 0;