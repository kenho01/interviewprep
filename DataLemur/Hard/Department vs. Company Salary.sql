WITH average_salary AS (
SELECT TO_CHAR(payment_date, 'MM-YYYY') AS payment_date, AVG(amount) AS average_salary
FROM salary 
WHERE payment_date >= '2024-03-01' AND payment_date < '2024-04-01'
GROUP BY payment_date
)

, average_department_salary AS (
SELECT DISTINCT e.department_id, TO_CHAR(s.payment_date, 'MM-YYYY'), AVG(s.amount) OVER (PARTITION BY department_id) AS average_department_salary
FROM employee e
JOIN salary s 
ON e.employee_id = s.employee_id
WHERE payment_date >= '2024-03-01' AND payment_date < '2024-04-01'
)

SELECT ads.department_id, avgS.payment_date,
  CASE
    WHEN ads.average_department_salary < avgS.average_salary THEN 'lower'
    WHEN ads.average_department_salary = avgS.average_salary THEN 'same'
    WHEN ads.average_department_salary > avgS.average_salary THEN 'higher'
  END AS comparison
FROM average_department_salary ads 
CROSS JOIN average_salary avgS
ORDER BY 
  CASE department_id WHEN 1 THEN 1 
  WHEN 3 THEN 2 WHEN 2 THEN 3 END








