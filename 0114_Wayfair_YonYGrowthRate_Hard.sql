WITH yoy AS(SELECT *,
LAG(spend) OVER (PARTITION BY product_id ORDER BY transaction_date) AS prev_year_spend
FROM user_transactions)
SELECT EXTRACT(YEAR FROM transaction_date) AS year,
product_id, spend AS curr_year_spend, prev_year_spend,
ROUND(100.0*(spend-prev_year_spend)/prev_year_spend,2) AS yoy_rate
FROM yoy;