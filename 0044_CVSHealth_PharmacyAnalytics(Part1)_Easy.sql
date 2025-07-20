SELECT drug, (SUM(total_sales)-SUM(cogs)) AS total_profit
FROM pharmacy_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3;