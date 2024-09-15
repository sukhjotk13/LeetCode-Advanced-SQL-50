WITH combined AS (
    -- Combine the fail_date and success_date into a single table with corresponding states
    SELECT fail_date AS date, 'failed' AS state
    FROM Failed
    UNION
    SELECT success_date AS date, 'succeeded' AS state
    FROM Succeeded
),
ranked AS (
    -- Rank the dates by state to identify continuous intervals
    SELECT date,
           state,
           ROW_NUMBER() OVER (PARTITION BY state ORDER BY date) AS r
    FROM combined
),
difference AS (
    -- Calculate the grouping key for continuous intervals
    SELECT date,
           state,
           DATE_SUB(date, INTERVAL r DAY) AS grp
    FROM ranked
)
-- Aggregate by the computed grouping key to identify continuous intervals
SELECT state AS period_state,
       MIN(date) AS start_date,
       MAX(date) AS end_date
FROM difference
WHERE date BETWEEN '2019-01-01' AND '2019-12-31'
GROUP BY grp, state
ORDER BY start_date;
