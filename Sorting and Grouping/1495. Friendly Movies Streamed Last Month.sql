SELECT DISTINCT
    c.title AS TITLE
FROM
    TVProgram t
        JOIN
    Content c ON (t.content_id = c.content_id)
WHERE
    c.Kids_content = 'Y'
        AND content_type = 'movies'
        AND YEAR(t.program_date) = 2020
        AND MONTH(t.program_date) = 6;
