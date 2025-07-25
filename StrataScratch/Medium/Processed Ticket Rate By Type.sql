SELECT type,
    ROUND(SUM(CASE WHEN processed = 'True' THEN 1 ELSE 0 END) / COUNT(*)::DECIMAL, 2) AS processed_rate
FROM facebook_complaints
GROUP BY type