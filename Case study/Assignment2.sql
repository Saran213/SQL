create database Jomato;

use Jomato;

select * from Jomato;

UPDATE Jomato
SET Rating = ROUND(Rating, 2);

select * from Jomato where RestaurantType = 'Quick Bites';

/*Create a user-defined functions to stuff the Chicken into ‘Quick Bites’. Eg: ‘Quick
Chicken Bites’.*/
Create FUNCTION ChickenStuff (@inputString VARCHAR(MAX)) 
RETURNS VARCHAR(MAX) AS 
BEGIN 
	DECLARE @result VARCHAR(MAX) 
	SET @result = STUFF(@inputString,7, 7, 'Chicken Bites') 
	RETURN @result 
END

select dbo.Chickenstuff('Quick Bites')

/*Use the function to display the restaurant name and cuisine type which has the
maximum number of rating.*/
create function max_rating()
returns table
return(
	select RestaurantName, CuisinesType, Rating from Jomato
	where Rating = (select max(Rating) from Jomato)
)

select * from dbo.max_rating();

/*Create a Rating Status column to display the rating as ‘Excellent’ 
if it has more the 4 start rating, ‘Good’ if it has above 3.5 
and below 4 star rating, ‘Average’ if it is above 3 and below 3.5 and ‘Bad’ if it 
is below 3 star rating and */

select RestaurantName, Rating,
case
	when Rating > 4 then 'Excellent'
	when Rating > 3.5 then 'Good'
	when Rating between 3 and 3.5 then 'Average'
	when Rating < 3 then 'Bad'
end as StatusRating
from Jomato;

/*Find the Ceil, floor and absolute values of the rating column and 
display the current date and separately display the year, month_name and day.*/
select RestaurantName,
ceiling(Rating) as Ceil_Value,
floor(Rating) as Floor_Value,
abs(Rating) as Absolute_Value,
getdate() as 'Current_Date',
datename(year, getdate()) as Year,
datename(MONTH, getdate()) as MonthName,
datename(day, getdate()) as Day
from Jomato

--Display the restaurant type and total average cost using rollup.
select RestaurantType, 
sum(AverageCost) as Total_AverageCost
from Jomato
where RestaurantType is not null
group by rollup(RestaurantType);