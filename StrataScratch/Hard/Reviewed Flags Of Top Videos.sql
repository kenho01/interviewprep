WITH videos_flag_stats AS (
SELECT video_id, DENSE_RANK () OVER (ORDER BY COUNT(DISTINCT uf.flag_id) DESC) AS flags_rank
FROM user_flags uf
JOIN flag_review fr 
ON uf.flag_id = fr.flag_id
GROUP BY video_id )

SELECT video_id, COUNT(*)
FROM user_flags uf
JOIN flag_review fr 
ON uf.flag_id = fr.flag_id
WHERE reviewed_by_yt IS TRUE 
AND video_id IN (SELECT video_id FROM videos_flag_stats WHERE flags_rank = 1)
GROUP BY video_id