WITH measurement_stats AS (
SELECT *, ROW_NUMBER() OVER (PARTITION BY DATE_TRUNC('day', measurement_time) ORDER BY measurement_time ASC) as measurement_order
FROM measurements )

SELECT
  DATE_TRUNC('day', measurement_time) AS measurement_day,
  SUM(CASE WHEN MOD(measurement_order,2) = 1 THEN measurement_value ELSE 0 END) AS odd_sum,
  SUM(CASE WHEN MOD(measurement_order,2) = 0 THEN measurement_value ELSE 0 END) AS even_sum
FROM measurement_stats
GROUP BY measurement_day
ORDER BY measurement_day