use retail;

select * from orders;

--display total num of orders
select count(onum) from orders;

--find total value of orders placed by each customer
select cnum, sum(amt) as 'orders by each customer' from orders group by cnum;

--find total value and count of orders placed by each customer
select cnum, sum(amt) as 'orders by each customer', count(onum) as 'count of orders' 
from orders group by cnum;

--display the month also with the data for each transaction
select *, month(odate) as 'month' from orders; 

--display the month number and name also with the data for each transaction
select *, month(odate) as 'month', datename(m, odate) as 'month name' from orders;

--display the year for each transaction
select *, year(odate) as 'year' from orders;

--find month wise sales
select datename(m, odate) as 'Order Month', sum(amt) as 'Month wise sales'
from orders
group by datename(m, odate), month(odate)
order by month(odate);

--find month wise sales for month whose total is about 5000
select datename(m, odate) as 'Order Month', sum(amt) as 'Month wise sales'
from orders
group by datename(m, odate), month(odate)
having sum(amt) > 5000
order by month(odate);

--find total value of orders placed by each customer for those whose total is about 500
select cnum, sum(amt) as 'orders by each customer' from orders group by cnum
having sum(amt) > 1500;

--add one order
insert into orders values (3050, 2000, '2024-03-20', 2001);

select datename(m, odate) as 'Order Month', sum(amt) as 'Month wise sales'
from orders
group by year(odate), datename(m, odate), month(odate)
order by year(odate), month(odate);

--find day of the week wise total sales
select datepart(dw, odate), datename(dw, odate), sum(amt)
from orders
group by datename(dw, odate), datepart(dw, odate)
order by datepart(dw, odate);

--display current date
select getdate();

--find the months of diff from order date to current date
select *, datediff(mm, odate, getdate()) 
as 'Days of diff from order date to current date' 
from orders;

select * from orders o join customer c
on
o.cnum = c.cnum;

--find total value of orders placed by each customer. print the customer name
select o.cnum, cname, sum(amt) as 'total value'
from orders o join customer c
on
o.cnum = c.cnum
group by o.cnum, cname;

delete from orders
where onum = 3050;

--find total value of orders by each sp
select snum, sum(amt) as 'total value'
from orders o join customer c
on
o.cnum = c.cnum
group by snum;

--join 3 tables
select * from orders o join customer c
on
o.cnum = c.cnum
join salespeople s
on
s.snum = c.snum;

--find total value of orders by each sp. print the sp name also
select c.snum, sname, sum(amt) as 'total value' 
from orders o join customer c
on
o.cnum = c.cnum
join salespeople s
on
s.snum = c.snum
group by c.snum, sname;

--calculate comm for each salesperson
select c.snum, sname, sum(amt*comm) as 'total value'
from orders o join customer c
on
o.cnum = c.cnum
join salespeople s
on
s.snum = c.snum
group by c.snum, sname;

--square function
select square(5);

--power function
select power(5, 3);