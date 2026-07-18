---What is the overall churn rate?
SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END)/COUNT(*),
        2
    ) AS churn_rate
FROM telecom_churn;


--Which contract type has the highest churn?
SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(
        100.0 * SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END)/COUNT(*),
        2
    ) AS churn_rate
FROM telecom_churn
GROUP BY Contract
ORDER BY churn_rate DESC;

--Which internet service has the highest churn?
SELECT
    InternetService,
    COUNT(*) AS customers,
    SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(
        100.0 * SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END)/COUNT(*),
        2
    ) AS churn_rate
FROM telecom_churn
GROUP BY InternetService
ORDER BY churn_rate DESC;

--Which payment method has the highest churn?
SELECT
    PaymentMethod,
    COUNT(*) AS customers,
    SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(
        100.0 * SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END)/COUNT(*),
        2
    ) AS churn_rate
FROM telecom_churn
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;

--Rank customers by total charges
SELECT
    customerID,
    TotalCharges_num,
    RANK() OVER(
        ORDER BY TotalCharges_num DESC
    ) AS customer_rank
FROM telecom_churn;

--Average monthly charge of churned customers (CTE)
WITH churned_customers AS
(
    SELECT *
    FROM telecom_churn
    WHERE churn='Yes'
)
SELECT
    ROUND(AVG(MonthlyCharges),2) AS average_monthly_charge
FROM churned_customers;

--Customers paying above the average monthly charge (Subquery)
SELECT
    customerID,
    MonthlyCharges
FROM telecom_churn
WHERE MonthlyCharges >
(
    SELECT AVG(MonthlyCharges)
    FROM telecom_churn
);