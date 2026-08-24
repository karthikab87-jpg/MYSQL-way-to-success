create database employee;
use employee;

#table creation
create table Departments(department_id int primary key,department_name varchar(100)); 
create table Location(location_id int primary key,location varchar(30));

create table Employees(employee_id int primary key,employee_name varchar(50),gender enum("M","F"),age int,
hire_date date default (current_date),designation varchar(100),department_id int,location_id int,salary decimal(10,2),
foreign key(department_id) references Departments(department_id),foreign key(location_id) references Location (location_id));

insert into Departments(department_id,department_name)values(1,"HR"),(2,"Finance"),(3,"IT");
insert into Location(location_id,location)values(1,"Bangalore"),(2,"Chennai"),(3,"Kochi");
insert into Employees
(employee_id, employee_name, gender, age,designation, department_id, location_id, salary)
values(101, "Manu", "M", 25, "HR Executive", 1, 1, 35000.50),(102, "Neenu", "F", 28, "Accountant", 2, 2, 40000.02),
(103, "Chetan", "M", 32, "Software Developer", 3, 3, 55000.00);

select * from Departments;
select * from Location;
select * from Employees;

#table alteration
alter table Employees add email varchar(100);
alter table Employees modify designation varchar(150);
alter table Employees drop column age;
alter table Employees rename column hire_date to date_of_joining;
select * from Employees;

#table renaming
Rename table Departments to Departments_Info;
Rename table Location to Locations;

Truncate table Employees;
drop table Employees;
drop database employee;

#database recreation
create database employee;
use employee;

create table Departments(department_id int primary key,department_name varchar(100) not null unique);
create table Location(location_id int auto_increment primary key,location varchar(30) not null unique);

create table Employees(employee_id int primary key,employee_name varchar(50) not null,gender enum("M","F"),age int check (age>=18),
hire_date date default (current_date),designation varchar(100),department_id int,location_id int,salary decimal(10,2),
foreign key(department_id) references Departments(department_id),foreign key(location_id) references Location (location_id));

insert into Departments(department_id,department_name)values(1,"HR"),(2,"Finance"),(3,"IT");
insert into Location(location)values("Bangalore"),("Chennai"),("Kochi");
insert into Employees
(employee_id, employee_name, gender, age,designation, department_id, location_id, salary)
values(101, "Manu", "M", 25, "HR Executive", 1, 1, 35000.50),(102, "Neenu", "F", 28, "Accountant", 2, 2, 40000.02),
(103, "Chetan", "M", 32, "Software Developer", 3, 3, 55000.00);

select * from Departments;
select * from Departments order by department_id asc;
select * from Location;
use employee;
desc Employees;
select * from Employees;



