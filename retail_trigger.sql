use retail;

select * from customer;

update customer
set total_sales = 767.19
where cnum = 2001;

update customer
set total_sales = 1788.98
where cnum = 2002;

DECLARE @MyCursor CURSOR;
DECLARE @mycnum int;
BEGIN
    SET @MyCursor = CURSOR FOR
    select cnum from customer
           

    OPEN @MyCursor 
    FETCH NEXT FROM @MyCursor INTO @mycnum

    WHILE @@FETCH_STATUS = 0
    BEGIN
      update customer
      set total_sales = (select sum(amt) from orders where cnum = @mycnum)
      where cnum = @mycnum;      
      FETCH NEXT FROM @MyCursor INTO @mycnum 
    END; 

    CLOSE @MyCursor ;
    DEALLOCATE @MyCursor;
END;


CREATE TRIGGER update_amount ON orders  
AFTER INSERT  
AS  
BEGIN  
SET NOCOUNT ON;
declare @amt decimal(10,2);
declare @cnum int;
select @cnum=cnum, @amt=amt from inserted
update customer 
set total_sales = total_sales + @amt
where customer.cnum = @cnum;
END;  
GO  

insert into orders values(3050, 2000, '2024-09-18', 2001);


select * from orders;