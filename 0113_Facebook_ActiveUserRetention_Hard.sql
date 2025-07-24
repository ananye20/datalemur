WITH abc AS(SELECT * FROM user_actions
WHERE EXTRACT(MONTH FROM event_date) IN (6,7)
AND EXTRACT(YEAR FROM event_date)=2022),
common AS (SELECT EXTRACT(MONTH FROM event_date) AS month, COUNT(DISTINCT event_type) AS a
FROM abc 
GROUP BY 1)
SELECT MAX(month) AS month, MIN(a) AS monthly_active_users
FROM common;