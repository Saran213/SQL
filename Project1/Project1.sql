use AdventureWorks2012;

/*Get all the details from the person table including email ID, phone
number and phone number type*/
select * from Person.EmailAddress;
select * from Person.PersonPhone;

--Get the details of the sales header order made in May 2011select * from Sales.SalesOrderHeaderwhere YEAR(OrderDate) = 2011 and Month(OrderDate) = 5;--Get the details of the sales details order made in the month of May 2011select * from Sales.SalesOrderDetail sd join Sales.SalesOrderHeader shon sd.SalesOrderID = sh.SalesOrderIDwhere YEAR(sh.OrderDate) = 2011 and Month(sh.OrderDate) = 5;--Get the total sales made in May 2011
select sum(sd.LineTotal) TotalSales from Sales.SalesOrderDetail sd 
join Sales.SalesOrderHeader sh
on sd.SalesOrderID = sh.SalesOrderID
where YEAR(OrderDate) = 2011 and Month(OrderDate) = 5;

/*Get the total sales made in the year 2011 by month order by
increasing sales*/
select MONTH(sh.OrderDate) Month, sum(sd.LineTotal) TotalSales 
from Sales.SalesOrderDetail sd
join Sales.SalesOrderHeader sh
on sd.SalesOrderID = sh.SalesOrderID
where Year(sh.OrderDate) = 2011
group by MONTH(sh.OrderDate)
order by TotalSales;

/*Get the total sales made to the customer with FirstName='Gustavo'
and LastName = 'Achong'*/
select * from Person.Person
where FirstName='Gustavo' and LastName = 'Achong'

select * from Person.Person p
join Sales.SalesPerson sp
on p.BusinessEntityID = sp.BusinessEntityID
where (p.BusinessEntityID = sp.BusinessEntityID) and
(FirstName='Gustavo' and LastName = 'Achong');
/*There is a data available in the name of 'Gustavo Achong' in person.Person table,
but the BusinessEntityID in person.Person table is not available in 
Sales.SalesPerson.*/