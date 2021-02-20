DROP TABLE IF EXISTS titles;

CREATE TABLE titles (
title_id VARCHAR NOT NULL PRIMARY KEY,
title VARCHAR NOT NULL
);
COPY titles FROM '/Users/srk022/Public/EmployeeSQL/titles.csv'
DELIMITER ',' CSV HEADER;
SELECT * FROM titles;


	
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
	dept_no VARCHAR NOT NULL PRIMARY KEY,
	dept_name VARCHAR NOT NULL
);

COPY departments FROM '/Users/srk022/Public/EmployeeSQL/departments.csv'
DELIMITER ',' CSV HEADER;

SELECT * FROM departments;


DROP TABLE IF EXISTS employees;
CREATE TABLE employees(
	emp_no INT NOT NULL PRIMARY KEY,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

COPY employees FROM '/Users/srk022/Public/EmployeeSQL/employees.csv'
DELIMITER ',' CSV HEADER;

SELECT * FROM employees;





DROP TABLE IF EXISTS dept_manager;
CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (dept_no, emp_no)
);

COPY dept_manager FROM '/Users/srk022/Public/EmployeeSQL/dept_manager.csv'
DELIMITER ',' CSV HEADER;

SELECT * FROM dept_manager;




DROP TABLE IF EXISTS dept_emp;
CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

COPY dept_emp FROM '/Users/srk022/Public/EmployeeSQL/dept_emp.csv'
DELIMITER ',' CSV HEADER;

SELECT * FROM dept_emp;





DROP TABLE IF EXISTS salaries;
CREATE TABLE salaries(
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INT NOT NULL
);

COPY salaries FROM '/Users/srk022/Public/EmployeeSQL/salaries.csv'
DELIMITER ',' CSV HEADER;

SELECT * FROM salaries;
