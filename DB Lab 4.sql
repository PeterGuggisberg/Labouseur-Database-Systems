--Peter Guggisberg
--2-9-16
--Database Management/Professor Labouseur
--Lab 4

--1 Get the cities of agents booking an order for a customer whose cid is c002.
SELECT agents.city
FROM agents
WHERE aid in (SELECT orders.aid
	      FROM orders
	      WHERE orders.cid = 'c002'
	     );

--2 Get the ids of products ordered through any agent who takes at least one order from a customer in Dallas, sorted by pid from highest to lowest.
SELECT Distinct orders.pid
FROM orders
WHERE aid in ((SELECT orders.aid
	       FROM orders
	       WHERE cid in (SELECT customers.cid
		             FROM customers
		             WHERE customers.city = 'Dallas'
		            )
	      )
	     )
ORDER BY pid DESC;

--3 Get the ids and names of customers who did not place an order through agent a01.
SELECT dISTINCT customers.cid, customers.name
FROM customers
WHERE cid nOT in (SELECT orders.cid
	      FROM orders
	      WHERE orders.aid = 'a01'
	     );

--4 Get the ids of customers who ordered both products p01 and p07.
SELECT distinct orders.cid
FROM orders
WHERE orders.pid = 'p01'
  Intersect
SELECT distinct orders.cid
FROM orders
WHERE orders.pid = 'p07';

--5 Get the ids of products not ordered by any customers who placed any order through agent a07, sorted by pid from highest to lowest.
SELECT products.pid
FROM products
WHERE pid not in (SELECT orders.pid
	      FROM orders
	      WHERE orders.aid = 'a07'
	     )
ORDER BY pid DESC;

--6 Get the name, discounts, and city for all customers who place orders through agents in London or New York.
SELECT customers.name, customers.discount, customers.city
FROM customers
WHERE cid in ((SELECT distinct orders.cid
	       FROM orders
	       WHERE aid in (SELECT agents.aid
		             FROM agents
		             WHERE agents.city in ('London', 'New York')
		            )
	      )
	     );

--7 Get all customers who have the same discount as that of any customers in Dallas or London.
SELECT *
FROM customers
WHERE discount in (SELECT customers.discount
	      FROM customers
	      WHERE customers.city in ('Dallas', 'London')
	     );

--8 Check constraints are additional restrictions on the values to be inserted in or updated to a table. 
-- The advantage to having check constraints in a database is that it provides additional checks to the data in the database. 
-- For example, a datatype can be seen as a check. Check constraints place data value restrictions on the contents of a database using Boolean expressions (true, false, or unknown). 
-- Using check constraints to find like datatypes in a database could be useful. A bad example of check constraints would be if you were checking data and the data values came back as unknown or not unknown. 
-- Unknown and not unknown are the same and unknown data in a database usually isn't very helpful.