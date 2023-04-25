-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/te9E5o
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "departments" (
    "dept_no" varchar   NOT NULL,
    "dept_name" varchar   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar   NOT NULL,
    "emp_no" int   NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "emp_title_id" varchar   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "sex" varchar   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL
);

CREATE TABLE "title" (
    "title_id" varchar   NOT NULL,
    "title" varchar   NOT NULL,
    CONSTRAINT "pk_title" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "title" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

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