WITH cte AS(SELECT *,DATE(measurement_time) AS measurement_day,
RANK() OVER (PARTITION BY DATE(measurement_time) ORDER BY measurement_time) AS rnk
FROM measurements)
SELECT measurement_day,
SUM(CASE WHEN rnk::INTEGER %2!=0 THEN measurement_value END) AS odd_sum,
SUM(CASE WHEN rnk::INTEGER %2=0 THEN measurement_value END) AS even_sum
FROM cte
GROUP BY 1
ORDER BY 1;