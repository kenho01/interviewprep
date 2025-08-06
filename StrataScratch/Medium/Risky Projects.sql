SELECT l.title, l.budget, 
CEILING((l.end_date - l.start_date) * (SUM(e.salary) / 365)) AS prorated_employee_expense
FROM linkedin_projects l
JOIN linkedin_emp_projects ep
ON l.id = ep.project_id
JOIN linkedin_employees e
ON ep.emp_id = e.id 
GROUP BY l.title, l.budget, l.start_date, l.end_date
HAVING CEILING(l.end_date - l.start_date) * (SUM(e.salary) / 365) > l.budget
ORDER BY l.title ASC

