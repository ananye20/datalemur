WITH cte AS(SELECT user_id, COUNT(tweet_id) AS tweet_bucket
FROM tweets
WHERE YEAR(tweet_date)=2022
GROUP BY user_id)
SELECT tweet_bucket, COUNT(tweet_bucket) AS users_num
FROM cte 
GROUP BY tweet_bucket
ORDER BY tweet_bucket ASC;