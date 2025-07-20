WITH cte AS(SELECT category, product, SUM(spend) AS total_spend, 
RANK() OVER (PARTITION BY category ORDER BY SUM(spend) DESC) AS rnk
FROM product_spend
WHERE EXTRACT(YEAR FROM transaction_date)=2022
GROUP BY 1,2)
SELECT category, product, total_spend
FROM cte 
WHERE rnk IN (1,2);