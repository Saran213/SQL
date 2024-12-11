use retail;

--Each customers who are living in london
select * from orders;
delete from orders
where onum = 5002;

--find orders of such customers who are living in London
SELECT
    onum,
    odate,
    cnum,
    amt	
FROM
    orders
WHERE
    cnum IN (
        SELECT
            cnum
        FROM
            customer
        WHERE
            city = 'London'
    )
ORDER BY
   odate DESC;

--find customer details whose avg order value is above 2000
select * from customer
where cnum in (select cnum from orders group by cnum having avg(amt) > 2000);


--find the orders having maximum orders value;
select * from orders where amt = (select max(amt) from orders);

--find the 2nd highest order
select * from orders where amt = (select max(amt) from orders
where amt < (select max(amt) from orders)); --nested subqueries

select snum from salespeople where city = 'London';

SELECT cnum FROM customer
WHERE snum in (1001,1004,1005);

SELECT
    onum,
    odate,
    cnum,
    amt
FROM
    orders
WHERE cnum IN(2001,2006,2007);			

SELECT
    onum,
    odate,
    cnum,
    amt
FROM
    orders
WHERE
    cnum IN (
        SELECT
            cnum
        FROM
            customer
        WHERE
            snum in (select snum from salespeople where city = 'London')
    )
ORDER BY
   odate DESC;