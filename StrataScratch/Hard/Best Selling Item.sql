WITH sell_stats AS (
    SELECT EXTRACT(MONTH FROM invoicedate) AS month, description, SUM(unitprice * quantity) AS total_paid
    FROM online_retail
    GROUP BY EXTRACT(MONTH FROM invoicedate), description
    ORDER BY EXTRACT(MONTH FROM invoicedate) ASC
),

sell_stats_rank AS (
    SELECT *, RANK() OVER (PARTITION BY month ORDER BY total_paid DESC) AS sell_rank
    FROM sell_stats
)

SELECT month, description, total_paid
FROM sell_stats_rank
WHERE sell_rank = 1