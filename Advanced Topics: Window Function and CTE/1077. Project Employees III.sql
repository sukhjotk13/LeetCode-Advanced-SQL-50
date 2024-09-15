WITH cte AS (SELECT p.project_id, MAX(experience_years) AS max_exp
FROM Project p JOIN Employee e
ON (p.employee_id=e.employee_id)
GROUP BY p.project_id)
SELECT c.project_id,e1.employee_id
FROM cte c JOIN Project p1
ON (c.project_id=p1.project_id)
JOIN Employee e1
ON (c.max_exp=e1.experience_years
AND p1.employee_id=e1.employee_id);
