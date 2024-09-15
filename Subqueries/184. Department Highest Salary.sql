WITH cte AS (
    SELECT 
        d.id AS department_id, 
        d.name AS Department, 
        e.id AS employee_id, 
        e.name AS Employee, 
        e.salary AS Salary,
        DENSE_RANK() OVER (PARTITION BY d.id ORDER BY e.salary DESC) AS salary_rank
    FROM 
        Department d 
    JOIN 
        Employee e 
    ON 
        d.id = e.departmentId
)
SELECT 
    c.Department, 
    c.Employee, 
    c.Salary
FROM 
    cte c
WHERE 
    salary_rank = 1;
