WITH cte AS(SELECT E.employee_id AS employee_id, 
COUNT(query_id) AS count_q
FROM employees E 
LEFT JOIN queries Q 
ON E.employee_id = Q.employee_id
AND query_starttime BETWEEN '07/01/2023 00:00:00' 
AND '09/30/2023 23:59:59'
GROUP BY 1)
SELECT count_q AS unique_queries, 
COUNT(employee_id) AS employee_count
FROM cte 
GROUP BY 1
ORDER BY 1;