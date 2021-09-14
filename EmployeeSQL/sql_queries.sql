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
	 
--- 4 List the department of each employee with the following information: 
---        employee number, last name, first name, and department name.

select em.emp_no, em.last_name, em.first_name, dp.dept_name
from (employees em 
left join dept_emp de on (em.emp_no = de.emp_no)) 
left join departments dp on (de.dept_no= dp.dept_no) 
order by emp_no;

--- 5 List first name, last name, and sex for employees whose 
---      first name is "Hercules" and last names begin with "B."

select first_name, last_name, sex from employees 
where (first_name='Hercules' and (SELECT LEFT(last_name, 1))='B');

--- 6 List all employees in the Sales department, including their 
---          employee number, last name, first name, and department name.

select em.emp_no, em.last_name, em.first_name, dp.dept_name
from ((employees em 
	 left join dept_emp de on (em.emp_no = de.emp_no))
	 left join departments dp on (de.dept_no=dp.dept_no)) 
	 where dept_name='Sales';
	 
--- 7 List all employees in the Sales and Development departments, 
---    including their employee number, last name, first name, and department name.

select em.emp_no, em.last_name, em.first_name, dp.dept_name
from ((employees em 
	 left join dept_emp de on (em.emp_no = de.emp_no))
	 left join departments dp on (de.dept_no=dp.dept_no)) 
	 where ( dept_name='Sales' or dept_name='Development');
	 
--- 8 In descending order, list the frequency count of employee last names, 
---         i.e., how many employees share each last name.

select last_name, count(last_name) as "Last name count"
from employees
group by last_name
order by "Last name count" desc; 
