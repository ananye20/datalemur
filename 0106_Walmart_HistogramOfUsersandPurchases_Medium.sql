WITH users AS(SELECT *,
RANK() OVER (PARTITION BY user_id ORDER BY transaction_date DESC) AS rnk
FROM user_transactions),
prods AS(SELECT * 
FROM users
WHERE rnk=1)
SELECT transaction_date, user_id,
COUNT(product_id) AS purchase_count
FROM prods
GROUP BY 1,2;