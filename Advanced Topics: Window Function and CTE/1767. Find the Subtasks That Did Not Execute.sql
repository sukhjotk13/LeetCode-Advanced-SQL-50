WITH RECURSIVE subtasks AS (
    -- Recursive CTE to generate subtask_ids from 1 to 20
    SELECT 1 AS subtask_id
    UNION ALL
    SELECT subtask_id + 1
    FROM subtasks
    WHERE subtask_id < 20
),
all_subtasks AS (
    -- Join the generated subtask_ids with the tasks to create all possible task-subtask combinations
    SELECT 
        t.task_id,
        sub.subtask_id
    FROM 
        Tasks t 
    JOIN 
        subtasks sub
    ON 
        sub.subtask_id <= t.subtasks_count
)
-- Find all subtasks that haven't been executed yet
SELECT 
    t1.task_id,
    t1.subtask_id
FROM 
    all_subtasks t1 
LEFT JOIN 
    Executed e ON t1.task_id = e.task_id
    AND t1.subtask_id = e.subtask_id
WHERE 
    e.subtask_id IS NULL
ORDER BY 
    t1.task_id;
