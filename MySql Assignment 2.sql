drop database employee;
create database employee;
use employee;

create table Departments(department_id int primary key,department_name varchar(100) not null unique);
create table Location(location_id int auto_increment primary key,location varchar(30) not null unique);

create table Employees(employee_id int primary key,employee_name varchar(50) not null,gender enum('M','F'),age int check (age>=18),
hire_date date,designation varchar(100),department_id int,location_id int,salary decimal(10,2),
foreign key(department_id) references Departments(department_id),foreign key(location_id) references Location (location_id));

insert into Departments(department_id,department_name)values(1, 'Software Development'),
(2, 'Marketing'),
(3, 'Data Science'),
(4, 'Human Resources'),
(5, 'Product Management'),
(6, 'Content Creation'),
(7, 'Finance'),
(8, 'Design'),
(9, 'Research and Development'),
(10, 'Customer Support'),
(11, 'Business Development'),
(12, 'IT'),
(13, 'Operations');
insert into Location(location)values('Chennai'),('Bangalore'),('Hyderabad'),('Pune');

insert into Employees(employee_id,employee_name,gender,age,hire_date,designation,department_id,location_id,salary)values
(5001, 'Vihaan Singh', 'M', 27, '2015-01-20', 'Data Analyst', 3, 4, 60000),
(5002, 'Reyansh Singh', 'M', 31, '2015-03-10', 'Network Engineer', 12, 1, 80000),
(5003, 'Aaradhya Iyer', 'F', 26, '2015-05-20', 'Customer Support Executive', 10, 2, 45000),
(5004, 'Kiara Malhotra', 'F', 29, '2015-07-05', NULL, 8, 3, 70000),
(5005, 'Anvi Chaudhary', 'F', 25, '2015-09-11', 'Business Development Executive', 11, 1, 55000),
(5006, 'Dhruv Shetty', 'M', 28, '2015-11-20', 'UI Developer', 8, 2, 65000),
(5007, 'Anushka Singh', 'F', 32, '2016-01-15', 'Marketing Manager', 2, 3, 90000),
(5008, 'Diya Jha', 'F', 27, '2016-03-05', 'Graphic Designer', 8, 4, 70000),
(5009, 'Kiaan Desai', 'M', 30, '2016-05-20', 'Sales Executive', 11, 3, 55000),
(5010, 'Atharv Yadav', 'M', 29, '2016-07-10', 'Systems Administrator', 12, 4, 80000),
(5011, 'Saanvi Patel', 'F', 28, '2016-09-20', 'Marketing Analyst', 2, 1, 60000),
(5012, 'Myra Verma', 'F', 26, '2016-11-05', 'Operations Manager', 13, 2, 95000),
(5013, 'Arnav Rao', 'M', 33, '2017-01-20', 'Customer Success Manager', 10, 3, 75000),
(5014, 'Vihaan Mohan', 'M', 30, '2017-03-10', 'Supply Chain Analyst', 10, 2, 60000),
(5015, 'Ishaan Kumar', 'M', 27, '2017-05-20', 'Financial Analyst', 7, 1, 85000),
(5016, 'Zoya Khan', 'F', 31, '2017-07-05', 'Legal Counsel', 4, 4, 100000),
(5017, 'Kabir Nair', 'M', 28, '2017-09-11', 'IT Support Specialist', 12, 2, 80000),
(5018, 'Ishan Mishra', 'M', 25, '2017-11-20', 'Research Scientist', 9, 3, 75000),
(5019, 'Ishika Patel', 'F', 29, '2018-01-15', 'Talent Acquisition Specialist', 4, 4, 55000),
(5020, 'Aarav Nair', 'M', 32, '2018-03-05', 'Software Engineer', 1, 1, 90000),
(5021, 'Advik Kapoor', 'M', 26, '2018-05-20', 'Finance Analyst', 7, 3, 85000),
(5022, 'Aadhya Iyengar', 'F', 28, '2018-07-10', 'HR Specialist', 4, 4, 60000),
(5023, 'Anika Paul', 'F', 30, '2018-09-20', 'Public Relations Specialist', 2, 2, 70000),
(5024, 'Aryan Shetty', 'M', 27, '2018-11-05', 'Product Manager', 5, 1, 95000),
(5025, 'Avni Iyengar', 'F', 31, '2019-01-20', 'Data Scientist', 3, 4, 100000),
(5026, 'Vivaan Singh', 'M', 29, '2019-03-10', 'Business Analyst', 3, 2, 75000),
(5027, 'Ananya Paul', 'F', 32, '2019-05-20', 'Content Writer', 6, 3, 60000),
(5028, 'Anaya Kapoor', 'F', 26, '2019-07-05', 'Event Coordinator', 6, 1, 60000),
(5029, 'Arjun Kumar', 'M', 33, '2019-09-11', 'Quality Assurance Analyst', 12, 2, 80000),
(5030, 'Sara Iyer', 'F', 28, '2019-11-20', 'Project Manager', 5, 1, 90000);

select * from Departments;
select * from Location;
select * from Employees;

select distinct salary from Employees;
select age as Employee_Age,salary as Employee_Salary from Employees;
select * from Employees where salary > 50000 and hire_date < '2016-01-01';
select * from Employees where designation is null;
update Employees set designation = 'Data Scientist' where designation is null;

#sorting and grouping data
select * from Employees order by department_id asc,salary desc;
select * from Employees where year(hire_date) = 2018 order by hire_date asc limit 5;

#Aggregate functions
select sum(salary) as Total_salary from Employees where department_id = 7;
select min(age) as Minimum_age from Employees;

#group by
select location_id,max(salary) as maximum_salary from Employees group by location_id;
select designation,avg(salary) as average_salary from Employees where designation like '%Analyst%' group by designation;

#having
select department_id, count(employee_id) as Employee_count from Employees group by department_id having count(employee_id) < 3;
select location_id, avg(age) as Average_Age from Employees where gender = 'F' group by location_id having avg(age) < 30;

#joins
select Employees.employee_name,Employees.designation,Departments.department_name 
from Employees inner join Departments on Employees.department_id = Departments.department_id;

select Departments.department_name,count(Employees.employee_id) as Total_Employees from Departments left join Employees
on Departments.department_id = Employees.department_id
group by Departments.department_id, Departments.department_name;

select Location.location,Employees.employee_name from Employees right join Location
on Employees.location_id = Location.location_id;




