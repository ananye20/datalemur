SELECT P.page_id
FROM pages P 
LEFT JOIN page_likes PL 
ON P.page_id = PL.page_id
GROUP BY P.page_id
HAVING COUNT(user_id)=0
ORDER BY P.page_id;