WITH highest1 AS(SELECT ticker, TO_CHAR(date,'Mon-YYYY') AS highest_mth, 
MAX(open) AS highest_open
FROM stock_prices
GROUP BY 1,2),
high AS (SELECT *,
RANK() OVER (PARTITION BY ticker ORDER BY highest_open DESC) AS rnk
FROM highest1),
highest AS (SELECT ticker, highest_mth, highest_open
FROM high
WHERE rnk=1),
lowest1 AS(SELECT ticker, TO_CHAR(date,'Mon-YYYY') AS lowest_mth, 
MIN(open) AS lowest_open
FROM stock_prices
GROUP BY 1,2),
low AS (SELECT *,
RANK() OVER (PARTITION BY ticker ORDER BY lowest_open ASC) AS rnk1
FROM lowest1),
lowest AS (SELECT ticker, lowest_mth, lowest_open
FROM low
WHERE rnk1=1)
SELECT L.ticker, highest_mth, highest_open,
lowest_mth, lowest_open
FROM lowest L 
JOIN highest H 
ON L.ticker = H.ticker;