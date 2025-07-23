WITH abc AS(SELECT *,
LAG(transaction_date) OVER 
(PARTITION BY user_id ORDER BY transaction_date ASC) AS lag1
FROM transactions),
cte AS(SELECT *,
LAG(lag1) OVER 
(PARTITION BY user_id ORDER BY transaction_date ASC) AS lag2
FROM abc),
lags AS(SELECT *
FROM cte 
WHERE lag1 IS NOT NULL AND lag2 IS NOT NULL)
SELECT user_id
FROM lags
WHERE transaction_date - INTERVAL '1 day' = lag1
AND lag1 - INTERVAL '1 day' = lag2;