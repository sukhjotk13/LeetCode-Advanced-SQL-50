WITH cte AS (
    SELECT team_id,COUNT(employee_id) AS team_size
    FROM Employee
    GROUP BY team_id
)
SELECT e.employee_id,c.team_size
FROM Employee e JOIN cte c
ON (e.team_id=c.team_id);
