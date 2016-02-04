--Peter Guggisberg
--2-2-16
--Database Management/Professor Labouseur
--Lab 3

--1 List the ordnum and totalusd of all orders.
SELECT orders.ordnum, orders.totalusd
FROM orders;

--2 List the name and city of agents named Smith.
SELECT agents.name, agents.city
FROM agents
WHERE agents.name = 'Smith';

--3 List the pid, name, and priceusd of products with quantity more than 208,000.
SELECT products.pid, products.name, products.priceusd
FROM products
WHERE products.quantity > 208000;

--4 List the names and cities of customers in Dallas.
SELECT customers.name, customers.city
FROM customers
WHERE customers.city = 'Dallas';

--5 List the names of agents not in New York and not in Tokyo.
SELECT agents.name
FROM agents
WHERE agents.city <> 'New York'
   AND agents.city <> 'Tokyo';

--6 List all data for products not in Dallas or Duluth that cost $1.00usd or more.
SELECT *
FROM products
WHERE products.city <> 'Dallas'
   AND products.city <> 'Duluth'
   AND products.priceusd >= 1.00;

--7 List all data for orders in January or March.
SELECT *
FROM orders
WHERE orders.mon = 'jan'
   OR orders.mon = 'mar';

--8 List all data for orders in February less than $500.00usd.
SELECT *
FROM orders
WHERE orders.mon = 'feb'
   AND orders.totalusd < 500.00;

--9 List all orders from the customer whose cid is c005.
SELECT *
FROM orders
WHERE orders.cid = 'c005';
