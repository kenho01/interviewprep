WITH dec_stats AS (
    SELECT country, DENSE_RANK() OVER (ORDER BY SUM(fcc.number_of_comments) DESC) AS dec_rank
    FROM fb_comments_count fcc
    JOIN fb_active_users fau
    ON fcc.user_id = fau.user_id
    WHERE created_at < '2020-01-01' AND '2019-12-01' <= created_at
    GROUP BY fau.country
)

, jan_stats AS (
    SELECT country, DENSE_RANK() OVER (ORDER BY SUM(fcc.number_of_comments) DESC) AS jan_rank
    FROM fb_comments_count fcc
    JOIN fb_active_users fau
    ON fcc.user_id = fau.user_id
    WHERE created_at < '2020-02-01' and '2020-01-01' <= created_at
    GROUP BY fau.country
)

SELECT d.country
FROM dec_stats d
JOIN jan_stats j 
ON d.country = j.country
WHERE dec_rank > jan_rank
