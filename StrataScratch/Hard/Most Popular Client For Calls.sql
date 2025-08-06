WITH event_stats AS (
SELECT user_id,
    SUM(
        CASE WHEN event_type IN ('video call received', 'video call sent', 'voice call received', 'voice call sent') THEN 1 END)
        /COUNT(*)::DECIMAL AS percentage
FROM fact_events
GROUP BY user_id)

, valid_users AS (
    SELECT user_id
    FROM event_stats
    WHERE percentage >= 0.5
)

, client_stats AS (
    SELECT client_id, COUNT(*) AS total_count
    FROM fact_events 
    WHERE user_id IN (SELECT DISTINCT user_id FROM valid_users)
    GROUP BY client_id
)

SELECT client_id
FROM client_stats
ORDER BY total_count DESC
LIMIT 1