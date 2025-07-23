WITH abc AS(SELECT order_id AS corrected_order_id,
CASE WHEN order_id %2=0 THEN LAG(item) OVER (ORDER BY order_id)
WHEN order_id %2!=0 THEN LEAD(item) OVER (ORDER BY order_id) END AS item
FROM orders),
cte AS(SELECT order_id AS corrected_order_id, item
FROM orders
ORDER BY 1 DESC
LIMIT 1)
SELECT corrected_order_id, item FROM abc 
WHERE item IS NOT NULL
UNION ALL
SELECT * 
FROM cte;