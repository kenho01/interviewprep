WITH item_stats AS (
  SELECT *, DENSE_RANK() OVER (ORDER BY order_occurrences DESC) AS freq_rank
  FROM items_per_order
)

SELECT item_count AS mode 
FROM item_stats
WHERE freq_rank = 1