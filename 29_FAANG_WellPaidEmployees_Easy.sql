SELECT e.employee_id, e.name AS employee_name
FROM employee e
WHERE e.salary> (SELECT salary FROM employee
WHERE employee_id = e.manager_id);