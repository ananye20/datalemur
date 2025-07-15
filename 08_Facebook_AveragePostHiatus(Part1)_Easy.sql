WITH abc AS (SELECT user_id,
FIRST_VALUE(post_date) OVER (PARTITION BY user_id ORDER BY post_date
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS rank_asc,
LAST_VALUE(post_date) OVER (PARTITION BY user_id ORDER BY post_date
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS rank_desc
FROM posts 
WHERE YEAR(post_date)=2021
ORDER BY user_id, post_date),
cte AS(SELECT *, DATEDIFF(rank_desc, rank_asc) AS days_between
FROM abc 
WHERE DATEDIFF(rank_desc, rank_asc)!=0)
SELECT user_id, MAX(days_between) AS days_between
FROM cte 
GROUP BY user_id
ORDER BY 2 DESC;