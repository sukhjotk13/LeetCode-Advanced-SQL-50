WITH cte AS(SELECT c.customer_id,c.customer_name,o.product_name, GROUP_CONCAT(o.product_name ORDER BY o.product_name) AS products
FROM Customers c JOIN Orders o
ON (c.customer_id=o.customer_id)
GROUP BY customer_id)
SELECT customer_id,customer_name 
FROM cte 
WHERE products LIKE '%A%'      -- Contains 'A'
  AND products LIKE '%B%'      -- Contains 'B'
  AND products NOT LIKE '%C%' -- Does not contain 'C'
ORDER BY customer_id;
