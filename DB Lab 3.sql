--Peter Guggisberg
--2-2-16
--Database Management/Professor Labouseur
--Lab 3

--1 fix
SELECT *
FROM orders;

--2 fix
SELECT *
FROM agents
WHERE agents.name = 'Smith';

--3 fix
SELECT *
FROM products
WHERE products.quantity > 208000;

--4 fix
SELECT *
FROM customers
WHERE customers.city = 'Dallas';

--5 not done, revise!!!
SELECT *
FROM agents
WHERE agents.city != 'New York'
OR agents.city != 'Tokyo'

--6 not done, revise!!!
SELECT *
FROM products
WHERE products.city != 'Dallas'
OR products.city != 'Duluth'
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
