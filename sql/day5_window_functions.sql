--ROW_NUMBER()
SELECT
    customerID,
    MonthlyCharges,
    ROW_NUMBER() OVER (ORDER BY MonthlyCharges DESC) AS row_num
FROM telecom_churn;


--RANK()
SELECT
    customerID,
    MonthlyCharges,
    RANK() OVER (ORDER BY MonthlyCharges DESC) AS customer_rank
FROM telecom_churn;

--DENSE_RANK()
SELECT
    customerID,
    MonthlyCharges,
    DENSE_RANK() OVER (ORDER BY MonthlyCharges DESC) AS customer_rank
FROM telecom_churn;

--PARTITION BY
SELECT
    customerID,
    gender,
    MonthlyCharges,
    AVG(MonthlyCharges) OVER(PARTITION BY gender) AS avg_gender_charge
FROM telecom_churn;