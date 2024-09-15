 WITH SeatGroups AS (
    SELECT 
        seat_id,
        free,
        LAG(free, 1) OVER (ORDER BY seat_id) AS prev_free,
        LEAD(free, 1) OVER (ORDER BY seat_id) AS next_free
    FROM Cinema
),
ConsecutiveSeats AS (
    SELECT
        seat_id
    FROM SeatGroups
    WHERE free = 1 
    AND ((prev_free = 1) OR
    (next_free = 1 ))
)
SELECT  DISTINCT seat_id
FROM ConsecutiveSeats
ORDER BY seat_id;
