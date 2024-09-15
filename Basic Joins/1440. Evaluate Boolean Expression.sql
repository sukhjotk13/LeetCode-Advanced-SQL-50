SELECT 
    e.left_operand,
    e.operator,
    e.right_operand,
    CASE 
        WHEN e.operator = '<' THEN
            CASE 
                WHEN lv.value < rv.value THEN 'true'
                ELSE 'false'
            END
        WHEN e.operator = '>' THEN
            CASE 
                WHEN lv.value > rv.value THEN 'true'
                ELSE 'false'
            END
        WHEN e.operator = '=' THEN
            CASE 
                WHEN lv.value = rv.value THEN 'true'
                ELSE 'false'
            END
    END AS value
FROM 
    Expressions e
JOIN 
    Variables lv ON e.left_operand = lv.name
JOIN 
    Variables rv ON e.right_operand = rv.name;
