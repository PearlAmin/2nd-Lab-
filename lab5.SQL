--Pearl Amin 
--Lab 5 Joins 

-- Question 1 -- 

select agents.city 
from agents inner join orders on agents.aid=orders.aid 
where orders.cid = 'c006'
order by city ASC 
; 

-- Question 2 -- 

select distinct o2.pid
--alias because use orders twice
from orders o1 inner join customers c on o1.cid=c.cid
			   inner join orders o2 on o1.aid=o2.aid
where c.city = 'Beijing'
Order By o2.pid DESC 
;

-- Question 3 -- 

select c.name
from customers c full outer join orders o on c.cid=o.cid 
--left or full join - there are customers that have no orders
where o.cid is null 
--see last row of nulls 

-- Question 4 -- 

Select * 
from orders o inner join customers c on o.cid = c.cid 
			  inner join agents a on o.aid = a.aid 
where c.city = a.city 

-- Question 5 -- 

select count(o.ordno), c.name, a.name
from orders o inner join customers c on o.cid = c.cid
              inner join agents a on o.aid = a.aid            
              --everything from orders,customers,agents
where o.cid in (select c1.cid
                from customers as c1, agents as a
                where c1.city = a.city)
                and  o.aid in (select a1.aid
                               from agents as a1, customers as c2
                               where c2.city = a1.city)
Group By c.name, a.name
Having count (o.ordno) > 1
--having ordered one or more orders
;

-- Question 6 -- 

select c.name as "Customer",
       a.name as "Agent",
       a.city as "Shared City"
from Customers c inner join Agents a on c.city = a.city
;

-- Question 7 -- 

select name, city 
from customers 
where city in (select city 
              from products 
              group by city
              order by count (*) ASC
              Limit 1 
              )
; 







