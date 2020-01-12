#CREATE DATABASE
create database edureka_sql_training;

#CREATE TABLE
create table employee(
	empId numeric(4),
    first_name varchar(40),
    last_name varchar(40),
    mgr_id numeric(4),
    hire_date date,
    job_id numeric(2),
    deptno numeric(2)
);

#DELETE TABLE
drop table employee;

#DESCRIBE TABLE
desc employee;

#ALTER TABLE SAMPLE COMMANDS
#alter table employee add columnName numeric(4);
#alter table employee drop columnName;
#alter table employee alter column columnName int;

#ADD COLUMN TO THE TABLE
alter table employee add dob date;

#DELETE COLUMN TO THE TABLE
alter table employee drop dob;

#MODIFY COLUMN OF A TABLE
#alter table employee alter column varchar(30);

#VARIOUS CONSTRAINTS
#NOT NULL
#UNIQUE
#PRIMARY KEY
#FOREIGN KEY
#CHECK

#Primary Key
create table emp(
	emp_id int primary key,
    first_name varchar(20) not null,
    last_name varchar(20) not null
);
desc emp;
create table emp1(
	emp_id int,
    first_name varchar(20) not null,
    last_name varchar(20) not null,
    constraint emp_pk primary key (emp_id)
);
desc emp1;
create table emp2(
	first_name varchar(20),
    last_name varchar(20),
    salary numeric(10),
    constraint emp_pk2 primary key(first_name, last_name)
);
desc emp2;
create table emp3(
	emp_id int,
    first_name varchar(10),
    last_name varchar(10)
);
desc emp3;
alter table emp3 add constraint emp_pk3 primary key(emp_id);
desc emp3;

#FOREIGN KEY
create table product(
	prod_id int primary key,
    prod_name varchar(20) not null,
    category varchar(20)
);
desc product;
create table orders(
	order_id int primary key,
    prod_id int not null,
    quantity int,
    constraint fk_product_id foreign key(prod_id) references product(prod_id)
);
desc orders;






