WITH global AS (SELECT AVG(c.duration) AS global_avg
FROM Country ctry JOIN Person p
ON (ctry.country_code=SUBSTRING(p.phone_number,1,3))
JOIN Calls c
ON(p.id=c.caller_id OR p.id=c.callee_id))
-- Main Query
SELECT ctry.name AS country
FROM Country ctry JOIN Person p
ON (ctry.country_code=SUBSTRING(p.phone_number,1,3))
JOIN Calls c
ON(p.id=c.caller_id OR p.id=c.callee_id)
GROUP BY ctry.country_code
HAVING AVG(c.duration)> (SELECT global_avg FROM global);
