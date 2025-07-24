SELECT ROUND(100.0*COUNT(*) FILTER(WHERE call_category IS NULL OR call_category='n/a')/COUNT(*),1) AS uncategorised_call_pct
FROM callers;