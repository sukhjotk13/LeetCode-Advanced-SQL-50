WITH cte AS(
SELECT s.sales_id AS salesperson_id,s.name AS salesperson_name,o.com_id AS company_id,
c.name AS company_name,GROUP_CONCAT(DISTINCT c.name) AS companies
FROM SalesPerson s LEFT JOIN Orders o
ON (s.sales_id=o.sales_id)
LEFT JOIN Company c
ON (o.com_id=c.com_id)
GROUP BY s.sales_id
)
SELECT salesperson_name AS name
FROM cte
WHERE companies NOT LIKE '%RED%' OR companies LIKE '%TIRED%' OR companies IS NULL;
