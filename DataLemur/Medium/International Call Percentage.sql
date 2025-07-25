WITH call_stats AS(
SELECT p.caller_id, i1.country_id AS caller_country, i2.country_id AS receiver_country
FROM phone_calls p 
JOIN phone_info i1 
ON p.caller_id = i1.caller_id
JOIN phone_info i2 
ON p.receiver_id = i2.caller_id)

SELECT 
ROUND(
  (SELECT COUNT(*) 
  FROM call_stats WHERE caller_country != receiver_country) /
  (SELECT COUNT(*) FROM phone_calls)::DECIMAL * 100.0, 1) AS international_calls_pct
FROM call_stats
LIMIT 1