--Please USE stu (fStudentId) accounts!
select * from employee;
select * from department;
select * from project;
--1. List employees ssn who do not have any dependent:
select ssn
from employee
minus
select essn
from dependent;
--2. List employees ssn who have the dependent record:
select ssn
from employee
intersect
select essn
from dependent;
--3. List all employees’ ssn and all managers mgrssn of the departments :
select ssn
from employee
union all
select mgrssn
from department;
--4. List SSN values of employees who are not listed as department managers.
select ssn
from employee
minus
select mgrssn
from department;
--5. List SSN values of employees who are also department managers.
select ssn
from employee
intersect
select mgrssn
from department;
--6. List the department numbers that have projects assigned:
select dnumber
from department
intersect
select dnum
from project;
--7. List department numbers without any assigned projects.
select dnumber
from department
minus
select dnum
from project;
--8. List all employees ( ssn, lname, pname, plocation) and the projects in their departments. If an employee’s
--department has no project assigned, the project columns (PNAME, PLOCATION) will show NULL.
select ssn, fname, lname, pname, plocation
from employee
left outer join department
    on (dno = dnumber)
left outer join project
    on (dnum = dnumber);
--9. List all employees and all projects, showing department-based associations where available. Departments
--with employees but no projects, as well as projects with no associated employees, will have NULL values in
--the relevant columns.
select ssn, fname, lname, dno, pnumber, pname, plocation, dnum
from employee
full outer join project
    on(dno = dnum);
