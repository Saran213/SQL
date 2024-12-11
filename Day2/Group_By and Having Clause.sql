--GROUP BY and HAVING Clause
use AtoZcompany;

/*List out the department wise maximum salary, minimum salary and
average salary of the employees.*/
select Department_Id, 
max(Salary) as 'Maximum Salary', min(Salary) as 'Minimum Salary',
avg(Salary) as 'Average Salary'
from Employee
group by Department_Id;

/*List out the job wise maximum salary, minimum salary and average
salary of the employees.*/
select Job_Id, max(Salary) as 'Maximum Salary', 
min(Salary) as 'Minimum Salary', avg(Salary) as 'Average Salary' 
from Employee
group by Job_Id;

--List out the number of employees who joined each month in ascending order.
select month(Hire_Date) Month, count(*) NoOfEmployees
from Employee
group by month(Hire_Date)
order by NoOfEmployees asc;

select Datename(mm, Hire_Date) Month,
	   count(*) NoOfEmployees
from Employee
group by Datename(mm, Hire_Date)
order by NoOfEmployees;

/*List out the number of employees for each month and year in
ascending order based on the year and month.*/
select  Datename(yy, Hire_Date) Year, 
		Datename(mm, Hire_Date) Month,
		count(*) NoOfEmployees
from Employee
group by Datename(yy, Hire_Date), Datename(mm, Hire_Date);

--List out the Department ID having at least four employees.
select Department_Id, count(*) NoOfEmployees from Employee
group by Department_Id
having count(Department_Id) >= 4;

--How many employees joined in February month.
select Datename(mm, Hire_Date) Month, 
	   count(*) NoOfEmployees
from Employee
group by Datename(mm, Hire_Date)
having DATENAME(mm, Hire_Date) = 'February';

--How many employees joined in May or June month.
-----WHERE Clause-----
select Datename(mm, Hire_Date) Month,
	   count(*) NoOfEmployees
from Employee
where Datename(mm, Hire_Date) = 'May' or Datename(mm, Hire_Date) = 'June'
group by DATENAME(mm, Hire_Date);

-----WHERE Clause with IN Operation-----
select Datename(mm, Hire_Date) Month,
	   count(*) NoOfEmployees
from Employee
where Datename(mm, Hire_Date) in ('May', 'June')
group by DATENAME(mm, Hire_Date);

-----HAVING Clause-----
select Datename(mm, Hire_Date) Month,
	   count(*) NoOfEmployees
from Employee
group by DATENAME(mm, Hire_Date)
having Datename(mm, Hire_Date) = 'May' or Datename(mm, Hire_Date) = 'June';

-----HAVING Clause with IN Operation-----
select Datename(mm, Hire_Date) Month,
	   count(*) NoOfEmployees from Employee
group by DATENAME(mm, Hire_Date)
having Datename(mm, Hire_Date) in ('May', 'June');

--How many employees joined in 1985?
select Datename(yy, Hire_Date) Year,
	   count(*) NoOfEmployee
from Employee
group by Datename(yy, Hire_Date)
having Datename(yy, Hire_Date) = 1985;

--How many employees joined each month in 1985?
select Datename(mm, Hire_Date) Month,
       Datepart(yy, Hire_Date) Year,
	   count(*) NoOfEmployees
from Employee
where Datepart(yy, Hire_Date) = 1985
group by Datepart(yy, Hire_Date), Datename(mm, Hire_Date);

--How many employees were joined in April 1985?select Datepart(yy, Hire_Date) Year,       Datename(mm, Hire_Date) Month,	   count(*) NoOfEmployeesfrom Employeewhere Datepart(yy, Hire_Date) = 1985 and Datename(mm, Hire_Date) = 'April'group by Datepart(yy, Hire_Date), Datename(mm, Hire_Date);/*Which is the Department ID having greater than or equal to 3 employees
joining in April 1985?*/
select Department_Id,
	   count(*) NoOfEmployees
from Employee
where Datepart(yy, Hire_Date) = 1985 and Datename(mm, Hire_Date) = 'April'
group by Department_Id
having count(*) >= 3;