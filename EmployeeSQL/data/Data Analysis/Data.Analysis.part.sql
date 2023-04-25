SELECT employees.emp_no, 
       employees.first_name, 
	   employees.last_name, 
	   employees.sex,
	   salaries.salary
	   FROM public.salaries
	   JOIN employees
	   ON employees.emp_no = salaries.emp_no

SELECT Extract(YEAR FROM hire_date) AS year_only
      ,employees.first_name
      ,employees.last_name
	   FROM public.employees
	   WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';
-- 	   WHERE employees.year_only = 1986;
select employees.first_name
	   ,employees.last_name
	   ,dept_manager.dept_no
	   ,dept_manager.emp_no
	   ,departments.dept_name
	   FROM dept_manager 
	   INNER JOIN departments
	   on dept_manager.dept_no = departments.dept_no
	   INNER JOIN employees 
	   on dept_manager.emp_no = employees.emp_no 

SELECT employees.first_name
	  ,employees.last_name
	  ,dept_emp.dept_no
	  ,dept_emp.emp_no
	  ,departments.dept_name	  
	  from dept_emp
	  INNER JOIN departments
	  on dept_emp.dept_no = departments.dept_no
	  INNER JOIN employees
	  on dept_emp.emp_no = employees.emp_no
	  
SELECT first_name, last_name, sex FROM employees
WHERE last_name LIKE 'B%';

SELECT employees.first_name
	  ,employees.last_name
	  ,departments.dept_name
	  ,dept_emp.emp_no 
	  FROM dept_emp
	  INNER JOIN employees
	  on dept_emp.emp_no = employees.emp_no
	  INNER JOIN departments 
	  on dept_emp.dept_no = departments.dept_no
	  WHERE departments.dept_name = 'Sales';
	  
SELECT employees.first_name
	  ,employees.last_name
	  ,departments.dept_name
	  ,dept_emp.emp_no 
	  FROM dept_emp
	  INNER JOIN employees
	  on dept_emp.emp_no = employees.emp_no
	  INNER JOIN departments 
	  on dept_emp.dept_no = departments.dept_no
	  WHERE departments.dept_name IN ('Development', 'Sales');

SELECT last_name, COUNT(*) AS last_name_frequency_count
FROM employees
GROUP BY last_name
ORDER BY last_name_frequency_count DESC;
	  

	  

	  
	  
	  
	  
	   

	
	   

	   
   