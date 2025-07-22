SELECT DISTINCT t1.user_id
FROM transactions t1
JOIN transactions t2
ON DATE(t2.transaction_date) = DATE(t1.transaction_date) + 1
JOIN transactions t3
ON DATE(t3.transaction_date) = DATE(t1.transaction_date) + 2
ORDER BY t1.user_id