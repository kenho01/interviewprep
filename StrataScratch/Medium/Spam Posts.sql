SELECT post_date, 
    SUM(
        CASE WHEN post_keywords ILIKE '%spam%' THEN 1 ELSE 0 END) /
    COUNT(post_keywords)::DECIMAL * 100
FROM facebook_posts fp
RIGHT JOIN facebook_post_views fpv
ON fp.post_id = fpv.post_id
GROUP BY post_date