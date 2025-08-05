WITH sent_stats AS(
    SELECT date, user_id_sender, user_id_receiver
    FROM fb_friend_requests
    WHERE action='sent'
)
, accept_stats AS(
    SELECT date, user_id_sender, user_id_receiver
    FROM fb_friend_requests
    WHERE action = 'accepted'
)

SELECT s.date, 
    COUNT(a.user_id_receiver)/COUNT(s.user_id_sender)::DECIMAL AS percentage_acceptance
FROM sent_stats s
LEFT JOIN accept_stats a
ON s.user_id_sender = a.user_id_sender
AND s.user_id_receiver = a.user_id_receiver
GROUP BY s.date

select * 
FROM sent_stats s
LEFT JOIN accept_stats a
ON s.user_id_sender = a.user_id_sender
AND s.user_id_receiver = a.user_id_receiver