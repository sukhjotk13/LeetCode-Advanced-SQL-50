SELECT 
    o.customer_id, c.name
FROM
    Orders o
        JOIN
    Product p ON (o.product_id = p.product_id)
        JOIN
    Customers c ON (o.customer_id = c.customer_id)
WHERE
    MONTH(o.order_date) IN (6 , 7)
        AND YEAR(o.order_date) = 2020
GROUP BY o.customer_id
HAVING SUM(CASE
    WHEN MONTH(o.order_date) = 6 THEN p.price * o.quantity
    ELSE 0
END) >= 100
    AND SUM(CASE
    WHEN MONTH(o.order_date) = 7 THEN p.price * o.quantity
    ELSE 0
END) >= 100;
