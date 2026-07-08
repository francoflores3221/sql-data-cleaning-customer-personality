# Customer Personality Data Cleaning using SQL

## Project Overview

This project focuses on performing a complete data quality assessment and data cleaning process using **Google BigQuery SQL**.

The objective was to analyze the dataset, identify data quality issues, document all findings, apply the necessary cleaning transformations, and validate the final cleaned dataset.

---

# Dataset

**Dataset:** Customer Personality Analysis

The dataset contains customer demographic information, purchasing behavior, campaign responses, and registration details.

**Total Records:** 2,240

**Total Columns:** 29

---

# Tools

- Google BigQuery
- SQL
- Visual Studio Code
- Git
- GitHub

---

# Project Workflow

The project was completed in four phases:

1. Data Quality Assessment
2. Findings Documentation
3. Data Cleaning
4. Data Validation

---

# Data Quality Assessment

The following checks were performed:

- Dataset overview
- Missing values
- Duplicate records
- Category consistency
- Outlier detection
- Date validation
- Numerical range validation

---

# Data Quality Issues Identified

During the assessment, four potential issues were identified:

- Missing values in the `Income` column.
- One potential outlier in `Income`.
- Unrealistic birth years.
- Invalid categories in `Marital_Status`.

Each issue was manually reviewed before deciding whether a cleaning action was necessary.

---

# Data Cleaning

Only one transformation was applied to the dataset.

### Marital_Status

The categories:

- YOLO
- Absurd

were replaced with:

- Unknown

No modifications were made to the remaining issues because there was insufficient evidence to determine the correct values.

---

# Validation

After the cleaning process, validation queries confirmed that:

- All 2,240 records were preserved.
- Invalid categories (`YOLO` and `Absurd`) were successfully removed.
- Four records were correctly converted to `Unknown`.

---

# Project Structure

```text
sql-data-cleaning-customer-personality/

│
├── README.md
├── findings.md
│
└── sql/
    ├── 01_data_quality_assessment.sql
    ├── 02_data_cleaning.sql
    └── 03_validation.sql
```

---

# Skills Demonstrated

This project demonstrates practical SQL skills including:

- Data Quality Assessment
- Data Cleaning
- Data Validation
- Data Profiling
- NULL Analysis
- Duplicate Detection
- Outlier Detection
- CASE Statements
- INFORMATION_SCHEMA
- Aggregate Functions
- BigQuery SQL

---

# Key Takeaways

A complete data quality assessment was conducted before applying any transformations.

Only one cleaning rule was implemented because the remaining issues lacked sufficient evidence for modification, demonstrating the importance of making data-driven cleaning decisions instead of altering data without justification.

---

# Author

**Franco Flores**

Aspiring Data Analyst | SQL | BigQuery | Python