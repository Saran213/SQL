create database retail;

use retail;

CREATE TABLE salespeople (
	snum INT NOT NULL,
	sname VARCHAR(30) NOT NULL,
	city VARCHAR(30) NOT NULL,
	comm DECIMAL(4,2) NOT NULL,
	PRIMARY KEY (snum) --the value in a column cannot be duplicated
);

INSERT INTO salespeople VALUES (1001, 'Peel', 'London', 0.12);
INSERT INTO salespeople VALUES (1002, 'Serres', 'San Jose', 0.13);
INSERT INTO salespeople VALUES (1004, 'Motika', 'London', 0.11);
INSERT INTO salespeople VALUES (1007, 'Rifkin', 'Barcelona', 0.15);
INSERT INTO salespeople VALUES (1003, 'Axel Rod', 'New York', 0.10);
INSERT INTO salespeople VALUES (1005, 'Fran', 'London', 0.26);

SELECT * FROM salespeople;

--check the sp's who lives in london city 
SELECT * FROM salespeople where city = 'London';

--check the snum
SELECT * FROM salespeople where snum = 1001;

--find how many sp paid commission more than 10%
SELECT * FROM salespeople WHERE comm > 0.10;

--find how many sp paid commission more than or equal to 12%
SELECT * FROM salespeople WHERE comm >= 0.12;

--find how many sp paid commission between 12% and 15%
SELECT * FROM salespeople WHERE comm >= 0.12 and comm <= 0.15;
SELECT * FROM salespeople WHERE comm BETWEEN 0.12 and 0.15; --using between class

--check the sp's who lives in london and newyork city 
SELECT * FROM salespeople where city = 'London' or city = 'New York';
SELECT * FROM salespeople where city IN ('London', 'New York'); --using in class

--display the sp's who lives in london city and comm is less than 15% 
SELECT * FROM salespeople where city = 'London' and comm < 0.15;

--pattern search on r letter in sname
SELECT * FROM salespeople WHERE sname like '%r%';

--pattern search on r letter in sname in beginning
SELECT * FROM salespeople WHERE sname like 'r%';

--pattern search on rr letter in sname 
SELECT * FROM salespeople WHERE sname like '%rr%';

--pattern search on d letter in sname at the end
SELECT * FROM salespeople WHERE sname like '%d';

--pattern search on don letter in city at the end
SELECT * FROM salespeople WHERE city like '%don';

CREATE TABLE customer (
	cnum INT NOT NULL,
	cname VARCHAR(30) NOT NULL,
	city VARCHAR(30) NOT NULL,
	rating int not null,
	snum int NOT NULL,
	PRIMARY KEY (cnum),
	FOREIGN KEY (snum) REFERENCES salespeople(snum)
);

INSERT INTO customer VALUES (2001, 'Hoffman', 'London', 100, 1001);
INSERT INTO customer VALUES (2002, 'Giovanni', 'Rome',200, 1003);
INSERT INTO customer VALUES (2003, 'Liu', 'San Jose',200, 1002);
INSERT INTO customer VALUES (2004, 'Grass', 'Berlin',300, 1002);
INSERT INTO customer VALUES (2006, 'Clemens', 'London',100, 1001);
INSERT INTO customer VALUES (2008, 'Cisneros', 'San Jose',300, 1007);
INSERT INTO customer VALUES (2007, 'Pereira', 'Rome',100, 1004);

SELECT * FROM customer; 