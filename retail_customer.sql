use retail;

SELECT * FROM customer;

--update command
UPDATE customer
SET cname = 'Grass', city = 'Berlin'
WHERE cnum = 2004

--string functions
--find the length of each custome
SELECT LEN(cname) FROM customer;

--display cname in upper case
SELECT UPPER(cname) AS 'Cust_name in Upper case' FROM customer;

--display city in lower case
SELECT Lower(city) AS 'Cust_city in Lower case' FROM customer;

--trim function
SELECT * FROM customer WHERE city = 'London';

UPDATE customer 
SET city = ' London'
WHERE cnum = 2001;

SELECT * FROM customer WHERE TRIM(city)= 'London';

UPDATE customer 
SET city = 'London'
WHERE cnum = 2001;

--substring function
select substring('habit', 1, 2);

select substring('habit', 4, 2);
select substring(cname, 1, 2) from customer;

--concat function
select concat('John', ' ', 'Smith') as 'full name';

select concat(cname, ' ', city) from customer;

--count function
select count(cnum) as 'count of cust' from customer;

--group clause
select * from customer;

--find count of customer in each city
select city, count(cnum) as 'count of cust' from customer group by city;

--find count of customer for each rating
select rating, count(cnum) as 'count of cust' from customer group by rating;

select * from customer where snum = 1001;
--find count of customer for each salesperson
select snum, count(cnum) as 'count of cust' from customer group by snum;

--use of group by and where together
--find count of customer for each salesperson in a city of London and Rome
select * from customer where city in ('London', 'Rome');

select snum, count(cnum) as 'count of cust' from customer 
where city in ('London', 'Rome')
group by snum;

--print sp whose customer count is more than one
select snum, count(cnum) as 'count of cust' from customer
where city in ('London', 'Rome')
group by snum
having count(cnum) > 1;