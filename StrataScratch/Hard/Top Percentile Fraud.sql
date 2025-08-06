WITH percentile_threshold AS (
SELECT state, PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY fraud_score) AS top5_percentile
FROM fraud_score
GROUP BY state)

SELECT f.policy_num, f.state, f.claim_cost, f.fraud_score
FROM fraud_score f
JOIN percentile_threshold pt
ON f.state = pt.state
WHERE f.fraud_score >= pt.top5_percentile