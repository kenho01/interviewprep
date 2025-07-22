WITH stats AS (
  SELECT *, RANK() OVER (PARTITION BY category ORDER BY total_spend DESC) AS product_rank
  FROM (SELECT category, product, SUM(spend) AS total_spend FROM product_spend 
  WHERE EXTRACT(YEAR FROM transaction_date) = 2022
  GROUP BY category, product) T1
)

SELECT category, product, total_spend FROM stats
WHERE product_rank = 1 OR product_rank = 2

