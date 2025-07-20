WITH abc AS(SELECT manufacturer, drug, (cogs-total_sales) AS loss
FROM pharmacy_sales
WHERE (cogs-total_sales)>0)
SELECT manufacturer, COUNT(drug) AS drug_count, SUM(loss) AS total_loss
FROM abc 
GROUP BY 1
ORDER BY 2 DESC, 1;