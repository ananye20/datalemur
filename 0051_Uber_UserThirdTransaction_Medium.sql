WITH abc AS(SELECT user_id, spend, transaction_date,
ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY transaction_date) AS rnk
FROM transactions)
SELECT user_id, spend, transaction_date
FROM abc
WHERE rnk=3;