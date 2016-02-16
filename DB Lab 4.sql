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
SELECT products.pid
FROM products
WHERE  in ((SELECT orders.aid
	   FROM orders
	   WHERE cid in (SELECT customers.cid
		      FROM customers
		      WHERE customers.city = 'Dallas'
		     )
	    )
	  );

--3 Get the ids and names of customers who did not place an order through agent a01.
SELECT customers.cid, customers.name
FROM customers
WHERE  in (SELECT orders.aid
	   FROM orders
	   WHERE orders.aid <> 'a01'
	  );

--4 Get the ids of customers who ordered both products p01 and p07.
SELECT customers.cid
FROM customers
WHERE  in (SELECT orders.pid
	   FROM orders
	   WHERE orders.pid in ('p01','p07')
	  );

--5 Get the ids of products not ordered by any customers who placed any order through agent a07, sorted by pid from highest to lowest.
SELECT products.pid
FROM products
WHERE  in (SELECT orders.pid
	   FROM orders
	   WHERE orders.pid in ('p01','p07')
	  );

--6 Get the name, discounts, and city for all customers who place orders through agents in London or New York.
SELECT customers.name, customers.discount, customers.city
FROM customers
WHERE  in ((SELECT orders.aid
	    FROM orders
	    WHERE aid in (SELECT agents.aid
		          FROM agents
		          WHERE agents.city in ('London', 'New York')
		         )
	   )
	  );

--7 Get all customers who have the same discount as that of any customers in Dallas or London.
SELECT customers.discount
FROM customers
WHERE cid in (SELECT customers.city
	      FROM customers
	      WHERE customers.city in ('Dallas', 'London')
	     );

--8 