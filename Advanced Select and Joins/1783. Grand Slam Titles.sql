WITH cte AS (
SELECT year, 'Wimbledon' AS game, Wimbledon AS player_id FROM Championships
UNION 
SELECT year, 'Fr_open' AS game, Fr_open AS player_id FROM Championships
UNION
SELECT year, 'US_open' AS game, US_open AS player_id FROM Championships
UNION
SELECT year, 'Au_open' AS game, Au_open AS player_id FROM Championships)
SELECT p.player_id,p.player_name,COUNT(*) AS grand_slams_count
FROM Players p JOIN cte c
ON(p.player_id=c.player_id)
GROUP BY p.player_id;
