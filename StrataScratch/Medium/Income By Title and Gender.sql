WITH total_bonus AS (
    SELECT worker_ref_id, SUM(bonus) AS total_bonus
    FROM sf_bonus
    GROUP BY worker_ref_id
)

SELECT e.employee_title, e.sex, AVG(salary + total_bonus) AS avg_compensation
FROM total_bonus b
LEFT JOIN sf_employee e
ON b.worker_ref_id = e.id
GROUP BY e.employee_title, e.sex