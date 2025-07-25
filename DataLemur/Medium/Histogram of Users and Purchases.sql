WITH purchase_stats AS (
  SELECT *, RANK() OVER (PARTITION BY user_id ORDER BY transaction_date DESC) as date_rank
  FROM user_transactions
)

SELECT transaction_date, user_id, COUNT(*) AS purchase_count
FROM purchase_stats
WHERE date_rank = 1
GROUP BY transaction_date, user_id