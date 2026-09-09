-- Employee Management SQL Project

-- 1. Display all employees
SELECT * FROM employees;

-- 2. Find employees in the IT department
SELECT * FROM employees
WHERE department = 'IT';

-- 3. Find employees earning more than 50000
SELECT * FROM employees
WHERE salary > 50000;

-- 4. Sort employees by salary from highest to lowest
SELECT * FROM employees
ORDER BY salary DESC;

-- 5. Find the highest salary
SELECT MAX(salary) FROM employees;

-- 6. Find the average salary
SELECT AVG(salary) FROM employees;

-- 7. Count total employees
SELECT COUNT(*) FROM employees;

-- 8. Count employees in each department
SELECT department, COUNT(*)
FROM employees
GROUP BY department;

-- 9. Find departments with more than 1 employee
SELECT department, COUNT(*)
FROM employees
GROUP BY department
HAVING COUNT(*) > 1;

-- 10. Find total salary by department
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- 11. Find the highest-paid employee
SELECT * FROM employees
ORDER BY salary DESC
LIMIT 1;

-- 12. Display unique departments
SELECT DISTINCT department
FROM employees;

-- 13. Find employees with no manager
SELECT name, manager
FROM employees
WHERE manager IS NULL;

-- 14. Display employee name and manager
SELECT name, manager
FROM employees;

-- 15. Find employees managed by Rohit
SELECT name, department, manager
FROM employees
WHERE manager = 'Rohit';

-- 16. Find average salary by department
SELECT department, AVG(salary)
FROM employees
GROUP BY department;

-- 17. Find department with highest total salary
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
ORDER BY total_salary DESC
LIMIT 1;

-- 18. Join employees with departments
SELECT employees.name, employees.department, departments.location
FROM employees
JOIN departments
ON employees.department = departments.department;
