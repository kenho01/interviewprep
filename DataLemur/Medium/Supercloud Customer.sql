WITH supercloud_stats AS (
SELECT c.customer_id, COUNT(DISTINCT p.product_category) AS product_cnt
FROM customer_contracts c 
JOIN products p 
ON c.product_id = p.product_id
GROUP BY c.customer_id )

SELECT customer_id
FROM supercloud_stats
WHERE product_cnt = (SELECT COUNT(DISTINCT product_category) FROM products)