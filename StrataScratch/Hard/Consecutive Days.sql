WITH record_group AS (
    SELECT *, 
    record_date - CAST(DENSE_RANK() OVER (PARTITION BY user_id ORDER BY user_id, record_date) AS INT)
                AS login_group
    FROM sf_events
)

, agg_login_stats AS(
SELECT user_id, login_group, COUNT(DISTINCT record_date) AS login_count
FROM record_group
GROUP BY user_id, login_group)

SELECT user_id
FROM agg_login_stats
WHERE login_count >= 3


