WITH list_of_employees AS (
    SELECT DISTINCT employee_id FROM Employees
    UNION
    SELECT DISTINCT employee_id FROM Salaries
)
SELECT l.employee_id 
FROM list_of_employees l LEFT JOIN Employees e
ON (l.employee_id=e.employee_id)
LEFT JOIN Salaries s
ON (l.employee_id=s.employee_id)
WHERE e.name IS NULL OR s.salary IS NULL
ORDER BY l.employee_id;
