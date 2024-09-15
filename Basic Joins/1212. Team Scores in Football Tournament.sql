WITH cte AS((SELECT t1.team_id AS team_id,t1.team_name AS team_name,COALESCE((CASE WHEN m1.host_goals>m1.guest_goals THEN 3
WHEN m1.host_goals<m1.guest_goals THEN 0
WHEN m1.host_goals=m1.guest_goals THEN 1 END),0) AS points
FROM Teams t1 LEFT JOIN Matches m1
ON (t1.team_id=m1.host_team)
)
UNION ALL
(
SELECT t2.team_id AS team_id,t2.team_name AS team_name,COALESCE((CASE WHEN m2.host_goals<m2.guest_goals THEN 3
WHEN m2.host_goals>m2.guest_goals THEN 0
WHEN m2.host_goals=m2.guest_goals THEN 1 END),0) AS points
FROM Teams t2  LEFT JOIN Matches m2
ON (t2.team_id=m2.guest_team)
))
SELECT team_id,team_name,SUM(points) AS num_points
FROM cte
GROUP BY team_id
ORDER BY num_points DESC,team_id;
