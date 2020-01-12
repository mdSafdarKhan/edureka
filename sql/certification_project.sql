#---------------DATA DEFINITION LANGUAGE (DDL)--------------------

#1.Create department table with following columns
create table department(
dept_id integer primary key,
dept_name nvarchar(100) not null,
contact_no integer unique
);

#2.Create employee table with following columns
create table employee(
emp_id integer primary key,
dept_id integer not null,
emp_name nvarchar(100),
designation nvarchar(100),
salary decimal(13,2),
constraint fk_dept_id foreign key(dept_id) references department(dept_id)
);

#3.ADD A NEW CLOUMN IN DEPARTMENT TABLE
alter table department add city nvarchar(50);

#4.CHANGE THE DATATYPE OF SALARY TO CHAR(10) IN EMPLOYEEData Type: Change from Money to Char (10);
alter table employee modify column salary char(10);

#5.DELETE THE ‘CITY’ COLUMN FROM THE DEPARTMENT TABLE Column: City
alter table department drop column city;

#6.RENAME A COLUMN(D_NAME) IN DEPARTENT TABLE to (Dept_NAME)
alter table department change dept_name d_name varchar(100);

#---------------DATA MANIPULATION LANGUAGE (DML)--------------------

#First create corresponding table
create table emp(
emp_id character(10) primary key,
dept_id character(10) not null,
emp_name nvarchar(20),
designation nvarchar(20),
salary numeric,
contact_no nvarchar(10),
city nvarchar(20)
);
desc emp;

#Insert Values in employee table
insert into emp(emp_id, dept_id, emp_name, designation, salary, contact_no, city) values('emp_1', 'dep_1', 'S Ahmed', 'Sales Mgr', 50000, '0110', 'New Delhi');
insert into emp(emp_id, dept_id, emp_name, designation, salary, contact_no, city) values('emp_2', 'dep_2', 'Anand', 'Senior Mgr', '40000', '0111', 'New Delhi');
insert into emp(emp_id, dept_id, emp_name, designation, salary, contact_no, city) values('emp_3', 'dep_3', 'Aruna', 'Accounts Mgr', '45000', '0112', 'New Delhi');
insert into emp(emp_id, dept_id, emp_name, designation, salary, contact_no, city) values('emp_4', 'dep_3', 'Alpesh', 'Accountant', '35000', '0113', 'Banglore');
insert into emp(emp_id, dept_id, emp_name, designation, salary, contact_no, city) values('emp_5', 'dep_1', 'Monica', 'Incharge', '25000', '0114', 'Noida');
insert into emp(emp_id, dept_id, emp_name, designation, salary, contact_no, city) values('emp_6', 'dep_1', 'Harish', 'Sales Man', '15000', '0115', 'Banglore');
 
select * from emp;

#7.Update the Contact_No of employee who stays in ‘Bangalore’ and id = 6
update emp set contact_no='1116' where city='Banglore' and emp_id='emp_6';

#8.Select given selective columns from employee table EMP_ID, EMP_NAME DESIG
select emp_id, emp_name, designation from emp;

#9.Select all details of employee whose salary is greater than 30000.
select * from emp where salary>30000;

#10.Select details of employee whose salary is between 15000 and 30000
select * from emp where salary between 15000 and 30000;

#11.Select * from employee who lives in ‘Bangalore’ or ‘New Delhi’
select * from emp where city='Banglore' or city='New Delhi';

#12.Select * from employee who do not stay in cities ‘Bangalore’ and ‘New Delhi’
select * from emp where not (city='Banglore' or city='New Delhi');

#13. Select details of employee whose name starts with character ‘A’
select * from emp where emp_name like 'A%';

#14. Arrange the details of employee in descending order of their salary.
select * from emp order by salary desc;

#15. Retrieve the average salary of employee per department.
select avg(salary) as avgSalary from emp group by dept_id;

#16. Get the details of Employee( dept_id, Salary) and its average salary whose average salary is greater than 30000
select dept_id, salary, avg(salary) from emp where salary > 30000 group by salary;

#------------------------- JOINS, STORED PROCEDURE AND VIEW--------------------------------

#Step1. Create Company Table 
create table company(
id integer primary key,
nam varchar(50),
age integer,
address nvarchar(50),
salary decimal(8,2),
join_date date
);
desc company;

#Step2. Insert below data in Company Table.
insert into company(id, nam, age, address, salary, join_date) value(1, 'PAUL', 32, 'CALIFORNIA', 20000.00, '2001-07-13');
insert into company(id, nam, age, address, salary, join_date) value(2, 'TEDDY', 25, 'LOG VEGAS', null, '2013-09-01');
insert into company(id, nam, age, address, salary, join_date) value(3, 'ALLEN', 23, 'NORWAY', 20000.00, null);
insert into company(id, nam, age, address, salary, join_date) value(4, 'DAVID', 25, 'RICHMOND', 65000.00, '2010-10-25');
insert into company(id, nam, age, address, salary, join_date) value(5, 'MARK', 27, 'TEXAS', 35000.00, '2015-11-02');

#Step4. Insert below data in dept table
insert into department (id, dep, emp_id) values(1, 'IT BILLING', 1);
insert into department (id, dep, emp_id) values(2, 'ENINERRING', 2);
insert into department (id, dep, emp_id) values(3, 'FINANCE', 41);

#17. Query1. Fetch following details for employee with id = 2
#Emp_Id
#Name
#Dept
#Dept_Id
#Age
#Salary

select c.id, c.nam, d.dep as deptName, d.id as deptId, c.age, c.salary from company c inner join department d on c.id=d.emp_id where c.id=2;

#18.Create a stored procedure to fetch following columns from Company and Dept2 table based on a given emp id.
#Emp_Id
#Name
#Dept ,
#Dep_Id,
#Age
#Salary

 DELIMITER //
 CREATE PROCEDURE getEmployees()
   BEGIN
	select c.id, c.nam, d.dep as deptName, d.id as deptId, c.age, c.salary from company c inner join department d on c.id=d.emp_id;
   END 
//
call getEmployees();

#19.Create a view to fetch the details of employee with following columns
 #Emp_Id
 #Name
 #Dept ,
 #Dep_Id,
 #Age
 #Salary
 
create view emp_details as
select c.id, c.nam, d.dep as deptName, d.id as deptId, c.age, c.salary from company c 
inner join department d on c.id=d.emp_id;

select * from emp_details;
