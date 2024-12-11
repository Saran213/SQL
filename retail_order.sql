use retail;

--to display table details
exec sp_help salespeople;
exec sp_help customer;

--inner join salespeople with customer
select * from salespeople join customer 
on 
salespeople.snum = customer.snum;

--find count of customer for each salespeople's num and name
select salespeople.snum, sname, count(cnum) as 'count of customer' 
from salespeople join customer
on
salespeople.snum = customer.snum
group by salespeople.snum, sname;

--left outer join
select salespeople.snum, sname, count(cnum) as 'count of customer' 
from salespeople left outer join customer
on
salespeople.snum = customer.snum
group by salespeople.snum, sname;

--order by clause
select * from salespeople order by sname;
select * from salespeople order by comm desc;


CREATE TABLE orders (
	onum INT NOT NULL,
	amt DECIMAL(7,2) NOT NULL,
	odate Date NOT NULL,
	cnum int NOT NULL,
	PRIMARY KEY (onum),
	FOREIGN KEY (cnum) REFERENCES customer(cnum)
);

INSERT INTO orders VALUES (3001, 18.69, '1996-03-10', 2008);
INSERT INTO orders VALUES (3003, 767.19, '1996-03-10', 2001);
INSERT INTO orders VALUES (3002, 1900.19, '1996-03-10', 2007);
INSERT INTO orders VALUES (3005, 5160.45, '1996-03-10', 2003);
INSERT INTO orders VALUES (3006, 1098.16, '1996-03-10', 2008);
INSERT INTO orders VALUES (3009, 1713.23, '1996-04-10', 2002);
INSERT INTO orders VALUES (3007, 75.75, '1996-04-10', 2002);
INSERT INTO orders VALUES (3008, 4723.00, '1996-05-10', 2006);
INSERT INTO orders VALUES (3010, 1309.95, '1996-06-10', 2004);
INSERT INTO orders VALUES (3011, 9891.88, '1996-06-10', 2006);

select * from orders;

--date field should be yyyy-mm-dd
select month('13-9-2024'); --error
select month('2024-9-13') as 'Month';

--print total amount of orders
select sum(amt) as 'total value' from orders;

--print max amount of orders
select max(amt) as 'max value' from orders;

--print max amount of orders
select min(amt) as 'min value' from orders;

--print average amount of orders
select avg(amt) as 'average value' from orders;

--print sum, max, min, avg on all orders
select sum(amt) as 'total value',
max(amt) as 'maximum value',
min(amt) as 'minimum value',
avg(amt) as 'average value'
from orders;