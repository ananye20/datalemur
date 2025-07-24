WITH amz AS(SELECT item_type, SUM(square_footage) AS tot, COUNT(item_id) AS itc,
ROUND(SUM(square_footage)/COUNT(item_id),1) AS per_item, 
500000-SUM(square_footage) AS remaining
FROM inventory
GROUP BY 1),
amz2 AS(SELECT *, CEIL(remaining/per_item) AS item_count
FROM amz),
amz3 AS (SELECT *, ROUND(((500000-remaining)/per_item)+itc) AS item_count
FROM amz
WHERE item_type='not_prime')
SELECT item_type, item_count FROM amz2 WHERE item_type='prime_eligible'
UNION ALL 
SELECT item_type, item_count FROM amz3;