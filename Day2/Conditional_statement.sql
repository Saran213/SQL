--Conditional Statements
use AtoZcompany;

select * from Employee;

/*Display the employee details with salary grades. Use conditional statement to
create a grade column.*/
select e.*,
	   case
		when Salary >= 2500 then 'A'
		when Salary between 1500 and 2500 then 'B'
	   else 'C'
	   end as 'Grade'
from Employee e;
Go

/*List out the number of employees grade wise. Use conditional statement to
create a grade column.*/
select Grade, count(*) NoOfEmployee 
from(
	select e.*,
	   case
		when Salary >= 2500 then 'A'
		when Salary between 1500 and 2500 then 'B'
	   else 'C'
	   end as 'Grade'
	from Employee e
) as Grades
group by Grade;

/*Display the employee salary grades and the number of employees between
2000 to 5000 range of salary*/
select Grade, count(*) NoOfEmployee
from(
	select e.*,
	   case
		when Salary >= 2000 then 'A'
		when Salary between 1500 and 2500 then 'B'
	   else 'C'
	   end as 'Grade'
	from Employee e
) as Grades
where Grade = 'A'
group by Grade;