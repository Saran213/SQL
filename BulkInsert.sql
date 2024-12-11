create database salesDB;

use salesDB;

--create table customer
CREATE TABLE customer
(custno varchar(10) not null primary key,
firstname varchar(30) not null,
lastname varchar(30) not null,
age int,
profession varchar(100)
);

exec sp_columns customer;
exec sp_help customer;

--bulk insert
BULK
INSERT customer
FROM 'C:\custs.txt'
WITH
(
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

select * from customer;

--create sales table
CREATE TABLE sales
(txnno varchar (10) not null primary key,
txndate date,
custno varchar(10) foreign key references customer(custno),
amount numeric(8,2),
category varchar(50),
product varchar(75),
city varchar (30),
state varchar(30),
spendby varchar(20)
);

--bulk insert
BULK
INSERT sales
FROM 'C:\txn.txt'
WITH
(
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

select * from sales;

exec sp_help sales;

CREATE TABLE customer2
(custno varchar(10) not null primary key,
firstname varchar(30) not null,
lastname varchar(30) not null,
age int,
profession varchar(100)
);

BULK
INSERT customer2
FROM 'C:\cust_dup.txt'
WITH
(
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

select * from customer2; --no records got inserted due to PK constraint

--create table w/o PK

CREATE TABLE customer3
(custno varchar(10) not null,
firstname varchar(30) not null,
lastname varchar(30) not null,
age int,
profession varchar(100)
);

BULK
INSERT customer3
FROM 'C:\cust_dup.txt'
WITH
(
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

select * from customer3;

--find duplicate PK in cust table
select custno, count(custno) from customer3 group by custno having count(custno) > 1;

select * from customer3 where custno = '4000008';

select top 1 custno from customer3 order by custno desc;

update customer3
set custno = '4000012'
where custno = '4000008' and firstname = 'Malcolm';

--transfer data from one table to another table

insert into customer2 select * from customer3;

select * from customer2;