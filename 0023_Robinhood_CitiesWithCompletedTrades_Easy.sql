SELECT city, COUNT(order_id) AS total_orders
FROM trades T 
JOIN users U 
ON T.user_id = U.user_id
WHERE status='Completed'
GROUP BY city
ORDER BY 2 DESC
LIMIT 3;