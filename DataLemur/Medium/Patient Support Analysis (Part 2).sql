SELECT
  ROUND(
  SUM(CASE WHEN call_category = 'n/a' OR call_category IS NULL THEN 1 ELSE 0 END)::decimal /
  COUNT(*) * 100.0, 1)  AS uncategorised_call_pct
FROM callers;

