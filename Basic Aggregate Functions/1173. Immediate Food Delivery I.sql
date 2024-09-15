WITH cte AS(
    SELECT delivery_id,customer_id,(
        CASE WHEN order_date<customer_pref_delivery_date THEN 'scheduled'
        ELSE 'immediate' END
    ) AS status
    FROM Delivery
),counts AS (
    SELECT COUNT(delivery_id) AS req_cnt
    FROM cte
    WHERE status='immediate'
)
SELECT ROUND(100.0*req_cnt/(SELECT COUNT(*) FROM Delivery),2) AS immediate_percentage
FROM counts;
