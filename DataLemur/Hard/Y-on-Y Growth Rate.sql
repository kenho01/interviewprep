WITH growth_stats AS (
SELECT 
  EXTRACT(YEAR FROM transaction_date) AS year,
  product_id,
  SUM(spend) AS curr_year_spend
FROM user_transactions
GROUP BY EXTRACT(YEAR FROM transaction_date), product_id )

, hist_growth_stats AS (
SELECT *, 
  LAG(curr_year_spend, 1) OVER(PARTITION BY product_id ORDER BY year ASC) AS prev_year_spend
FROM growth_stats )

SELECT
  *, 
  CASE
    WHEN prev_year_spend IS NULL THEN NULL
    ELSE ROUND((curr_year_spend - prev_year_spend) / prev_year_spend *100.0, 2) 
  END AS yoy_rate
FROM hist_growth_stats
  