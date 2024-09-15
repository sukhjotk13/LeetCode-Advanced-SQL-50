WITH managers_manager AS (
    SELECT 
        e.employee_id,
        e.employee_name,
        e.manager_id,
        e1.manager_id AS manager_1,
        e2.manager_id AS manager_2
    FROM 
        Employees e
    LEFT JOIN 
        Employees e1 ON e.manager_id = e1.employee_id
    LEFT JOIN 
        Employees e2 ON e1.manager_id = e2.employee_id
)
SELECT 
    employee_id
FROM 
    managers_manager
WHERE 
    (manager_id = 1 OR manager_1 = 1 OR manager_2 = 1)
    AND employee_id != 1;
