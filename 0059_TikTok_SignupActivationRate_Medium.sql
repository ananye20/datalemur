WITH abc AS(SELECT user_id,
SUM(CASE WHEN signup_action='Confirmed' THEN 1 ELSE 0 END) AS sm,
COUNT(E.email_id) AS ct 
FROM emails E
LEFT JOIN texts T 
ON E.email_id = T.email_id
GROUP BY 1)
SELECT ROUND(SUM(sm)/COUNT(ct),2) AS confirm_rate
FROM abc;