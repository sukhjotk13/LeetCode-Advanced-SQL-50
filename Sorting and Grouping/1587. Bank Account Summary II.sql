WITH cte AS (
    SELECT account,SUM(amount) AS balance
    FROM Transactions
    GROUP BY account
    HAVING(SUM(amount))>10000
)
SELECT u.name AS name, c.balance AS balance
FROM cte c JOIN Users u
ON (c.account=u.account);
