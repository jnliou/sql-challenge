---Data Analysis 

--List the employee number, last name, first name, sex, and salary of each employee (2 points)
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no
ORDER BY  employees.emp_no ASC

--List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)
SELECT employees.hire_date, employees.last_name, employees.first_name
FROM employees
WHERE hire_date >= DATE '1986-01-01' AND hire_date < DATE '1987-01-01';


--List the manager of each department along with their department number, department name, employee number, last name, and first name (2 points)
SELECT dept_manager.emp_no, employees.last_name, employees.first_name, dept_manager.dept_no, departments.dept_name
FROM employees
INNER JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no
ORDER BY dept_manager.dept_no ASC

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name (2 points)
SELECT dept_emp.dept_no, employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
ORDER BY dept_emp.dept_no ASC


--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B (2 points)
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'


--List each employee in the Sales department, including their employee number, last name, and first name (2 points)
SELECT e.emp_no, e.first_name, e.last_name
FROM departments AS d
INNER JOIN dept_emp AS de ON d.dept_no = de.dept_no
INNER JOIN employees AS e ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no ASC;


--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name 
FROM departments AS d
INNER JOIN dept_emp AS de ON d.dept_no = de.dept_no
INNER JOIN employees AS e ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
ORDER BY e.emp_no ASC;

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)

SELECT e.last_name, COUNT(e.last_name) AS frequency_last_name
FROM employees as e 
GROUP BY e.last_name 
ORDER BY frequency_last_name DESC

