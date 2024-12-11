--Joins 
use AtoZcompany;

--List out employees with their department names.
select Employee.*, Department.Name 
from Employee join Department
on
Employee.Department_Id = Department.Department_Id;

--Display employees with their designations.
select Employee.*, Job.Designation from Employee join Job
on
Employee.Job_Id = Job.Job_ID;

--Display the employees with their department names and city.
select e.*, d.Name, l.city from Employee e join Department d
on
e.Department_Id = d.Department_Id
join Location l
on
d.Location_Id = l.Location_ID;

/*How many employees are working in different departments? Display with
department names.*/
select d.Name, count(*) NoOfEmployees from Employee e join Department d
on
e.Department_Id = d.Department_Id
group by d.Name;

--How many employees are working in the sales department?
select count(*) Sales_Department from Employee e join Department d
on
e.Department_Id = d.Department_Id
where d.Name = 'Sales'
group by d.Name;

/*Which is the department having greater than or equal to 3
employees and display the department names in
ascending order.*/select d.Name, count(*) NoOfEmployees from Employee e join Department done.Department_Id = d.Department_Idgroup by d.Department_Id, d.Namehaving count(*) >= 3;--How many employees are working in 'Dallas'?select l.city, count(*) NoOfEmployees from Employee e join Department done.Department_Id = d.Department_Idjoin Location lon d.Location_Id = l.Location_IDgroup by l.cityhaving l.city = 'Dallas';--Display all employees in sales or operation departments.select d.Name, e.Employee_Id from Employee e join Department done.Department_Id = d.Department_Idwhere d.Name = 'Sales' or d.Name = 'Operation'group by d.Name, e.Employee_Id;