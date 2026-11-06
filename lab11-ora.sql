--Practices for Lesson 7
--Practice 7-1: Displaying Data from Multiple Tables Using Joins
--1. Write a query for the HR department to produce the addresses of all the departments. Use the LOCATIONS and
--COUNTRIES tables. Show the location ID, street address, city, state or province, and country in the output. Use
--a NATURAL JOIN to produce the results.
select * from locations;
select * from countries;
select location_id, street_address, city, state_province, country_name
from locations
natural join countries;
--2. The HR department needs a report of only those employees with corresponding departments. Write a query to
--display the last name, department number, and department name for these employees.
select * from employees;
select * from departments;
select last_name, department_id, department_name
from employees
join departments
using (department_id)
order by department_id;
--3. The HR department needs a report of employees in Toronto. Display the last name, job, department number, and
--the department name for all employees who work in Toronto.
select last_name, job_id, e.department_id, d.department_name
from employees e
join departments d
    on (e.department_id = d.department_id)
join locations l
    on (l.location_id = d.location_id)
where city = 'Toronto';
--4. Create a report to display employees’ last name and employee number along with their manager’s last name and
--manager number. Label the columns Employee, Emp#, Manager, and Mgr#, respectively. Save your SQL
--statement as lab_07_04.sql. Run the query.
select e.last_name Employee, e.employee_id EMP#, m.last_name Manager, m.employee_id Mgr#
from employees e, employees m
where e.manager_id = m.employee_id;
--5. Modify lab_07_04.sql to display all employees including King, who has no manager. Order the results by the
--employee number. Save your SQL statement as lab_07_05.sql. Run the query in lab_07_05.sql.
select e.last_name Employee, e.employee_id EMP#, m.last_name Manager, m.employee_id Mgr#
from employees e
left outer join employees m
    on (e.manager_id = m.employee_id)
order by EMP#;
--6. Create a report for the HR department that displays employee last names, department numbers, and all the
--employees who work in the same department as a given employee. Give each column an appropriate label. Save
--the script to a file named lab_07_06.sql.
select e.department_id DEPARTMENT, e.last_name EMPLOYEE, c.last_name COLLEAGUE
from employees e
left outer join employees c
    on (e.department_id = c.department_id)
where e.employee_id != c.employee_id
order by e.department_id, EMPLOYEE;
--7. The HR department needs a report on job grades and salaries. To familiarize yourself with the JOB_GRADES
--table, first show the structure of the JOB_GRADES table. Then create a query that displays the name, job,
--department name, salary, and grade for all employees.
select * from job_grades;
select last_name, job_id, department_name, salary, grade_level
from job_grades, employees e
join departments d
    on (e.department_id = d.department_id)
where salary between lowest_sal and highest_sal;
--8. The HR department wants to determine the names of all the employees who were hired after Davies. Create a
--query to display the name and hire date of any employee hired after employee Davies.
select last_name, hire_date
from employees
where hire_date > (
    select hire_date
    from employees
    where last_name = 'Davies');
--9. The HR department needs to find the names and hire dates of all the employees who were hired before their
--managers, along with their managers’ names and hire dates. Save the script to a file named lab_07_09.sql.
select e.last_name, e.hire_date, m.last_name, m.hire_date
from employees e, employees m
where e.manager_id = m.employee_id and e.hire_date < m.hire_date;