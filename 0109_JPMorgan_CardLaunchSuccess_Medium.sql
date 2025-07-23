WITH cards AS(SELECT *, RANK() OVER (PARTITION BY card_name ORDER BY issue_year, issue_month) AS rnk FROM monthly_cards_issued)
SELECT card_name, issued_amount FROM cards WHERE rnk=1 ORDER BY 2 DESC;