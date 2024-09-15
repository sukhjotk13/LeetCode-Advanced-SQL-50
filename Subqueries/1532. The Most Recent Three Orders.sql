WITH most_recent AS (SELECT c.name AS customer_name,c.customer_id,o.order_id,o.order_date,
RANK() OVER (PARTITION BY c.customer_id ORDER BY o.order_date DESC) AS recent_date
FROM Customers c JOIN Orders o
ON (c.customer_id=o.customer_id))
SELECT customer_name,customer_id,order_id,order_date
FROM most_recent
WHERE recent_date<=3
ORDER BY customer_name,customer_id,order_date DESC;
