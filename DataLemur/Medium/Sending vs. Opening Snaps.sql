WITH snap_stats AS (
SELECT ab.age_bucket,
  SUM(CASE
        WHEN activity_type = 'send' THEN a.time_spent ELSE 0 END) AS send_total,
  SUM(CASE
        WHEN activity_type = 'open' THEN a.time_spent ELSE 0 END) AS open_total,
  SUM(time_spent) AS total_time
FROM activities a 
JOIN age_breakdown ab 
ON a.user_id = ab.user_id
WHERE activity_type IN ('send', 'open')
GROUP BY ab.age_bucket)

SELECT age_bucket, 
  ROUND(100.0 * send_total / total_time, 2) AS send_perc,
  ROUND(100.0 * open_total / total_time, 2) AS open_perc
FROM snap_stats
