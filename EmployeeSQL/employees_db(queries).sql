--List the following details of each employee: employee number, last name, first name, sex, and salary.
-- Perform an INNER JOIN on the two tables
SELECT employees.emp_no, employees.last_name,employees.first_name, employees.sex, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE
	extract(year from hire_date) = 1986;

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name.
SELECT 	dept_manager.dept_no,
		"Dept".dept_name, 
		dept_manager.emp_no,  
		employees.last_name, 
		employees.first_name
FROM dept_manager
INNER JOIN "Dept" ON
"Dept".dept_no=dept_manager.dept_no
INNER JOIN employees ON 
dept_manager.emp_no=employees.emp_no;


--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT 	employees.emp_no,  
		employees.last_name, 
		employees.first_name,
		"Dept".dept_name
FROM dept_emp
INNER JOIN employees ON
dept_emp.emp_no=employees.emp_no
INNER JOIN "Dept" ON 
"Dept".dept_no=dept_emp.dept_no;

--List first name, last name, and sex for 
--employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE
	first_name = 'Hercules'
	AND last_name like 'B%';

--List all employees in the Sales department, including 
--their employee number, last name, first name, and department name.
SELECT employees.emp_no,employees.last_name, employees.first_name, "Dept".dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no=employees.emp_no
JOIN "Dept"
ON dept_emp.dept_no= "Dept".dept_no
WHERE "Dept".dept_name ='Sales';

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT employees.emp_no,employees.last_name, employees.first_name, "Dept".dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no=employees.emp_no
JOIN "Dept"
ON dept_emp.dept_no= "Dept".dept_no
WHERE "Dept".dept_name ='Sales' 
OR "Dept".dept_name ='Development';

--In descending order, list the frequency count of employee 
--last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name)  AS "frequency" 
FROM employees
GROUP BY last_name
ORDER BY "frequency" DESC;