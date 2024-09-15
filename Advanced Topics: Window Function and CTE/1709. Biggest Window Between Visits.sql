WITH next_dates AS (
    SELECT 
        user_id,
        visit_date,
        LEAD(visit_date, 1, '2021-01-01') OVER (PARTITION BY user_id ORDER BY visit_date) AS next_date
    FROM 
        UserVisits
),
windows AS (
    SELECT 
        user_id,
        DATEDIFF(next_date, visit_date) AS window_size
    FROM 
        next_dates
)
SELECT 
    user_id,
    MAX(window_size) AS biggest_window
FROM 
    windows
GROUP BY 
    user_id;
