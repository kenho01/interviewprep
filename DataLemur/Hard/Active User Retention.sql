WITH july_stats AS 
(SELECT event_date, user_id
FROM user_actions
WHERE event_date >= '2022-07-01' AND event_date < '2022-08-01') 

, june_stats AS 
(SELECT event_date, user_id
FROM user_actions
WHERE event_date >= '2022-06-01' AND event_date < '2022-07-01') 

SELECT EXTRACT(MONTH FROM jul.event_date) AS month, COUNT(DISTINCT jul.user_id) AS monthly_active_users
FROM june_stats jun 
JOIN july_stats jul 
ON jun.user_id = jul.user_id
GROUP BY EXTRACT(MONTH FROM jul.event_date)
