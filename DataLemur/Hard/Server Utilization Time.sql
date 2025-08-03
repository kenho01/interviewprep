WITH server_time AS (
SELECT 
server_id, session_status, status_time AS start_time
, LEAD(status_time) OVER (PARTITION BY server_id ORDER BY status_time) AS stop_time
FROM server_utilization
)

SELECT EXTRACT ('DAYS' FROM JUSTIFY_HOURS(SUM(stop_time - start_time))) AS total_uptime_days
FROM server_time
WHERE session_status = 'start'
AND stop_time IS NOT NULL