SELECT
    t.customerID,
    t.gender,
    t.monthlycharges,
    s.support_tickets,
    s.satisfaction_score
FROM telecom_churn t
INNER JOIN customer_support s
ON t.customerID = s.customerID;



SELECT
    t.customerID,
    t.gender,
    s.support_tickets,
    s.satisfaction_score
FROM telecom_churn t
LEFT JOIN customer_support s
ON t.customerID = s.customerID;


SELECT
    t.customerID,
    t.gender,
    s.support_tickets,
    s.satisfaction_score
FROM telecom_churn t
RIGHT JOIN customer_support s
ON t.customerID = s.customerID;



SELECT
    t.customerID,
    t.gender,
    s.support_tickets,
    s.satisfaction_score
FROM telecom_churn t
FULL OUTER JOIN customer_support s
ON t.customerID = s.customerID;



---Do customers with more support tickets have lower satisfaction
SELECT
    support_tickets,
    AVG(satisfaction_score) AS avg_satisfaction
FROM customer_support
GROUP BY support_tickets
ORDER BY support_tickets;