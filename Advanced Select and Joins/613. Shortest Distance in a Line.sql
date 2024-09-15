WITH cross_join AS (
    SELECT p1.x AS point1, p2.x AS point2, ABS(p1.x-p2.x) AS distance
    FROM Point p1 CROSS JOIN Point p2
    WHERE p1.x!=p2.x
)
SELECT MIN(distance) AS shortest FROM cross_join;
