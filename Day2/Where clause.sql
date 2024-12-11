--WHERE Clause
use AtoZcompany;

--List the details about Smith.
select * from Employee where Employee_Id = 7369;

--List out the employees who are working in department 20.
select * from Employee where Department_Id = 20;

--List out the employees who are earning salary between 2000 and 3000.
select * from Employee where salary between 2000 and 3000;

--List out the employees who are working in department 10 or 20.
select * from Employee where Department_Id = 10 or Department_Id = 20;

--Find out the employees who are not working in department 10 or 30.
select * from Employee where Department_Id = 10 or Department_Id = 30;

--List out the employees whose name starts with 'L'.
select Employee_Id, First_Name from Employee where First_Name Like 'L%';

--List out the employees whose name starts with 'L' and ends with 'E'.
select Employee_Id, First_Name from Employee where First_Name Like 'L%%e';

--List out the employees whose name length is 4 and start with 'J'.
select Employee_Id, First_Name 
from Employee 
where len(First_Name) = 4 and First_Name Like 'J%';

/*List out the employees who are working in 
department 30 and draw the salaries more than 2500.*/
select * from Employee 
where Department_Id = 30 and Salary > 2500;