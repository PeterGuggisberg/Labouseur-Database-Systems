--Peter Guggisberg
--2-23-16
--Database Management/Professor Labouseur
--Lab 6

--1 Display the name and city of customers who live in any city that makes the most different kinds of products.
select customers.name, customers.city
from customers
where customers.city in (select products.city
			 from products
			 group by products.city
			 order by count(products.city) desc
			 limit 2
			);

--2 Display the names of products whose priceUSD is strictly above the average priceUSD, in reverse-alphabetical order.
select products.name
from products
where priceUSD > (select avg(priceusd)
		  from products
		 )
Order by products.name DESC;

--3 Display the customer name, pid ordered, and the total for all orders, sorted by total from high to low.
select customers.name, orders.pid, orders.totalusd
from customers, orders
where customers.cid = orders.cid
order by orders.totalusd desc;

--4 Display all customer names (in alphabetical order) and their total ordered, and nothing more.
select customers.name, coalesce(sum(orders.totalusd), 0.00)
from customers
left outer join orders
on customers.cid = orders.cid
group by customers.cid
order by customers.name ASC;

--5 Display the names of all customers who bought products from agents based in Tokyo along with the names of the products they ordered and the names of the agents who sold it to them.
select customers.name, products.name, agents.name
from customers
full outer join orders
on orders.cid = customers.cid 
full outer join agents
on agents.aid = orders.aid 
full outer join products
on products.pid = orders.pid
where agents.city = 'Tokyo';

--6 Write a query to check the accuracy of the totalusd column in the orders table.
select (orders.qty *  products.priceUSD) * (1 - customers.discount/100), orders.totalusd
from products
right outer join orders
on products.pid = orders.pid
left outer join customers
on customers.cid = orders.cid
where (orders.qty * products.priceUSD) * (1 - customers.discount/100) = orders.totalusd;

--7 What’s the difference between a LEFT OUTER JOIN and a RIGHT OUTER JOIN?
-- Left Outer Join- References the left most table first to match the data.
select agents.name
from agents
Left outer join orders
on agents.aid = orders.aid;
-- Right Outer Join- References the right most table first to match the data.
select agents.name
from agents
Right outer join orders
on agents.aid = orders.aid;
-- The outputs are different because of the order in which the tables were referenced.