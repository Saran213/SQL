--Sub Queries
use AtoZCompany;

--Display the employees list who got the maximum salary.
select * from Employee
where salary = (
	select MAX(Salary) from Employee
);

--Display the employees who are working in the sales department.
select * from Department;
select * from Employee
where Department_Id = (
	select Department_Id from Department
	where Name = 'Sales'
);

--Display the employees who are working as 'Clerk'.
select * from Job;
select * from Employee
where Job_Id = (
	select Job_Id from Job
	where Designation = 'Clerk'
);

--Display the list of employees who are living in 'Boston'.
select * from Location
select * from Department
select * from Employee
where Department_Id = (
	select Department_Id from Department
	where Location_Id = (
		select Location_Id from Location 
		where city = 'Boston'
	)
);

--Find out the number of employees working in the sales department.
select count(*) NoOfEmployees from Department
where Department_Id = (
	select Department_Id from Department
	where Name = 'Sales'
);

--Update the salaries of employees who are working as clerks on the basis of 10%.
select Salary * 0.10 + Salary from Employee
update Employee
set Salary = Salary * 0.10 + Salary
where Job_Id = (
	select Job_Id from Job
	where Designation = 'Clerk'
);
select * from Employee;

--Display the second highest salary drawing employee details.
select * from Employee
where Salary = (
	select MAX(Salary) from Employee
	where Salary < (select max(Salary) from Employee)
);

--List out the employees who earn more than every employee in department 30.
select max(Salary) from Employee
where Department_Id = (
	select Department_Id from Employee
	where Department_Id = 30
);

--Find out which department has no employees.
select * from Department
where Department_Id not in (
	select Department_Id from Employee
);

/*Find out the employees who earn greater than the average salary for
their department.*/
select * from Employee
where Salary > (
	select avg(Salary) from Employee
);