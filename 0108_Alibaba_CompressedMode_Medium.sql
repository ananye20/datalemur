WITH orders AS(SELECT *, RANK() OVER (ORDER BY order_occurrences DESC) AS rnk FROM items_per_order)
SELECT item_count AS mode FROM orders WHERE rnk=1;