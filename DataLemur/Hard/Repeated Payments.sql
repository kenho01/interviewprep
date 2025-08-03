WITH transaction_stats AS (
SELECT 
transaction_id, merchant_id, credit_card_id, amount, transaction_timestamp
, EXTRACT (EPOCH FROM transaction_timestamp - LAG(transaction_timestamp) 
  OVER (PARTITION BY merchant_id, credit_card_id, amount ORDER BY transaction_timestamp))
  /60 AS transaction_time_diff
FROM transactions
)

SELECT COUNT(*) AS payment_count
FROM transaction_stats
WHERE transaction_time_diff <= 10.0 
AND transaction_time_diff IS NOT NULL