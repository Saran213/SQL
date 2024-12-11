use retail;

select cnum, sum(amt) as total_sales, count(onum) as total_txn
from orders
group by cnum;

--convert select query into a permanent table
select cnum, sum(amt) as total_sales, count(onum) as total_txn
into cust_orders from orders
group by cnum;

select * from cust_orders;

/*The common table expression (CTE) is a powerful construct in SQL that helps simplify a query. 
CTEs work as virtual tables (with records and columns), created during the execution of a query, 
used by the query, and eliminated after query execution. 

CTEs often act as a bridge to transform the data in source tables to the format expected by the query.

A common table expression, or CTE, is a temporary named result set created from a simple SELECT statement 
that can be used in a subsequent SELECT statement. Each SQL CTE is like a named query, 
whose result is stored in a virtual table (a CTE) to be referenced later in the main query.
*/
CREATE TABLE Employees
(
  EmployeeID int NOT NULL PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  ManagerID int NULL
);

INSERT INTO Employees VALUES (1, 'Ken', 'Thompson', NULL)
INSERT INTO Employees VALUES (2, 'Terri', 'Ryan', 1)
INSERT INTO Employees VALUES (3, 'Robert', 'Durello', 1)
INSERT INTO Employees VALUES (4, 'Rob', 'Bailey', 2)
INSERT INTO Employees VALUES (5, 'Kent', 'Erickson', 2)
INSERT INTO Employees VALUES (6, 'Bill', 'Goldberg', 3)
INSERT INTO Employees VALUES (7, 'Ryan', 'Miller', 3)
INSERT INTO Employees VALUES (8, 'Dane', 'Mark', 5)
INSERT INTO Employees VALUES (9, 'Charles', 'Matthew', 6)
INSERT INTO Employees VALUES (10, 'Michael', 'Jhonson', 6) 

select * from Employees;
--self join to print emp name along with their manager name
----------------------------------------------------------
select a.EmployeeID, concat(a.FirstName,' ',a.LastName) as Emp_Name, 
coalesce(a.ManagerID,0) as Manager_ID,
IIF(a.ManagerID is null, 'CEO', concat(b.FirstName,' ',b.LastName)) as Manager_Name
from
Employees a left outer join Employees b
on
 a.ManagerID = b.EmployeeID ;

SELECT EmployeeID, FirstName, LastName, ManagerID, 1
    FROM Employees
    WHERE ManagerID IS NULL

select * from employees;


/*After the Employees table is created, the following SELECT statement, 
which is preceded by a WITH clause that includes a CTE named cteReports is created: */

--single query
------------

WITH
  cteReports (EmpID, FirstName, LastName, MgrID, EmpLevel)
  AS
  (
    SELECT EmployeeID, FirstName, LastName, ManagerID, 1
    FROM Employees
    WHERE ManagerID IS NULL
    UNION ALL
    SELECT e.EmployeeID, e.FirstName, e.LastName, e.ManagerID, 
      r.EmpLevel + 1
    FROM Employees e
      INNER JOIN cteReports r
        ON e.ManagerID = r.EmpID
  )



SELECT
  FirstName + ' ' + LastName AS FullName, 
  EmpLevel,
  IIF(emplevel = 1, 'CEO',(SELECT FirstName + ' ' + LastName FROM Employees 
    WHERE EmployeeID = cteReports.MgrID)) AS Manager
FROM cteReports 
ORDER BY EmpLevel, MgrID


select * from Employees

create table salesman(
salesmanID int null,
salesman_name varchar(30) null,
city varchar(30) null);

ALTER TABLE Salesman alter column SalesmanId int NOT NULL;
alter table salesman add primary key (SalesmanId);

ALTER TABLE Salesman ADD CONSTRAINT DF_city DEFAULT 'London' FOR City;
ALTER TABLE customer
ADD FOREIGN KEY(salesmanID)
REFERENCES salesman(salesmanID);


insert into salesman (salesmanID,salesman_name) values(1,'John')
insert into salesman values(2,'Alan','New York');

select * from salesman;

--create a backup for customer table
select * into customer_backup
from customer;

select * from customer_backup;