--Practice 8-1: Using Subqueries to Solve Queries
--1. The HR department needs a query that prompts the user for an employee’s last name. The query then
--displays the last name and hire date of any employee in the same department as the employee whose
--name they supply (excluding that employee). For example, if the user enters Zlotkey, find all
--employees who work with Zlotkey (excluding Zlotkey).
select * from employees;
select last_name, hire_date
from employees
where department_id = (
    select department_id
    from employees
    where last_name = '&&name') and last_name != '&name';

--2. Create a report that displays the employee number, last name, and salary of all employees who earn
--more than Taylor’s salary. Sort the results in order of ascending salary.
--3. Write a query that displays the employee number and last name of all employees who work
--in a department with any employee whose last name contains the letter “u.” Save your SQL
--statement as lab_08_03.sql. Run your query.
--2
--4. The HR department needs a report that displays the last name, department number, and job ID of all
--employees whose department location ID is 1700. Modify the query so that the user is prompted for a
--location ID. Save this to a file named lab_08_04.sql.
--5. Create a report for HR that displays the last name and salary of every employee who reports to King.
--6. Create a report for HR that displays the department number, last name, and job ID for every employee
--in the Executive department.
--7. Create a report to display the employee number, last name, salary, and department_id of all
--employees who earn more than Taylor’s salary and who work in a department with employees whose
--last name contains a “g”.
--8. Create a report that displays a list of all employees whose salary is more than the salary of any
--employee from department 60.
--……
--3
--Practice 7-1: Retrieving Data by Using Subqueries
--Overview
--In this practice, you write multiple-column subqueries, and correlated and scalar subqueries.
--Task
--1. Write a query to display the last name, department number, and salary of any employee whose
--department number and salary both match the department number and salary of any employee who
--earns a commission.
--2. Display the last name, department name, and salary of any employee whose salary and commission
--match the salary and commission of any employee located in location ID 1700.
--3. Create a query to display the last name, hire date, and salary for all employees who have the same
--salary and commission as Kochhar.
--Note: Do not display Kochhar in the result set.
--4. Create a query to display the employees who earn a salary that is higher than the salary of all the
--sales managers (JOB_ID = 'SA_MAN'). Sort the results from the highest to the lowest.
--5. Display details such as the employee ID, last name, and department ID of those employees who live
--in cities the names of which begin with T.
--6.
--*** For this query, you will need to use grouping functions, so you may be able to solve it after you learn them.
--Write a query to find all employees who earn more than the average salary in their departments. Display
--last name, salary, department ID, and the average salary for the department. Sort by average salary and
--round to two decimals. Use aliases for the columns retrieved by the query as shown in the sample
--output.
--4
--7. Find all employees who are not supervisors.
--a. First, do this using the NOT EXISTS operator.
--b. Can this be done by using the NOT IN operator? How, or why not?
--8.
--*** For this query, you will need to use grouping functions, so you may be able to solve it after you learn them.
--Write a query to display the last names of the employees who earn less than the average salary in their
--departments.
--9. Write a query to display the last names of the employees who have one or more coworkers in their
--departments with later hire dates but higher salaries.
--10. Write a query to display the employee ID, last names, and department names of all the employees.
--Note: Use a scalar subquery to retrieve the department name in the SELECT statement.