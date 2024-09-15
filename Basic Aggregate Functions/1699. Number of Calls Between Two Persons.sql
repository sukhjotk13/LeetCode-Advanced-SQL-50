WITH people AS (
    SELECT DISTINCT from_id AS id FROM Calls
    UNION
    SELECT DISTINCT to_id FROM Calls
),cross_join AS (
    SELECT p1.id AS from_id, p2.id AS to_id
    FROM people p1 CROSS JOIN people p2
    ON(p1.id<p2.id)
), summed_calls AS(
    SELECT from_id,to_id,COUNT(to_id) AS cnt,SUM(duration) AS dur_sum
    FROM Calls
    GROUP BY from_id,to_id
)
SELECT c1.from_id AS person1,c1.to_id person2,COALESCE(c2.cnt,0)+COALESCE(c3.cnt,0) AS call_count,COALESCE(c2.dur_sum,0)+COALESCE(c3.dur_sum,0) AS total_duration
FROM cross_join c1 LEFT JOIN summed_calls c2
ON(c1.from_id=c2.from_id AND c1.to_id=c2.to_id)
LEFT JOIN summed_calls c3
ON(c1.from_id=c3.to_id AND c1.to_id=c3.from_id)
WHERE COALESCE(c2.cnt,0)+COALESCE(c3.cnt,0)!=0;
