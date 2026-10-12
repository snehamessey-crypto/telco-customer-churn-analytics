# Telco Customer Churn & Revenue Protection Analytics

[![Tools](https://img.shields.io/badge/Tools-Excel%20%7C%20MySQL%20%7C%20Power%20BI-blue)](#tech-stack--workflow)
[![Domain](https://img.shields.io/badge/Domain-Telecom%20Retention-green)](#business-context--core-problem)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

---

## Executive Summary
Analyzed customer behavior, subscription contracts, and billing data across 7,043 subscriber records to identify leading indicators of customer churn and quantify recurring revenue risk. The analysis isolates critical drop-off points within early subscriber tenures and delivers an actionable retention playbook to protect annual recurring revenue.

### Key Performance Indicators
* **Total Customer Base:** 7,043 subscribers
* **Total Churned Customers:** 1,869 accounts
* **Overall Churn Rate:** 26.5%
* **Monthly Revenue at Risk:** $139.13K (~$1.67M annualized)

---

## Business Context & Core Problem
High attrition rates erode telecommunications customer lifetime value (CLV) and escalate acquisition overheads. Leadership requires visibility into subscriber loss drivers to shift from reactive handling to proactive retention.

* **Primary Business Questions:**
  1. Which customer segments and contract types demonstrate the highest propensity to churn?
  2. How much revenue is immediately exposed to cancellation risk?
  3. What interventions can mitigate attrition during vulnerable lifecycle stages?

---

## Tech Stack & Workflow
* **Microsoft Excel:** Data hygiene, blank space imputation in `TotalCharges`, and tenure cohort feature engineering (`TenureGroup`).
* **MySQL:** Relational schema design, data type verification (`VARCHAR` for alphanumeric IDs), aggregations, and cohort query logic.
* **Power BI Desktop:** Star-schema data modeling, custom DAX metrics, KPI cards, and dynamic visual dashboards.

### Core DAX Measures
* **Total Customers:** `COUNTROWS('Telco_Customer')`
* **Churned Customers:** `CALCULATE(COUNTROWS('Telco_Customer'), 'Telco_Customer'[Churn] = "Yes")`
* **Churn Rate:** `DIVIDE([Churned Customers], [Total Customers], 0)`
* **Monthly Revenue at Risk:** `CALCULATE(SUM('Telco_Customer'[Monthly Charges]), 'Telco_Customer'[Churn] = "Yes")`

---

## Key Analytical Insights
* **Contract Vulnerability:** Month-to-month contracts account for the highest churn exposure at **42.7%**, compared to **11.3%** for 1-year and **2.8%** for 2-year agreements.
* **Tenure Drop-Off:** Early lifecycle accounts (0–12 months tenure) represent over **47%** of total churn volume.
* **Revenue Exposure:** Recurring monthly revenue at risk totals **$139,130** (~$1.67M annualized), concentrated heavily in flexible contract cohorts.
* **Payment Method Friction:** Electronic check users exhibit disproportionately higher churn compared to subscribers enrolled in automated credit card or bank debit channels.

---

## Strategic Recommendations
1. **Contract Migration Campaigns:** Deploy targeted incentives (bundled value-adds or introductory annual pricing) to convert high-risk month-to-month subscribers into 1-year commitments.
2. **Early-Stage Retention Touchpoints:** Establish automated customer success onboarding and satisfaction check-ins between months 1 and 6 to stem the initial 47% drop-off.
3. **Payment Method Optimization:** Incentivize enrollment in automated ACH and credit card auto-pay to eliminate involuntary churn caused by payment failures.

---

## Repository Structure
```text
├── data/
│   └── Telco_Customer.csv            # Cleaned dataset with imputed charges & cohorts
├── sql/
│   └── Churn_database_schema.sql     # SQL schema setup, validation, and analytics queries
├── pbix/
│   └── Churn_Analysis.pbix           # Power BI report with data model & interactive visuals
├── docs/
│   └── dashboard_preview.png         # High-resolution dashboard screenshot
└── README.md
