WITH abc AS(SELECT department_id, name, salary,
DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rnk
FROM employee)
SELECT department_name, name, salary
FROM abc A
JOIN department D 
ON A.department_id = D.department_id
WHERE rnk<=3
ORDER BY 1, 3 DESC, 2;