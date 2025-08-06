WITH no_order AS (
SELECT DISTINCT c.first_name
FROM customers c
LEFT JOIN orders o 
ON c.id = o.cust_id
WHERE o.id IS NULL
),

order_outOfRange AS (
SELECT DISTINCT c.first_name
FROM customers c
LEFT JOIN orders o 
ON c.id = o.cust_id
WHERE o.order_date < '2019-02-01' OR order_date > '2019-03-01')

, order_inRange AS (
SELECT DISTINCT c.first_name
FROM customers c
LEFT JOIN orders o 
ON c.id = o.cust_id
WHERE '2019-02-01' <= o.order_date AND order_date <= '2019-03-01'
)

SELECT first_name
FROM order_outOfRange
WHERE first_name NOT IN (SELECT first_name FROM order_inRange)
UNION 
SELECT first_name 
FROM no_order



