# Telco Customer Churn & Revenue Protection Analytics Dashboard 
![Dashboard Preview] (dashboard_preview.png)

## Executive Summary 
Analyzed customer behaviour, subscription contracts and billing data across 7,043 subscriber records to identify leading indicators of customer churn and quantify revenue risk.
---

## Tech Stack & Workflow
* **Microsoft Excel:** Data hygience, blank space imputation in `TotalCharges` and tenure cohort feature engineering (`TenureGroup`).
* **MySQL:** Relational Schema design, data type verification (`VARCHAR` for alphanumeric IDs), and aggregation logic.
* **Power BI Desktop:** Star schema structure, DAX measures for retention metrics, and interactive visual reporting.
---

## Business Metrics & DAX Formulas 
* **Total Customers:** `COUNTROWS('Telco_Customer')` $\rightarrow$ **7,043**
* **Churned Customers:** `CALCULATE(COUNTROWS('Telco_Customer'), 'Telco_Customer'[Churn] = "Yes")` $\rightarrow$ **1,869**
* **Overall Churn Rate:** `DIVIDE([Churned Customers], [Total Customers], 0)` $\rightarrow$ **26.5%**
* **Monthly Revenue at Risk:** `CALCULATE(SUM('Telco_Customer'[Monthly Charges]), 'Telco_Customer'[Churn] = "Yes")` $\rightarrow$ **$139.13K**
---

## Key Insights
* **Contract Vulnerability:** **Month-to-Month** contracts account for the highest churn exposure (**42.7%**), compared to **11.3%** for 1-year and **2.8%** for 2-year aggrement.
* **Tenure Drop-off:** Early lifecycle accounts (0-12 months) represent over **47%** of total churned volume.
* **Revenue Exposure:** Recurring monthly revenue at risk totals **$139,130** (~$1.67M annualized).
---

## Strategic Recommendations
1. **Contract Migration Campaigns:** Introduce targeted incentives (e.g., streaming service bundles or minor monthly discounts) to transition short-term users onto 1-year contracts.
2. **Early-Stage Retention Touchpoints:** Deploy structured automated email check-ins and support prompts between months 1-6.
3. **Payment Method Optimization:** Incentivized automated ACH/credit card payments over electronic or paper checks to minimize involuntary churn.
---

## Repository Structure
* `Telco_Customer`: Cleaned dataset with imputed charges and cohort groups.
* `Churn_Analysis.pbix`: Power BI report file with visual canvas, DAX measures and slicers.
* `Churn_database_schema.sql`: SQL queries used for table creation and verification.
