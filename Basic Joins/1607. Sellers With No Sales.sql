WITH cte AS(
SELECT s.seller_name AS seller,o.sale_date,GROUP_CONCAT(DISTINCT o.sale_date ORDER BY s.seller_id) AS dates
FROM Seller s LEFT JOIN Orders o
ON (s.seller_id=o.seller_id)
GROUP BY s.seller_id
)
SELECT seller AS SELLER_NAME FROM cte
WHERE dates NOT LIKE '%2020%' OR dates IS NULL
ORDER BY seller;
