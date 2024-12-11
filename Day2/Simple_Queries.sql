use AtoZcompany;--List all the employee details.select * from Employee;--List all the department details.select * from Department;--List all job details.
select * from Job;

--List all the locations.
select * from Location;

--List out the First Name, Last Name, Salary, Commission for all Employees.
select First_Name, Last_Name, Salary, Comm from Employee;

/*List out the Employee ID, Last Name, Department ID for all employees and
alias Employee ID as "ID of the Employee", Last Name as "Name of the
Employee", Department ID as "Dep_id".*/
select Employee_Id as 'ID of the Employee',
Last_Name as 'Name of the Employee', Department_Id as 'Dep_id' from Employee;

--List out the annual salary of the employees with their names only.
select First_Name + ' ' + Last_Name as 'Employee_Name', salary*12 from Employee;