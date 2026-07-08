# Customer Personality Data Quality Findings

## Project Overview

**Dataset:** Customer Personality Analysis (Kaggle)

This document summarizes the data quality assessment performed before the data cleaning process. Each column was validated to identify missing values, duplicates, invalid categories, outliers, and other potential data quality issues.

---

# Dataset Overview

- Total records: **2,240**
- Total columns: **29**

**Status:** ✅ Completed

---

# Income

## Objective

Evaluate the quality of the `Income` column.

## Validation

- Checked for missing values.
- Checked for negative values.
- Calculated minimum, maximum, and average values.
- Reviewed the highest income values to identify potential outliers.

## Findings

- Missing values were detected.
- No negative values were found.
- Minimum income: **1,730**
- Maximum income: **666,666**
- Average income: **52,247.25**
- One potential outlier was identified (**666,666**).

## Decision

- Missing values will be preserved because there is not enough information to infer the correct income.
- The outlier will also be preserved because there is no evidence that the value is incorrect.

## Status

🟡 Missing values preserved.  
🟡 Outlier preserved.

---

# Customer ID

## Objective

Verify whether duplicate customer IDs exist.

## Validation

The `ID` column was analyzed to detect duplicate records.

## Findings

- No duplicate IDs were found.

## Status

✅ No cleaning required.

---

# Education

## Objective

Review the consistency of the `Education` categories.

## Validation

Distinct values were analyzed.

## Findings

- Five education categories were identified.
- No spelling inconsistencies or duplicated categories were found.

## Status

✅ No cleaning required.

---

# Marital_Status

## Objective

Review the consistency of the `Marital_Status` categories.

## Validation

Distinct values were analyzed to identify unusual categories.

## Findings

- Eight categories were identified during the initial assessment.
- Two unusual categories were detected:
  - **YOLO** (2 records)
  - **Absurd** (2 records)

## Decision

Replace `YOLO` and `Absurd` with `Unknown` because their meaning cannot be reliably interpreted.

## Validation After Cleaning

- `YOLO`: **0** records
- `Absurd`: **0** records
- `Unknown`: **4** records

## Status

🟢 Cleaned.

---

# Year_Birth

## Objective

Validate customer birth years and identify unrealistic ages.

## Validation

Customer age was calculated using the customer's registration year (`Dt_Customer`) instead of the current year, ensuring that the analysis reflects the time period covered by the dataset.

## Findings

- The three highest ages at the time of customer registration were:
  - **121 years**
  - **114 years**
  - **113 years**
- These records were manually reviewed.
- No additional anomalies were found in `Income`, `Education`, or `Marital_Status`.

Although these ages are unusual, there is not enough evidence to conclude that the records are incorrect.

## Decision

The records will be preserved because there is no reliable information to determine the correct birth year.

## Status

🟡 Preserved after review.

---

# Dt_Customer

## Objective

Validate customer registration dates.

## Validation

- Checked for missing values.
- Calculated the oldest and most recent registration dates.
- Analyzed the number of registrations by year.

## Findings

- No missing values were found.
- Oldest date: **2012-07-30**
- Most recent date: **2014-06-29**

### Customer Registrations by Year

| Year | Customers |
|------|----------:|
| 2012 | 494 |
| 2013 | 1189 |
| 2014 | 557 |

## Conclusion

The dataset contains customer registrations between **2012** and **2014**.

The highest number of customer registrations occurred in **2013**.

## Status

✅ No cleaning required.

---

# Kidhome

## Objective

Validate the `Kidhome` column.

## Validation

- Checked minimum value.
- Checked maximum value.
- Reviewed distinct values.
- Checked for negative values.

## Findings

- Minimum value: **0**
- Maximum value: **2**
- Distinct values: **0, 1, 2**
- No negative values were found.

## Status

✅ No cleaning required.

---

# Teenhome

## Objective

Validate the `Teenhome` column.

## Validation

- Checked minimum value.
- Checked maximum value.
- Reviewed distinct values.
- Checked for negative values.

## Findings

- Minimum value: **0**
- Maximum value: **2**
- Distinct values: **0, 1, 2**
- No negative values were found.

## Status

✅ No cleaning required.

---

# Summary

A complete data quality assessment was performed on the **Customer Personality Analysis** dataset.

The assessment identified four main data quality issues:

- Missing values in the `Income` column.
- One potential outlier in `Income`.
- Unrealistic birth years in `Year_Birth`.
- Two invalid categories in `Marital_Status`.

After reviewing each issue:

- `Marital_Status` values (`YOLO` and `Absurd`) were replaced with `Unknown`.
- Missing values in `Income` were preserved because there was not enough information to reliably infer the correct values.
- The income outlier was preserved because there is no evidence that it is incorrect.
- Unrealistic birth years were documented but not modified because there is insufficient evidence to determine the correct values.

Overall, the dataset presents **good data quality**, and only one transformation (`Marital_Status`) was required during the data cleaning process.