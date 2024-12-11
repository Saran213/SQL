--Case study
create database AtoZcompany;

use AtoZcompany;

--Location table
create table Location(
	Location_ID int,
	city varchar(30),
	Primary Key(Location_ID)
);

--inserting values to Location table
insert into Location values
(122, 'New York'), (123, 'Dallas'),
(124, 'Chicago'), (167, 'Boston');

select * from Location;

--Department table
create table Department(
	Department_Id int,
	Name varchar(30),
	Location_Id int,
	Primary Key(Department_Id),
	Foreign Key(Location_Id) References Location(Location_ID)
);

--inserting values into Department table
insert into Department values
(10, 'Accounting', 122), (20, 'Sales', 124),
(30, 'Research', 123), (40, 'Operations', 167);

select * from Department;

--Job table
create table Job(
	Job_ID int,
	Designation varchar(30)
	Primary Key(Job_ID)
);

--inserting values into Job table
insert into Job values
(667, 'Clerk'), (668, 'Staff'),
(669, 'Analyst'), (670, 'Sales Person'),
(671, 'Manager'), (672, 'President');

select * from Job;

--Employee table
create table Employee(
	Employee_Id int,
	Last_Name varchar(30),
	First_Name varchar(30),
	Middle_Name varchar(30),
	Job_Id int,
	Hire_Date date,
	Salary int,
	Comm int,
	Department_Id int
	Primary Key(Employee_Id),
	Foreign Key(Job_Id) References Job(Job_ID),
	Foreign Key(Department_Id) References Department(Department_Id)
);

--inserting into Employee table
insert into Employee values
(7369, 'Smith', 'John', 'Q', 667, '17-Dec-84', 800, Null, 20);

insert into Employee values
(7499, 'Allen', 'Kevin', 'J', 670, '20-Feb-85', 1600, 300, 30),
(755, 'Doyle', 'Jean', 'K', 671, '04-Apr-85', 2850, Null, 30),
(756, 'Dennis', 'Lynn', 'S', 671, '15-May-85', 2750, Null, 30),
(757, 'Baker', 'Leslie', 'D', 671, '10-Jun-85', 2200, Null, 40),
(7521, 'Wark', 'Cynthia', 'D', 670, '22-Feb-85', 1250, 50, 30);

select * from Employee;