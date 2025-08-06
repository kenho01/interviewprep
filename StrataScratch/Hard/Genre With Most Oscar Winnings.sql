WITH oscar_stats AS (
    SELECT o.nominee, DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS oscar_rank
    FROM oscar_nominees o
    JOIN nominee_information n
    ON o.nominee = n.name
    WHERE winner = TRUE 
    GROUP BY o.nominee
)

SELECT top_genre 
FROM nominee_information 
WHERE name IN (SELECT nominee FROM oscar_stats WHERE oscar_rank = 1)
