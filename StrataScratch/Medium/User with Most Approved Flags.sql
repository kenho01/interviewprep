WITH video_stats AS (
SELECT u.user_firstname, u.user_lastname, DENSE_RANK() OVER (ORDER BY COUNT(DISTINCT u.video_id) DESC) AS flag_rank
FROM user_flags u
JOIN flag_review f
ON u.flag_id = f.flag_id
WHERE f.reviewed_outcome = 'APPROVED'
GROUP BY u.user_firstname, u.user_lastname )

SELECT CONCAT(user_firstname, ' ', user_lastname) 
FROM video_stats
WHERE flag_rank = 1