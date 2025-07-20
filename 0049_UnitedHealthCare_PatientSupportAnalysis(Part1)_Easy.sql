WITH cte AS(SELECT policy_holder_id, COUNT(case_id) AS count_caseid
FROM callers
GROUP BY 1
HAVING COUNT(case_id)>=3)
SELECT COUNT(*) AS policy_holder_count
FROM cte;