WITH max_min AS (
    -- Get the maximum and minimum score for each exam
    SELECT 
        exam_id,
        MAX(score) AS max_score,
        MIN(score) AS min_score
    FROM 
        Exam
    GROUP BY 
        exam_id
),
not_quiet_students AS (
    -- Identify students who scored either the maximum or minimum in any exam
    SELECT 
        e.student_id
    FROM 
        Exam e
    JOIN 
        max_min m ON e.exam_id = m.exam_id
    WHERE 
        e.score = m.max_score OR e.score = m.min_score
)
-- Select quiet students who are not in the 'not_quiet_students' list and have taken exams
SELECT 
    s.student_id,
    s.student_name
FROM 
    Student s
WHERE 
    student_id NOT IN (SELECT * FROM not_quiet_students)
    AND student_id IN (SELECT DISTINCT student_id FROM Exam);
