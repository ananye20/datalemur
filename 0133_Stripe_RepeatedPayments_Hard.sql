WITH abc AS (SELECT *, 
LAG(amount) OVER (PARTITION BY credit_card_id ORDER BY transaction_id) AS lag_amt,
LAG(transaction_timestamp) OVER 
(PARTITION BY credit_card_id ORDER BY transaction_id) AS lag_time
FROM transactions)
SELECT COUNT(*) AS payment_count
FROM abc 
WHERE amount=lag_amt AND 
EXTRACT(EPOCH FROM (transaction_timestamp-lag_time))/60 <=10;