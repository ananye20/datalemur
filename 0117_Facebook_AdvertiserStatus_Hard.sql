WITH payment AS (SELECT A.user_id AS prev_user_id, 
status, D.user_id AS now_user_id, paid
FROM advertiser A 
FULL JOIN daily_pay D 
ON A.user_id = D.user_id),
new AS (SELECT *, CASE WHEN paid IS NULL THEN 'CHURN'
WHEN prev_user_id IS NULL THEN 'NEW'
WHEN paid IS NOT NULL AND status='CHURN' THEN 'RESURRECT'
ELSE 'EXISTING' END AS new_status
FROM payment
ORDER BY 1)
SELECT CASE WHEN prev_user_id IS NULL THEN now_user_id
ELSE prev_user_id END AS user_id,
new_status
FROM new
ORDER BY 1;