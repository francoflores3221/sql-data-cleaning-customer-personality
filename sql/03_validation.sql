-- =====================================================
-- Customer Personality Data Cleaning Project
-- Phase 3: Data Validation
-- Author: Franco Flores
-- =====================================================
-- Objective:
-- Validate that the cleaning transformations were
-- successfully applied.
-- =====================================================


-- ===========================================
-- Validation 1: Total Records
-- ===========================================
-- Verify that no records were lost during cleaning.

SELECT
    COUNT(*) AS total_records
FROM `portafolio-data-analytics.customer_personality.customer_personality_clean`;


-- ===========================================
-- Validation 2: Marital_Status Categories
-- ===========================================
-- Verify that invalid categories no longer exist.

SELECT
    Marital_Status,
    COUNT(*) AS customer_count
FROM `portafolio-data-analytics.customer_personality.customer_personality_clean`
GROUP BY Marital_Status
ORDER BY customer_count DESC;


-- ===========================================
-- Validation 3: Invalid Categories
-- ===========================================
-- Verify that YOLO and Absurd no longer exist.

SELECT *
FROM `portafolio-data-analytics.customer_personality.customer_personality_clean`
WHERE Marital_Status IN ('YOLO', 'Absurd');


-- ===========================================
-- Validation 4: Unknown Category
-- ===========================================
-- Verify that four records were converted to Unknown.

SELECT
    COUNT(*) AS unknown_records
FROM `portafolio-data-analytics.customer_personality.customer_personality_clean`
WHERE Marital_Status = 'Unknown';