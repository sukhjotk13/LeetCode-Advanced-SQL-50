WITH most_recent AS (SELECT p.product_name,p.product_id,o.order_id,o.order_date,
RANK() OVER (PARTITION BY o.product_id ORDER BY o.order_date DESC) AS recent_date
FROM Products p JOIN Orders o
ON (p.product_id=o.product_id))
SELECT product_name,product_id,order_id,order_date
FROM most_recent
WHERE recent_date=1
ORDER BY product_name,product_id,order_id;
