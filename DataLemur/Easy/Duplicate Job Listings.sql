WITH job_cnt_cte AS (
  SELECT company_id, title, description, COUNT(job_id) AS job_cnt
  FROM job_listings
  GROUP BY company_id, title, description
)

SELECT COUNT(*)
FROM job_cnt_cte
WHERE job_cnt > 1;