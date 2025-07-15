WITH duplics AS(SELECT company_id, COUNT(job_id) AS count_of_id
FROM job_listings
GROUP BY company_id
HAVING COUNT(job_id)>1
ORDER BY 2 DESC)
SELECT COUNT(*) AS duplicate_companies
FROM duplics;