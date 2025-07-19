SELECT sender_id, COUNT(message_id) AS message_count
FROM messages
WHERE EXTRACT(MONTH FROM sent_date)=8 
AND EXTRACT(YEAR FROM sent_date)=2022
GROUP BY sender_id
ORDER BY 2 DESC
LIMIT 2;