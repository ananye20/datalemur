WITH cte AS(SELECT customer_id, product_category
FROM customer_contracts C 
JOIN products P 
ON C.product_id = P.product_id
GROUP BY customer_id, product_category
HAVING COUNT(product_category)>0
ORDER BY COUNT(product_category) DESC),
abc AS(SELECT customer_id, COUNT(product_category) AS ct, 
RANK() OVER (ORDER BY COUNT(product_category) DESC) as rnk
FROM cte 
GROUP BY 1
ORDER BY 2 DESC)
SELECT customer_id
FROM abc
WHERE rnk=1;