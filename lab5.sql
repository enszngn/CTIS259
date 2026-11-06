--1. Create the DEPT2 table based on the following table instance chart. Enter the syntax in the SQL
--Worksheet. Then, execute the statement to create the table. Confirm that the table is created.
create table dept2 (
    id number(7),
    name varchar2(25)
);
desc dept2;
--2. Populate the DEPT2 table with data from the DEPARTMENTS table. Include only the columns that
--you need.
select * from departments;

insert into dept2 (id, name)
select department_id, department_name
from departments;
--3. Create the EMP2 table based on the following table instance chart. Enter the syntax in the SQL
--Worksheet. Then execute the statement to create the table. Confirm that the table is created.
create table emp2 (
    id number(7),
    last_name varchar2(25),
    first_name varchar2(25),
    dept_id number(7)
);

desc emp2;
--4. Modify the EMP2 table to allow for longer employee last names. Confirm your modification.
alter table emp2
modify (last_name varchar2(50));
desc emp2;
--5. Create the EMPLOYEES2 table based on the structure of the EMPLOYEES table. Include only the
--EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, and DEPARTMENT_ID columns. Name the
--columns in your new table ID, FIRST_NAME, LAST_NAME, SALARY, and DEPT_ID, respectively.
create table employees2 as
select employee_id id, first_name, last_name, salary, department_id dept_id
from employees;

desc employees2;
--6. Drop the EMP2 table.
drop table emp2;
--7. Query the recycle bin to see whether the table is present.
select *
from recyclebin;
--8. Restore the EMP2 table to a state before the DROP statement.
flashback table emp2 to before drop;
--9. Drop the FIRST_NAME column from the EMPLOYEES2 table. Confirm your modification by
--checking the description of the table.
alter table emp2
drop column first_name;
desc emp2;
--10. In the EMPLOYEES2 table, mark the DEPT_ID column as UNUSED. Confirm your modification by
--checking the description of the table.
alter table employees2
set unused (dept_id);
desc employees2;
--11. Drop all the UNUSED columns from the EMPLOYEES2 table. Confirm your modification by
--checking the description of the table.
alter table employees2
drop unused columns;
desc employees2;
--12. Add a table-level PRIMARY KEY constraint to the EMP2 table on the ID column. The constraint
--should be named at creation. Name the constraint my_emp_id_pk.
alter table emp2
add constraint my_emp_id_pk primary key (id);
desc emp2;
--13. Create a PRIMARY KEY constraint to the DEPT2 table using the ID column. The constraint
--should be named at creation. Name the constraint my_dept_id_pk.
alter table dept2
add constraint my_dept_id_pk primary key (id);
desc dept2;
--14. Add a foreign key reference on the EMP2 table that ensures that the employee is not assigned to
--a nonexistent department. Name the constraint my_emp_dept_id_fk.
alter table emp2
add constraint my_emp_dept_id_fk foreign key (dept_id) references departments (department_id);
--15. Modify the EMP2 table. Add a COMMISSION column of the NUMBER data type, precision 2, scale
--2. Add a constraint to the COMMISSION column that ensures that a commission value is greater than
--zero.
alter table emp2
add (
    commission number(2,2)
    constraint emp2_chk check (commission > 0));
desc emp2;
--16. Drop the EMP2 and DEPT2 tables so that they cannot be restored. Verify the recycle bin.
drop table emp2 purge;
drop table dept2 purge;
select * from recyclebin;
--CTIS259 3
--Part-II
--Using DDL Statements to Create and Manage Tables
--4. Create the EMPLOYEES3 table based on the structure of the EMPLOYEES table. Include only the
--EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, and DEPARTMENT_ID columns. Name the
--columns in your new table ID, FIRST_NAME, LAST_NAME, SALARY, and DEPT_ID, respectively.
create table employees3 as
select employee_id id, first_name, last_name, salary, department_id dept_id
from employees;
desc employees3;
--5. Alter the EMPLOYEES3 table status to read-only. Please note that this option is supported in
--Oracle Database 11ΩΩ
alter table employees3 read only;
--6. Try to insert the following row in the EMPLOYEES3 table:
insert into employees3
values ('Grant', 'Marcie', 5678, 10);
--You will get the following error message:
--7. Revert the EMPLOYEES3 table to the read/write status. Now, try to insert the same row again.
alter table employees3 read write;
--Please note that this option is supported in Oracle Database 11g. You should get the following
--messages:
insert into employees3
values (34, 'Grant', 'Marcie', 5678, 10);
--8. Drop the EMPLOYEES3 table.
drop table employees3;