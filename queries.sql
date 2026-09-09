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







-- Advanced SQL Queries

-- 19. Categorize employees by salary
SELECT name, salary,
CASE
    WHEN salary >= 55000 THEN 'High'
    WHEN salary >= 45000 THEN 'Medium'
    ELSE 'Low'
END AS salary_category
FROM employees;

-- 20. Employees earning above average salary
SELECT name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- 21. Rank employees by salary
SELECT name, department, salary,
ROW_NUMBER() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

-- 22. Rank employees within each department
SELECT name, department, salary,
ROW_NUMBER() OVER (
    PARTITION BY department
    ORDER BY salary DESC
) AS department_rank
FROM employees;

-- 23. Rank employees using RANK
SELECT name, department, salary,
RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

-- 24. Rank employees using DENSE_RANK
SELECT name, department, salary,
DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

-- 25. Compare with previous salary
SELECT name, salary,
LAG(salary) OVER (ORDER BY salary DESC) AS previous_salary
FROM employees;

-- 26. Compare with next salary
SELECT name, salary,
LEAD(salary) OVER (ORDER BY salary DESC) AS next_salary
FROM employees;

-- 27. Find the highest salary using FIRST_VALUE
SELECT name, salary,
FIRST_VALUE(salary) OVER (ORDER BY salary DESC) AS highest_salary
FROM employees;

-- 28. Find the lowest salary using LAST_VALUE
SELECT name, salary,
LAST_VALUE(salary) OVER (
    ORDER BY salary DESC
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
) AS lowest_salary
FROM employees;

-- 29. Running total of salaries
SELECT name, salary,
SUM(salary) OVER (ORDER BY salary DESC) AS running_total
FROM employees;

-- 30. Running average salary
SELECT name, salary,
AVG(salary) OVER (ORDER BY salary DESC) AS running_average
FROM employees;

-- 31. Minimum and maximum salary
SELECT name, salary,
MIN(salary) OVER () AS lowest_salary,
MAX(salary) OVER () AS highest_salary
FROM employees;
