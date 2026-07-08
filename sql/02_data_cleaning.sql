-- =====================================================
-- Customer Personality Data Cleaning Project
-- Phase 2: Data Cleaning
-- Author: Franco Flores
-- =====================================================
-- Objective:
-- Apply data cleaning transformations identified during
-- the data quality assessment.
-- =====================================================

-- ===========================================
-- Rule 1: Clean Marital_Status
-- ===========================================
-- Replace invalid categories:
-- - YOLO
-- - Absurd
-- with:
-- - Unknown

CREATE OR REPLACE TABLE `portafolio-data-analytics.customer_personality.customer_personality_clean` AS

SELECT
    ID,
    Year_Birth,
    Education,

    CASE
        WHEN Marital_Status IN ('YOLO', 'Absurd') THEN 'Unknown'
        ELSE Marital_Status
    END AS Marital_Status,

    Income,
    Kidhome,
    Teenhome,
    Dt_Customer,
    Recency,
    MntWines,
    MntFruits,
    MntMeatProducts,
    MntFishProducts,
    MntSweetProducts,
    MntGoldProds,
    NumDealsPurchases,
    NumWebPurchases,
    NumCatalogPurchases,
    NumStorePurchases,
    NumWebVisitsMonth,
    AcceptedCmp3,
    AcceptedCmp4,
    AcceptedCmp5,
    AcceptedCmp1,
    AcceptedCmp2,
    Complain,
    Z_CostContact,
    Z_Revenue,
    Response

FROM `portafolio-data-analytics.customer_personality.customer_personality.clean`;