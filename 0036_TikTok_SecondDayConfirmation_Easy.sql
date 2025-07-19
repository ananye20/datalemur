WITH cte AS(SELECT *, LAG(signup_action) 
OVER (PARTITION BY email_id ORDER BY action_date)
AS lag_sign,
LAG(action_date) OVER (PARTITION BY email_id ORDER BY action_date) AS 
lag_date
FROM texts)
SELECT user_id
FROM cte C
JOIN emails E
ON C.email_id = E.email_id
WHERE signup_action = 'Confirmed' AND lag_sign='Not confirmed' AND 
DATEDIFF(lag_date, action_date)=-1;