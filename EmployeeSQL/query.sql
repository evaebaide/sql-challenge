
1. List the following details of each employee: employee number, last name, first name, gender, and salary

	-- Perform an INNER JOIN on the two tables
	SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
	FROM salaries
	INNER JOIN employees ON employees.emp_no=salaries.emp_no;

2. List employees who were hired in 1987.

	Select * from employees where hire_date >=DATE'1987-01-01' 
	and hire_date <=DATE'1987-12-31';

3. List the manager of each department with the following information: department number, department name, 
	--the manager's employee number, last  name, first name, and start and end employment dates.

	SELECT departments.dept_no, departments.dept_name, titles.title,  employees.emp_no, 
	employees.last_name,employees.first_name, 
	dept_manager.from_date, dept_manager.to_date
	FROM employees 
	INNER JOIN titles ON employees.emp_no=titles.emp_no
	INNER JOIN dept_manager ON employees.emp_no=dept_manager.emp_no
	INNER JOIN departments ON dept_manager.dept_no=departments.dept_no
	WHERE titles.title = 'Manager';


4. List the department of each employee with the following information: employee number, last name, first name, and department name.
	SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
	FROM employees 
	INNER JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
	INNER JOIN departments ON dept_emp.dept_no=departments.dept_no;


5. List all employees whose first name is "Duangkaew" and last names begin with "P."

	SELECT * FROM employees 
	WHERE first_name = 'Duangkaew' AND last_name LIKE 'P%';

6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
	SELECT employees.emp_no, employees.last_name, employees.first_name, 
	departments.dept_name
	FROM employees 
	INNER JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
	INNER JOIN departments ON dept_emp.dept_no=departments.dept_no
	WHERE departments.dept_name = 'Sales';


7. List all employees in the Sales and Development departments, including their employee number, last name, 
  --first name, and department name.

	SELECT employees.emp_no, employees.last_name, employees.first_name, 
	departments.dept_name
	FROM employees 
	INNER JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
	INNER JOIN departments ON dept_emp.dept_no=departments.dept_no
	WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

8. In ascending order, list the frequency count of employee last names, i.e., how many employees share each last name.
	
	select last_name, count(last_name) from employees
	group by last_name
	order by count(last_name) ASC;


## Bonus (Optional)

As you examine the data, you are overcome with a creeping suspicion that the dataset is fake. You surmise that 
your boss handed you spurious data in order to test the data engineering skills of a new employee. 
To confirm your hunch, you decide to take the following steps to generate a visualization of the data, 
with which you will confront your boss:

1. Import the SQL database into Pandas. (Yes, you could read the CSVs directly in Pandas, but you are, after all, 
trying to prove your technical mettle.) This step may require some research. 
Feel free to use the code below to get started. Be sure to make any necessary modifications for your 
username, password, host, port, and database name:

   ```sql
   from sqlalchemy import create_engine
   engine = create_engine('postgresql://localhost:5432/<your_db_name>')
   connection = engine.connect()
   ```

* Consult [SQLAlchemy documentation](https://docs.sqlalchemy.org/en/latest/core/engines.html#postgresql) for more information.

* If using a password, do not upload your password to your GitHub repository. See [https://www.youtube.com/watch?v=2uaTPmNvH0I](https://www.youtube.com/watch?v=2uaTPmNvH0I) and [https://martin-thoma.com/configuration-files-in-python/](https://martin-thoma.com/configuration-files-in-python/) for more information.

2. Create a bar chart of average salary by title.

3. You may also include a technical report in markdown format, in which you outline the data engineering steps taken in the homework assignment.

## Epilogue

Evidence in hand, you march into your boss's office and present the visualization. With a sly grin, your boss thanks you for your work. On your way out of the office, you hear the words, "Search your ID number." You look down at your badge to see that your employee ID number is 499942.
