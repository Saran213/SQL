--WHERE Clause
use AtoZcompany;

--List out the Employee ID and Last Name in ascending order based on the Employee ID.
select Employee_Id, Last_Name from Employee
order by Last_Name asc;

--List out the Employee ID and Name in descending order based on salary.
select Employee_Id, 
First_Name + ' ' + Last_Name as 'Employee Name' 
from Employee
order by salary desc;

--List out the employee details according to their Last Name in ascending-order.
select * from Employee
order by Last_Name desc;

/*List out the employee details according to their Last Name in ascending
order and then Department ID in descending order.*/
select * from Employee
order by Last_Name asc,
Department_Id desc;