create database ABCFashion;

use ABCFashion;

--Create a Salesman Table and insert values
Create table Salesman(
	SalesmanId int,
	SalesmanName varchar(30),
	Commission int,
	City varchar(30),
	Age int
);

insert into Salesman values 
(101, 'Joe', 50, 'California', 17);

insert into Salesman values 
(102, 'Simon', 75, 'Texas', 25),
(103, 'Jessie', 105, 'Florida', 35),
(104, 'Danny', 100, 'Texas', 22),
(105, 'Lia', 65, 'New Jersy', 30);

select * from Salesman;

--Create a Customer Table and insert values
create table Customer(
	SalesmanId int,
	CustomerId int,
	CustomerName varchar(30),
	PurchaseAmount int
);

insert into Customer values 
(101, 2345, 'Andrew', 550),
(103, 1575, 'Lucky', 4500),
(104, 2345, 'Andrew', 4000),
(107, 3747, 'Remona', 2700),
(110, 4004, 'Julia', 4545);

select * from Customer;

--Create a Orders Table and insert values
create table Orders(
	OrderId int,
	CustomerId int,
	SalesmanId int,
	OrderDate varchar(30),
	Amount int
);

insert into Orders values
(5001, 2345, 101, '04-07-2021', 550),
(5003, 1234, 105, '15-02-2022', 1500);

select * from Orders;

--Insert a new record in your Orders table.
insert into Orders values
(5005, 3747, 107, '26-09-2023', 2250);

/*Add Primary key constraint for SalesmanId column in Salesman table. Add default
constraint for City column in Salesman table. Add Foreign key constraint for SalesmanId
column in Customer table. Add not null constraint in Customer_name column for the
Customer table.
*/
--Primary key for SalesmanId column in Salesman table
Alter table Salesman
alter column SalesmanId int not null; 

Alter table Salesman
add primary key (SalesmanId);

--Default key for City column in Salesman table
Alter table Salesman
add constraint df_city default ('Texas') for City;

--Foreign key for SalesmanId column in Customer table
select * from Salesman;
select * from Customer;

/*insert the values for the other salesmanid of customer table in 
salesman table to overcome foreign key conflict error*/

insert into Salesman values 
(107, 'Ken', 90, 'Newyork', 24),
(110, 'Adwin', 120, 'California', 40);

Alter table Customer add constraint add_forkey
foreign key (SalesmanId) references Salesman(SalesmanId);

--creating not null in Customer name column
Alter table Customer
alter column CustomerName varchar(30) not null;

/*Fetch the data where the Customer’s name is ending with ‘N’ also get the purchase
amount value greater than 500.*/
select * from Customer
where trim(CustomerName) like '%N' and PurchaseAmount > 500;

/*Using SET operators, retrieve the first result with unique SalesmanId values from two
tables, and the other result containing SalesmanId with duplicates from two tables.*/
select SalesmanId from Salesman
union
select SalesmanId from Customer;

select SalesmanId from Salesman
union all
select SalesmanId from Customer;

/*Display the below columns which has the matching data.
Orderdate, Salesman Name, Customer Name, Commission, and City which has the
range of Purchase Amount between 500 to 1500.*/
select o.OrderDate, s.SalesmanName, c.CustomerName, s.Commission, s.City 
from Salesman s join Customer c
on s.SalesmanId = c.SalesmanId
join Orders o on o.SalesmanId = s.SalesmanId
where c.PurchaseAmount >= 500 and c.PurchaseAmount <= 1500;

--Using right join fetch all the results from Salesman and Orders table.
select * from Salesman s right join Orders o
on s.SalesmanId = o.SalesmanId;