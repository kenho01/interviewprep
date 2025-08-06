WITH start_stop_stats AS (
SELECT *, LEAD(timestamp, 1) OVER (PARTITION BY cust_id ORDER BY timestamp ASC) AS stop_time
FROM cust_tracking)

SELECT cust_id, SUM(stop_time - timestamp) / 3600
FROM start_stop_stats
WHERE state = 1
AND stop_time IS NOT NULL
GROUP BY cust_id