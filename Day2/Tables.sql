/*
--------SQL Commands--------
5 TYPES OF COMMANDS
DDL - DATA DEFINITION LANGUAGE - CREATE, ALTER, DROP, TRUNCATE
DML - DATA MANIPULATION LANGUAGE - INSERT, UPDATE, DELETE
DCL - DATA CONTROL LANGUAGE - GRANT, REVOKE
DQL - DATA QUERY LANGUAGE - SELECT
TCL - TRANSACTION CONTROL LANGUAGE - COMMIT(SAVE), ROLLBACK(UNDO)

Numeric data types - int, decimal, numeric
String data types - char, varchar, text
Boolean data types - true, false
Date and Time data types - date, timestamp, year, time, datetime
*/

create table employee(empcode int, name varchar(10)) --255

-- Create a student table which consists of rollno, name, total, avg, rank

create table student(roll_no int, name varchar(15), total int, average decimal(3, 2), rank int)

select * from employee
select name from employee