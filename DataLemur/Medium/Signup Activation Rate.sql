WITH signup_stats AS (
SELECT *
FROM emails e 
LEFT JOIN texts t 
ON e.email_id = t.email_id 
AND t.signup_action = 'Confirmed' )

SELECT 
  ROUND(SUM(CASE WHEN signup_action = 'Confirmed' THEN 1 ELSE 0 END) / 
  COUNT(*)::DECIMAL, 2)
FROM signup_stats