SELECT
  COUNT(CASE WHEN device_type = 'laptop' THEN 1 END) AS laptop_views,
  COUNT(CASE WHEN device_type in ('tablet', 'phone') THEN 1 END) AS mobile_views
FROM viewership