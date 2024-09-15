WITH cte AS (SELECT day,MAX(amount) AS amt
FROM Transactions
GROUP BY day)
SELECT DISTINCT t1.transaction_id
FROM Transactions t1 JOIN cte t2
ON (t1.day=t2.day
AND t1.amount=t2.amt)
ORDER BY transaction_id;
