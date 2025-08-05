WITH friend_inverse AS (
    SELECT user2 AS user1, user1 AS user2
    FROM facebook_friends
),

friend_rs AS (
    SELECT *
    FROM facebook_friends
    UNION ALL
    SELECT *
    FROM friend_inverse
)

SELECT user1, ROUND(COUNT(user2) /(SELECT COUNT (DISTINCT user1) FROM friend_rs)::DECIMAL *100.0 ,2)AS popularity_percent
FROM friend_rs
GROUP BY user1
ORDER BY user1 ASC



