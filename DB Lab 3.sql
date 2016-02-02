--Peter Guggisberg
--2-2-16
--Database Management/Professor Labouseur
--Lab 3

--1
SELECT orders.ordnum, orders.totalusd
FROM orders;

--2
SELECT agents.name, agents.city
FROM agents
WHERE agents.name = 'Smith';

--3
SELECT products.pid, products.name, products.priceusd
FROM products
WHERE products.quantity > 208000;

--4
SELECT customers.name, customers.city
FROM customers
WHERE customers.city = 'Dallas';

--5
SELECT agents.name
FROM agents
WHERE agents.city <> 'New York'
   AND agents.city <> 'Tokyo';

--6
SELECT *
FROM products
WHERE products.city <> 'Dallas'
   AND products.city <> 'Duluth'
   AND products.priceusd >= 1.00;

--7
SELECT *
FROM orders
WHERE orders.mon = 'jan'
   OR orders.mon = 'mar';

--8
SELECT *
FROM orders
WHERE orders.mon = 'feb'
   AND orders.totalusd < 500.00;

--9
SELECT *
FROM orders
WHERE orders.cid = 'c005';
