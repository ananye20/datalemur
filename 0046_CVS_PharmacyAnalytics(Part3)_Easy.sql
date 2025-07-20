WITH abc AS(SELECT manufacturer, ROUND(SUM(total_sales))/1000000 AS sale
FROM pharmacy_sales
GROUP BY 1
ORDER BY 2 DESC)
SELECT manufacturer, '$'||ROUND(sale)::VARCHAR ||' million' AS sale_mil 
FROM abc;