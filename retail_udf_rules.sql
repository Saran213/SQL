use retail;

/*
What are scalar functions
SQL Server scalar function takes one or more parameters and returns a single value.

The scalar functions help you simplify your code. For example, 
you may have a complex calculation that appears in many queries. 
Instead of including the formula in every query, 
you can create a scalar function that encapsulates the formula and uses it in each query.
*/

--Example




create table order_items(
order_id int not null primary key,
prod_id varchar(10),
quantity int,
list_price decimal(10,2),
discount decimal(4,2)
);

insert into order_items values(1, 'P001', 100, 50, 2.5);
insert into order_items values(2, 'P002', 50, 40, 4.0);
insert into order_items values(3, 'P004', 1000, 25, 0);
insert into order_items values(4, 'P001', 200, 50, 2.5);

CREATE FUNCTION udfNetSale(
    @quantity INT,
    @list_price DEC(10,2),
    @discount DEC(4,2)
)
RETURNS DEC(10,2)
AS 
BEGIN
    RETURN @quantity * @list_price * ((100 - @discount)/100);
END;

/*After creating the scalar function, you can find it under 
Programmability > Functions > Scalar-valued Functions*/

SELECT dbo.udfNetSale(10,100,5) net_sale;

SELECT 
    order_id, prod_id, quantity, list_price, discount,
    dbo.udfNetSale(quantity, list_price, discount) net_amount
FROM 
    order_items;

/*In SQL Server, an Inline Table-valued function (ITVF) is a user-defined function that returns a table as its result. 
Unlike a scalar function that returns a single scalar value, an Inline Table Valued Function 
returns a result set that can be used in a query just like a table. 

An Inline Table Valued Function is “inline” because its definition is part of a query, 
rather than being a standalone object.*/

--Example

CREATE TABLE Student
 (
   Id INT PRIMARY KEY,
   Name VARCHAR(50) NOT NULL,
   Marks INT NOT NULL
);

-- insert  records

INSERT INTO Student 
VALUES (1, 'Tushar', 60), (2, 'Kunal', 80), (3, 'Shivam', 30), 
(4, 'Rushi', 45),(5, 'Mahesh',60),(6, 'Shubham',39),(7, 'Rahul',97);

select * from Student;

create function dbo.GetNameByMarks(@mark int)
Returns Table
as
Return
(
select id, name, marks from student
where marks >= @mark
);

select * from dbo.GetNameByMarks(50);


--create function without parameter

create function dbo.DisplayStudentDetails()
Returns Table
as
Return
(
select id, name, marks from student
);

select * from dbo.DisplayStudentDetails();

create function dbo.GetOrderItemsByAmt(@amt decimal(10,2))
Returns Table
as
Return
(
SELECT 
    order_id, prod_id, quantity, list_price, discount,
    dbo.udfNetSale(quantity, list_price, discount) net_amount
FROM 
    order_items 
where
   dbo.udfNetSale(quantity, list_price, discount) >= @amt


)

--to execute 
select * from dbo.GetOrderItemsByAmt(5000);

create rule CITYNAME
as @city in ('London','Rome','LA');


EXEC SP_BINDRULE 'dbo.CITYNAME', 'customer.city';

insert into customer values (5000,'Mark','Mumbai',200,1001,0);

/*Msg 513, Level 16, State 0, Line 7
A column insert or update conflicts with a rule imposed by a previous CREATE RULE statement. 
The statement was terminated. The conflict occurred in database 'retail', table 'dbo.customer', column 'city'.
The statement has been terminated.*/

insert into customer values (5000,'Mark','Rome',200,1001,0);

---new record is added

select * from customer;

EXEC SP_UNBINDRULE 'customer.city';

--Rules can be dropped if they are unbounded


create rule amount
as @amt > 0;

EXEC sp_bindrule 'dbo.amount', 'orders.amt';

insert into orders values(5002, -1, '2024-04-27', 2001);

insert into orders values(5002, 0, '2024-04-27', 2001);

insert into orders values(5002, 1000, '2024-04-27', 2001);