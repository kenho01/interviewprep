SELECT salary FROM (
SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employee ) t1
WHERE salary_rank = 2