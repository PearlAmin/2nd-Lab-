Select ordno, totalUSD 
From orders 
; 
select name, city 
from agents  
where name = 'Smith' 
;  
select pid, name, priceUSD 
from products  
where qty > 200010 
; 
select name, city 
from customers 
where city = 'Duluth' 
; 
select name
from agents  
where city != 'New York' and city != 'Duluth' 
; 
select pid, name, city, qty, priceUSD
from products   
where city != 'Dallas' and city != 'Duluth' and priceUSD > 1
; 
select ordno, month, cid, aid, pid, quantity, totalUSD
from orders    
where month = 'Mar' OR month = 'May'
; 
select ordno, month, cid, aid, pid, quantity, totalUSD
from orders    
where month = 'Feb' And totalUSD >= '500'
; 
select *
from orders    
where cid = 'c005'
; 

/*
Pearl Amin 
Sept 17th 2017
Lab 3 
*/ 
