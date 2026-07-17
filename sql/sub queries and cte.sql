--Subquery
SELECT
    customerID,
    MonthlyCharges
FROM telecom_churn
WHERE MonthlyCharges >
(
    SELECT AVG(MonthlyCharges)
    FROM telecom_churn
);


---Count Those Customers
SELECT COUNT(*) AS customers_above_average
FROM telecom_churn
WHERE MonthlyCharges >
(
    SELECT AVG(MonthlyCharges)
    FROM telecom_churn
);


--CTE(Common Table Expression)

WITH churned_customers AS
(
    SELECT *
    FROM telecom_churn
    WHERE churn = 'Yes'
)
SELECT
    COUNT(*) AS total_churned
FROM churned_customers;


WITH churned_customers AS
(
    SELECT *
    FROM telecom_churn
    WHERE churn = 'Yes'
)
SELECT
    ROUND(AVG(MonthlyCharges),2) AS avg_charge
FROM churned_customers;



WITH long_term_customers AS
(
    SELECT *
    FROM telecom_churn
    WHERE tenure >= 24
)
SELECT
    COUNT(*) AS customers
FROM long_term_customers;