WITH stats AS(
SELECT user_id, COUNT(tweet_id) as tweet_bucket
FROM tweets
WHERE EXTRACT (YEAR FROM tweet_date) = 2022
GROUP BY user_id
)

SELECT tweet_bucket, COUNT(*) AS users_num
FROM stats
GROUP BY tweet_bucket;