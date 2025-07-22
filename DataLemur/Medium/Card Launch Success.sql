WITH cards_stats AS (
  SELECT *, RANK() OVER (PARTITION BY card_name ORDER BY issue_year, issue_month ASC) AS launch_month
  FROM monthly_cards_issued
)

SELECT card_name, issued_amount
FROM cards_stats
WHERE launch_month = 1
ORDER BY issued_amount DESC;