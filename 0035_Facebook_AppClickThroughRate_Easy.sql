WITH impression AS(SELECT app_id, COUNT(event_type) AS count_imp
FROM events
WHERE event_type='impression' AND EXTRACT(YEAR FROM timestamp)=2022
GROUP BY app_id),
click AS(SELECT app_id, COUNT(event_type) AS count_click
FROM events
WHERE event_type='click' AND EXTRACT(YEAR FROM timestamp)=2022
GROUP BY app_id)
SELECT I.app_id, ROUND(100.0*count_click/count_imp,2) AS ctr 
FROM impression I 
JOIN click C 
ON I.app_id = C.app_id;