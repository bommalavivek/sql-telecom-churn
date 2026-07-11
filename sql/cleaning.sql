--Find Blank Values
SELECT *
FROM telecom_churn
WHERE TotalCharges = ' ';

--Count Blank Values
SELECT COUNT(*) AS blank_totalcharges
FROM telecom_churn
WHERE TotalCharges = ' ';


--Convert Blank Spaces to NULL
UPDATE telecom_churn
SET TotalCharges = NULL
WHERE TRIM(TotalCharges) = '';


SELECT COUNT(*)
FROM telecom_churn
WHERE TotalCharges IS NULL;

UPDATE telecom_churn
SET TotalCharges_num = CAST(TotalCharges AS NUMERIC(10,2))
WHERE TotalCharges IS NOT NULL;



SELECT
    customerID,
    TotalCharges,
    TotalCharges_num
FROM telecom_churn
LIMIT 10;



--Analyze the Cleaned Data
--Average Total Charges
SELECT
    ROUND(AVG(TotalCharges_num),2) AS average_total_charges
FROM telecom_churn;


--Highest and Lowest Total Charges
SELECT
    MIN(TotalCharges_num) AS minimum_total_charge,
    MAX(TotalCharges_num) AS maximum_total_charge
FROM telecom_churn;

--Top 10 Highest Paying Customers
SELECT
    customerID,
    TotalCharges_num
FROM telecom_churn
ORDER BY TotalCharges_num DESC
LIMIT 10;
