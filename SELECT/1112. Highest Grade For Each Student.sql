WITH cte AS (
    SELECT student_id, 
           MAX(grade) AS max_grade
    FROM Enrollments
    GROUP BY student_id
),
student_course_grade AS (
    SELECT c.student_id, 
           e.course_id, 
           c.max_grade
    FROM cte c
    JOIN Enrollments e
        ON c.student_id = e.student_id
       AND c.max_grade = e.grade
)
SELECT student_id, 
       MIN(course_id) AS course_id, 
       MAX(max_grade) AS grade
FROM student_course_grade
GROUP BY student_id
ORDER BY student_id;
