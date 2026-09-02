CREATE DATABASE Projects;

USE Projects;
CREATE TABLE Telco_Customer(
Customer_ID VARCHAR(30) primary key,
Gender VARCHAR(10),
Senior_Citizen INT,
Partner VARCHAR(10),
Dependents VARCHAR(10),
Tenure INT,
Contract VARCHAR(20),
Paperless_Billing VARCHAR(10),
Payment_Method VARCHAR(50),
Monthly_Charges DECIMAL(10,2),
Total_Charges DECIMAL(10,2),
Churn VARCHAR(10),
Tenure_Group VARCHAR(20)
);

SELECT * FROM telco_customer;

SELECT * FROM telco_customer;

DROP TABLE IF EXISTS telco_customer;

-- Find total customers, churned customers, churn rate percentage and total monthly money lost?
SELECT 
COUNT(customer_id) AS Total_Customers,
SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
ROUND(100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(customer_id), 2) AS Churn_rate_pct,
ROUND(SUM(CASE WHEN churn = 'Yes' THEN Monthly_Charges ELSE 0 END), 2) AS Monthly_Revenue_Lost
FROM telco_customer;

-- Compare churn rates and average bills across Month-to-Month, 1-Year and 2-Years and contracts?
SELECT 
contract,
COUNT(customer_id) AS Customer_Count,
SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Count,
ROUND(100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(customer_id), 2) AS Churn_Rate_pct,
ROUND(AVG(Monthly_Charges), 2) AS Avg_Monthly_Charges
FROM telco_customer
GROUP BY contract
ORDER BY Churn_Rate_pct DESC;

-- Find out if customer leave early (0-1 year) or after staying a long time (4+ years)?
SELECT 
tenure_group,
COUNT(customer_id) AS Total_Count,
SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Count,
ROUND(100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(customer_id), 2) AS Churn_pct
FROM telco_customer
GROUP BY tenure_group
ORDER BY Churn_pct DESC;
 

