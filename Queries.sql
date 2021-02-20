-- Queries

--List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT e.emp_no AS "employee number",
	   e.last_name AS "last name",
	   e.first_name AS "first name",
	   e.sex AS "sex",
	   s.salary AS "salary"
FROM employees e
JOIN salaries s 
ON e.emp_no = s.emp_no;


select * from employees;

--List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name AS "first name",
	   last_name AS "last_name",
	   hire_date AS "hire date"
	   from employees
	   where CAST(hire_date AS TEXT) LIKE '1986%';

--List the manager of each department with the following information: department number, department name, the manager’s employee number, last name, first name.
SELECT d.dept_no AS "department number", 
	   d.dept_name AS "department name", 
	   m.emp_no AS "manager’s employee number",
	   e.last_name AS "managers last name",
	   e.first_name AS "managers first name"
from departments d
JOIN dept_manager m
ON m.dept_no = d.dept_no
JOIN employees e
ON m.emp_no = e.emp_no;


--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no AS "Employee Number",
	   e.last_name AS "Last Name",
	   e.first_name AS "First Name",
	   d.dept_name AS "Department Name"	   
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON d.dept_no = de.dept_no;
	  

--List first name, last name, and sex for employees whose first name is “Hercules” and last names begin with “B.”
SELECT first_name AS "First Name", last_name AS "Last Name", sex AS "Sex" FROM employees
WHERE first_name = 'Hercules' and last_name LIKE 'B%';


--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--OR

SELECT e.emp_no, e.last_name, e.first_name FROM employees e
WHERE emp_no in (
	SELECT emp_no from dept_emp
	WHERE dept_no in (
		SELECT dept_no from departments
		WHERE departments.dept_name = 'Sales'));



--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' or d.dept_name = 'Development' ;


--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) FROM employees
--where last_name = 'dAstous'
GROUP BY last_name
ORDER BY last_name desc;
