-- Pearl Amin 
-- Lab 6 Interesting and Painful Queries 
-- Oct 11th, 2017 

-- Question 1 -- 
select name, city 
from customers 
where city in (select city 
              from products 
              group by city
              order by count (*) DESC
              limit 1
              )
; 

-- Question 2 -- 

Select p.name 
From products p
Where p.priceUSD >= (select avg(p2.priceUSD)
               		 from products p2)
Order by p.name DESC
;

-- Question 3 -- 
Select c.name, o.pid, sum(totalUSD)
From orders o inner join customers c on o.cid=c.cid 
Group by c.name, o.pid 
Order by sum(totalUSD) ASC
;

-- Question 4 -- 
Select c.name, coalesce(sum(totalUSD),0)
From orders o right outer join customers c on o.cid=c.cid 
Group by c.cid 
Order by c.name DESC
;

-- Question 5 -- 
Select c.name, a.name, p.name
From orders o inner join customers c on o.cid = c.cid
			  inner join agents a on o.aid = a.aid 
			  inner join products p on o.pid = p.pid 
Where a.city = 'Newark'
;

-- Question 6 -- 
Select (quantity * priceUSD)*(100-discountPCT)/100, ordno
From orders o inner join products p on o.pid = p.pid 
			  inner join customers c on o.cid = c.cid 
Where (quantity * priceUSD)*(100-discountPCT)/100 != o.totalUSD 
;

--  Question 7 -- 
--The difference between a left outer join and a right outer join is in the order of the way the query is written. 
--To clarify, a right outer join will return all of the information in the right table and any matching rows from the left. 
--A left outer join will be similar in that it will return all of the information from the table on the left, that is written first, 
--as well as the matching rows from the table on the right (written after the first one) 
--For example, 
select *
from orders o left outer join products p on o.pid=p.pid ;
--This results in no nulls because this left outer join is pulling from orders first because it is the left most table I wrote in the join. It pulls all of the
--rows from orders, then the rows from products after that match it. Since pid p08 does not have have orders, it will not show up in the results and therefore 
--we will be unaware of the fact that p08 has not been ordered and that it is null.  
select *
from orders o right outer join products p on o.pid=p.pid ; 
--This would result in nulls because it is pulling from all the rows in the products table, where there is a pid, p08, that does not have a corresponding order
--in the orders table, so it shows up as null because right outer joins pulls from products, and then the matching rows in orders and there is not an order
--for pid p08, resulting and showing the nulls. 