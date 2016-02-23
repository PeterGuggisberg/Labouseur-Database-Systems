--Peter Guggisberg
--2-16-16
--Database Management/Professor Labouseur
--Lab 5

--1 Show the cities of agents booking an order for a customer whose cid is c002. Use joins; no subqueries.
SELECT agents.city
FROM agents, orders
WHERE agents.aid = orders.aid
    AND orders.cid = 'c002';

--2 Show the ids of products ordered through any agent who makes at least one order for a customer in Dallas, sorted by pid from highest to lowest. Use joins; no subqueries.
SELECT Distinct products.pid
FROM products, orders, customers
WHERE products.pid = orders.pid
    AND customers.cid = orders.cid
    AND customers.city = 'Dallas'
ORDER BY pid DESC;

--3 Show the names of customers who have never placed an order. Use a subquery.
SELECT distinct customers.name
FROM customers
WHERE cid nOT In (Select orders.cid
	          From orders
	         );

--4 Show the names of customers who have never placed an order. Use an outer join.
SELECT distinct customers.name
FROM customers
Left outer join orders
on customers.cid = orders.cid
Where orders.cid is null;

--5 Show the names of customers who placed at least one order through an agent in their own city, along with those agents' names.
SELECT customers.name, agents.name
FROM customers, agents, orders
WHERE customers.cid = orders.cid
    AND agents.aid = orders.aid
    AND customers.city = agents.city;

--6 Show the names of customers and agents living in the same city, along with the name of the shared city, regardless of whether or not the customer has ever placed an order with that agent.
SELECT distinct customers.name, customers.city, agents.name, agents.city
FROM customers, agents, orders
WHERE customers.city = agents.city;

--7 Show the name and city of customers who live in the city that makes the fewest different kinds of products.
SELECT distinct customers.name, customers.city
FROM customers, products
WHERE customers.city In (select products.city 
			 from products
			 group by city
			 order by count(quantity) ASC
			 limit 1
			);
