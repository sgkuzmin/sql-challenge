--- 1 List the following details of each employee: employee number, last name, first name, sex, and salary.

select e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
from employees e
join salaries s on (e.emp_no = s.emp_no);

--- 2 List first name, last name, and hire date for employees who were hired in 1986.

select first_name, last_name, hire_date from employees where extract(year from hire_date) = 1986;

--- 3 List the manager of each department with the following information: department number, 
---      department name, the manager's employee number, last name, first name.

select dp.dept_no, dp.dept_name, dm.emp_no, em.last_name, em.first_name 
from (departments dp 
left join dept_manager dm on (dp.dept_no = dm.dept_no)
	 left join employees em on (dm.emp_no=em.emp_no))
	 order by dept_no;



