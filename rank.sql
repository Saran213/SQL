use retail;

select c.cnum as cnum, cname, city, rating, snum, total_sales,
onum, amt, odate, o.cnum as cust_no
from customer c join orders o
on c.cnum = o.cnum;

create view customer_orders
as
select c.cnum as customer_no, cname, city, rating, snum, total_sales,
onum, amt, odate, o.cnum as cust_no
from customer c join orders o
on c.cnum = o.cnum;


select * from customer_orders;

--display customer name, num and the max order amt
select customer_no, cname, max(amt) as 'Highest Order Value'
from customer_orders
group by customer_no, cname;

--join 3 tables
select s.snum as snum, sname, s.city as 'salesperson_city', comm,
c.cnum as cnum, cname, c.city as 'customer_city', rating, total_sales,
onum, amt, odate
from salespeople s join customer c
on s.snum = c.snum
join
orders o 
on o.cnum=c.cnum;

--create view for 3 table join
create view sp_cust_orders as
select s.snum as snum, sname, s.city as 'salesperson_city', comm,
c.cnum as cnum, cname, c.city as 'customer_city', rating, total_sales,
onum, amt, odate
from salespeople s join customer c
on s.snum = c.snum
join
orders o 
on o.cnum=c.cnum;

select * from sp_cust_orders;

--find total sales by each salesperson. Print name also
select snum, sname, sum(amt) as total 
from sp_cust_orders
group by snum, sname;

exec sp_help customer;

--Rank table
CREATE TABLE rank_table (Name VARCHAR(10) );

INSERT INTO rank_table (Name) 
 
VALUES('A'), ('C'), ('C'), ('B'), ('B'), ('D'), ('E');

Select * from rank_table;

SELECT Name, 
RANK () OVER (
ORDER BY Name
) AS Rank_no 
FROM rank_table;

/*Output – 
 
Name
Rank_no
A
1
B
2
B
2
C
4
C
4
D
6
E
7
*/

--find 2nd Rank
select name, rank_no from (
SELECT Name, 
RANK () OVER (
ORDER BY Name
) AS Rank_no 
FROM rank_table) abc where Rank_no = 2;

--find top 5
select name, rank_no from (
SELECT Name, 
RANK () OVER (
ORDER BY Name
) AS Rank_no 
FROM rank_table) abc where Rank_no <=5 ;

--FIND DENSE_RANK()
SELECT Name, 
DENSE_RANK () OVER (
ORDER BY Name
) AS Rank_no 
FROM rank_table;


CREATE TABLE rank_table2 (Name VARCHAR(10), value int );

INSERT INTO rank_table2 (Name, value) 
 
VALUES('A',90), ('B',80), ('C',100), ('D',40), ('E',60);

select * from rank_table2;

SELECT Name, value, 
RANK () OVER (
ORDER BY value desc
) AS Rank_no 
FROM rank_table2;

--find 2nd rank
select name, value, rank_no from (
SELECT Name, value, 
RANK () OVER (
ORDER BY value desc
) AS Rank_no 
FROM rank_table2 ) abc where rank_no = 2;

--partition by clause
create table employee(
name varchar(30),
age int,
department varchar(30),
Salary int);

insert into employee values('Ramesh',20,'Finance',50000),
('Suresh',22,'Finance',50000),
('Ram',28,'Finance',20000),
('Pradeep',22,'Sales',20000),
('Deep',25,'Sales',30000);

select * from employee;

--Rank based on salary for each department

SELECT Name, Age, Department, Salary, 
RANK () OVER (PARTITION BY Department order by salary desc)
AS Rank_no from employee; 


SELECT Name, Age, Department, Salary, 
Dense_RANK () OVER (PARTITION BY Department order by salary desc)
AS Rank_no from employee; 



--Find average salary of employees for each department and order employees within a department by age. 
SELECT Name, Age, Department, Salary, 
 avg(Salary) OVER( PARTITION BY Department) AS Avg_Salary
 FROM employee

SELECT Name, Age, Department, Salary, 
 avg(Salary) OVER( PARTITION BY Department ORDER BY Age) AS Avg_Salary
 FROM employee