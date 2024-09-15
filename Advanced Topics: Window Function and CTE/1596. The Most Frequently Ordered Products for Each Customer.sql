WITH customer_product AS (
    SELECT 
        c.customer_id,
        o.product_id,
        COUNT(o.order_id) AS cnt
    FROM 
        Customers c
    JOIN 
        Orders o
    ON 
        c.customer_id = o.customer_id
    GROUP BY 
        c.customer_id, 
        o.product_id
),
most_frequent AS (
    SELECT 
        customer_id,
        product_id,
        cnt,
        DENSE_RANK() OVER (PARTITION BY customer_id ORDER BY cnt DESC) AS freq_rank
    FROM 
        customer_product
)
SELECT 
    m.customer_id,
    m.product_id,
    p.product_name
FROM 
    most_frequent m
JOIN 
    Products p
ON 
    m.product_id = p.product_id
WHERE 
    m.freq_rank = 1;
