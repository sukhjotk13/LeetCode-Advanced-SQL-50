WITH first_login AS
(SELECT player_id, MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id)
SELECT a.player_id,a.device_id
FROM Activity a JOIN first_login f
ON (a.player_id=f.player_id
AND a.event_date=f.first_login);
