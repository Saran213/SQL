use Jomato;

select * from Jomato;

/*Create a stored procedure to display the restaurant name, type and cuisine 
where the table booking is not zero.*/
create procedure TableBooking
as
	select RestaurantName, RestaurantType, CuisinesType
	from Jomato where TableBooking > 0
go

exec TableBooking;

/*Create a transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’.
Check the result and rollback it.*/
declare @cafeteria varchar(50)
begin transaction @cafeteria
update Jomato
set CuisinesType = 'cafeteria'
where CuisinesType = 'Cafe'

declare @cafeteria varchar(50)
rollback transaction @cafeteria;
select * from Jomato where CuisinesType = 'Cafe';

/*Generate a row number column and find the top 5 areas with the 
highest rating of restaurants.*/
select top 5 dense_rank()
over( order by Rating desc ) as RowNumber,
Area, Rating
from Jomato;

--Use the while loop to display the 1 to 50
declare @count int
set @count = 0
while(@count<50)
begin
set @count = @count + 1
print @count
end


/*Write a query to Create a Top rating view to store the generated top 5 
highest rating of restaurants.*/
select top 5 dense_rank()
over(order by Rating desc) as TopRating,
*
from Jomato;

--Create a trigger that give an message whenever a new record is inserted.
Create trigger 	Email_Notification
on jomato
after insert
as
begin
EXEC msdb.dbo.sp_send_dbmail
@profile_name = 'John',
@recipients = 'john@gmail.com',
@subject = 'New Record Inserted.',
@body = 'A new record has been inserted.',
@importance ='HIGH'
end

insert into Jomato values (7105,'KFC', 'Chicken', 2.3, 38, 220, 0, 0, 'Beverages, Burgers', 'NewYork', 'Silicon valley', 60);
--trigger occurs when insert happens