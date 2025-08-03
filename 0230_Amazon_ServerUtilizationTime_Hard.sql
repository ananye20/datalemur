WITH abc AS(SELECT server_id, status_time, session_status,
LAG(status_time) OVER (PARTITION BY server_id ORDER BY status_time) AS prev_time,
LAG(session_status) OVER (PARTITION BY server_id ORDER BY status_time) AS prev_status
FROM server_utilization),
aaa AS(SELECT *,  (EXTRACT(EPOCH FROM (status_time-prev_time)) / 86400) AS dys
FROM abc 
WHERE session_status = 'stop' AND prev_status = 'start')
SELECT ROUND(SUM(dys)) AS total_uptime_days
FROM aaa;