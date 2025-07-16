WITH first_last_cte AS(
SELECT user_id, MIN(post_date) AS first_post, MAX(post_date) AS last_post
FROM posts 
WHERE post_date >= '2021-01-01'
AND post_date < '2022-01-01'
GROUP BY user_id)

SELECT user_id, EXTRACT(DAY FROM last_post - first_post) AS days_between
FROM first_last_cte
WHERE EXTRACT(DAY FROM last_post - first_post) > 0;