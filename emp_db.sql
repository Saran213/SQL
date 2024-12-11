create database emp;

use emp;

CREATE TABLE EMPLOYEE (  
 emp_id int identity,  
 fullname varchar(65),  
 occupation varchar(45),  
 gender varchar(30),  
 salary int,  
 country varchar(55)  
);  



INSERT INTO EMPLOYEE(fullname, occupation, gender, salary, country)  
VALUES ('John Doe', 'Writer', 'Male', 62000, 'USA'),  
('Mary Greenspan', 'Freelancer', 'Female', 55000, 'India'),  
('Grace Smith', 'Scientist', 'Male', 85000, 'USA'),  
('Mike Johnson', 'Manager', 'Male', 250000, 'India'),  
('Todd Astel', 'Business Analyst', 'Male', 42000, 'India'),  
('Sara Jackson', 'Engineer', 'Female', 65000, 'UK'),  
('Nancy Jackson', 'Writer', 'Female', 55000, 'UK'),  
('Rose Dell', 'Engineer', 'Female', 58000, 'USA'),  
('Elizabeth Smith', 'HR', 'Female', 55000, 'UK'),  
('Peter Bush', 'Engineer', 'Male', 42000, 'USA');  

select * from employee;

--find total salary for all countries
select sum(Salary) as 'Total Salary' from EMPLOYEE;

--find total salary for Indian Employees
select sum(Salary) as 'Total Salary' from EMPLOYEE
where country = 'India';

--find total salary for India and US only
select sum(Salary) as 'Total Salary' from EMPLOYEE
where country in ('India', 'USA');

--using group by and where display total salary for India and US only
select country, sum(Salary) as 'Total Salary'
from EMPLOYEE
where country in ('India','USA')
group by country;

--display total salary for Indian emp and US in single row
select sum(case when country='India' then salary else 0 end)
as 'Total Salary for India',
sum(case when country='USA' then salary else 0 end)
as 'Total Salary for USA'
from EMPLOYEE

--display total after using group by
select coalesce(country, 'Total') as 'Country', sum(Salary) as 'Total Salary'
from EMPLOYEE
group by Rollup (country);

--use of multiple group by
select coalesce(gender, 'Grand Total'), coalesce(country, 'Total') as 'Country', 
sum(Salary) as 'Total Salary'
from EMPLOYEE
group by gender, country with Rollup;

select coalesce(gender, 'Grand Total'), coalesce(country, 'Total') as 'Country', 
sum(Salary) as 'Total Salary'
from EMPLOYEE
group by country, gender with Rollup;