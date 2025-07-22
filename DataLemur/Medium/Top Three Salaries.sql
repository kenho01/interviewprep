WITH salary_stats AS (
SELECT *, DENSE_RANK() OVER(PARTITION BY department_name ORDER BY salary DESC) AS salary_rank
FROM
(
SELECT *
FROM employee e
JOIN department d 
ON e.department_id = d.department_id) T1 
) 

SELECT department_name, name, salary
FROM salary_stats
WHERE salary_rank <= 3
ORDER BY department_name ASC, salary DESC, name ASC 
