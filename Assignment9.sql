create table employees(eid varchar(6),ename varchar(20),salary number(10),age number(2));
insert into employees values(1001,'Ramesh',20000,50);
insert into employees values(1002,'Suresh',30000,80);
insert into employees values(1003,'Mukesh',40000,20);
insert into employees values(1004,'Meena',50000,60);
insert into employees values(1005,'Jaya',60000,30);
select * from employees;
select * from employees where salary=( select max(salary) from employees where salary <(select max(salary) from employees)); /* Write a query to find out the second highest salary of the employee from employee table.*/
select * from employees where salary=( select min(salary) from employees where salary >(select min(salary) from employees)); /* Write a query to find out the second lowest salary of the employee from employee table.*/
create table newtable as select eid,ename,salary*12 annualSalary from employees; /* Create a table using the existing table. */
select * from newtable;
insert into employees values(1004,'Meena',50000,60);
insert into employees values(1005,'Jaya',60000,30);
delete from employees where rowid not in(select max(rowid) from employees group by eid); /* Write a query to delete duplicate rows from employee table.*/
select * from employees;
select * from (select eid,ename,salary,dense_rank() over (order by salary desc) ranking from employees) where ranking = 4; /* Write a query to find out the nth highest salary of the employee from employee table.*/
select * from (select eid,ename,salary,dense_rank() over (order by salary asc) ranking from employees) where ranking = 4; /* Write a query to find out the nth lowest salary of the employee from employee table.*/
