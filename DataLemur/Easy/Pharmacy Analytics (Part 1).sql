SELECT drug, total_sales - cogs AS total_profit
FROm pharmacy_sales
ORDER by total_profit DESC
LIMIT 3