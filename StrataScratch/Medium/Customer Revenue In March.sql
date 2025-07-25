SELECT cust_id, SUM(total_order_cost) AS total_revenue
FROM (SELECT * FROM orders WHERE '2019-03-01' <= order_date AND order_date < '2019-04-01')
GROUP BY cust_id
ORDER BY total_revenue DESC