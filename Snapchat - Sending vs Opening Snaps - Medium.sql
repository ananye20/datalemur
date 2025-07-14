WITH cte AS(SELECT age_bucket, activity_type, SUM(time_spent) AS sss
FROM activities A 
JOIN age_breakdown B 
ON A.user_id = B.user_id
WHERE activity_type IN ('open', 'send')
GROUP BY age_bucket, activity_type
ORDER BY 1,2),
abc AS(SELECT age_bucket,
SUM(CASE WHEN activity_type='send' THEN sss ELSE 0 END) AS send_time,
SUM(CASE WHEN activity_type='open' THEN sss ELSE 0 END) AS open_time
FROM cte
GROUP BY age_bucket)
SELECT age_bucket,
ROUND(send_time/(send_time+open_time)*100,2) AS send_perc,
ROUND(open_time/(send_time+open_time)*100,2) AS open_perc
FROM abc