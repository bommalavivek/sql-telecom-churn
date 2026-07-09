SELECT COUNT(*)
FROM telecom_churn;

----How many customers left the company?
SELECT COUNT(*) AS churned_customers
FROM telecom_churn
WHERE churn = 'Yes';

--How many customers stayed?
SELECT COUNT(*) AS retained_customers
FROM telecom_churn
WHERE churn = 'No';

--"What percentage of customers left?"
SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM telecom_churn;

--How many customers are male and female?
SELECT gender, 
COUNT(*)  AS total_customers
FROM telecom_churn
GROUP BY gender;

--How many customers have each contract type?
SELECT contract,
    COUNT(*) AS customers
FROM telecom_churn
GROUP BY contract;


--Which internet service is most popular?
SELECT internetservice,
    COUNT(*) AS customers
FROM telecom_churn
GROUP BY internetservice;

--Average monthly bill
SELECT
    ROUND(AVG(monthlycharges),2) AS average_monthly_charge
FROM telecom_churn;

--Highest and Lowest Monthly Charge
SELECT
    MIN(monthlycharges) AS minimum_charge,
    MAX(monthlycharges) AS maximum_charge
FROM telecom_churn;