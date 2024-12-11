use retail;

select * from orders;

select * from customer;

CREATE TRIGGER update_amount_2 ON orders  
AFTER UPDATE  
AS  
BEGIN  
SET NOCOUNT ON;
declare @amt decimal(10,2);
declare @cnum int;
declare @old_amt decimal(10,2);
declare @old_cnum int;


select @old_cnum=cnum, @old_amt=amt from deleted

update customer 
set total_sales = total_sales - @old_amt
where customer.cnum = @old_cnum;

 
select @cnum=cnum, @amt=amt from inserted

update customer 
set total_sales = total_sales + @amt
where customer.cnum = @cnum;

END;  
GO  

--updating the amount
update orders
set amt = 1500
where onum = 3050;

--update the cnum
update orders
set cnum = 2002
where onum = 3050;

--update both
update orders
set amt = 2000, cnum = 2001
where onum = 3050;

CREATE TRIGGER update_amount_3 ON orders  
AFTER DELETE
AS  
BEGIN  
SET NOCOUNT ON;
declare @old_cnum int;
declare @old_amt decimal(10,2);

select @old_cnum=cnum, @old_amt=amt from deleted
 

update customer 
set total_sales = total_sales - @old_amt 
where customer.cnum = @old_cnum;

END;  
GO

--delete from orders table
delete from orders
where onum = 3050

USE retail;  
GO  
CREATE PROCEDURE display_orders
    
AS   

    SET NOCOUNT ON;  
    SELECT * 
    FROM orders;  

GO  

EXECUTE display_orders;

--Procedure with parameters
USE retail;  
GO  
CREATE PROCEDURE find_orders_for_cnum
    @cnum int
AS   

    SET NOCOUNT ON;  
    SELECT * 
    FROM orders
	WHERE cnum =@cnum;  

GO  

EXECUTE find_orders_for_cnum 2002;

USE retail;  
GO  
CREATE PROCEDURE proc1
    @rating int,
	@city varchar(50)
AS   

    SET NOCOUNT ON;  
    SELECT * 
    FROM customer
	WHERE rating = @rating and city = @city;  

GO  

EXECUTE proc1 100, 'London';

USE retail;  
GO  
CREATE PROCEDURE add_order
@onum int,
@amt decimal(10,2),
@odate date,
@cnum int
as
set nocount on;
insert into orders values 
(@onum,@amt,@odate,@cnum);
GO

exec add_order 3050, 2000, '2024-09-19', 2001;