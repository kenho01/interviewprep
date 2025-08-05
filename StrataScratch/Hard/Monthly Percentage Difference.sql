WITH agg_transactions AS (
SELECT TO_CHAR(created_at, 'yyyy-mm') AS year_month, SUM(value) AS total_value
FROM sf_transactions
GROUP BY TO_CHAR(created_at, 'yyyy-mm'))

, agg_prev_transactions AS (
SELECT *, LAG(total_value, 1) OVER (ORDER BY year_month ASC) AS prev_revenue
FROM agg_transactions)

SELECT year_month, 
    ROUND((total_value-prev_revenue)/prev_revenue::DECIMAL * 100.0, 2) AS revenue_diff_pct
FROM agg_prev_transactions