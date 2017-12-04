-- Pearl Amin 
-- Big Database Project - Pearl by Pearl Database 
-- Database Systems
-- Alan Labouseur
-- December 4th, 2017 

DROP TABLE IF EXISTS Zipcode;
CREATE TABLE Zipcode (
	Zipcode text not null,
	City text,
	State text,
	Country text,
	primary key (Zipcode) 
); 

DROP TABLE IF EXISTS People; 
	CREATE TABLE People (
	PID char(3) not null, 
	FirstName text,
	LastName text,
	Birthdate int,
	StreetAddress text,
	Zipcode text not null references Zipcode(Zipcode),
	primary key (PID)
); 

DROP TABLE IF EXISTS Customers; 
	CREATE TABLE Customers (
	PID char(3) not null references people(PID),
	CID char(3) not null,
	NewCust text default 'Yes',
	Insider text, 
	VIB text,
	Rouge text,
	CONSTRAINT CHK_Memeber CHECK
		(NewCust='yes' or NewCust='no'),
        primary key(CID)
);
		
DROP TABLE IF EXISTS Employees;
	CREATE TABLE Employees (
		PID char(3) not null references People(PID),
		EID char(3) not null,
			primary key (EID) 
); 

DROP TABLE IF EXISTS Category; 
	CREATE TABLE Category ( 
	CatID char(3) not null,
	Face text, 
	Cheek text,
	Lip text,
	Eye text,
	Nails text,
       primary key(CatID)
); 
	
DROP TABLE IF EXISTS Products;
	CREATE TABLE Products (
	ProdID char(3) not null,
	CatID char(3) not null references Category(CatID), 
	ProdName text,
	ProdDesc text,
	ProdPriceUSD int,
        primary key(ProdID)
);

DROP TABLE IF EXISTS Ingredients; 
	CREATE TABLE Ingredients (
	IID char(3) not null,
	IngreName text,
	IngrePriceUSD int,
        primary key(IID)
	
);	

DROP TABLE IF EXISTS ProductIngredient;
	CREATE TABLE ProductIngredient(
	ProdID char(3) not null references Products(ProdID),
	IID char(3) not null references Ingredients(IID)
	
);

DROP TABLE IF EXISTS Orders; 
	CREATE TABLE Orders (
	PID char(3) not null references People(PID), 
	OID char(3) not null, 
	CID char(3) not null references Customers(CID), 
	OrderDate int, 
	ShippingMethod text,
	PaymentMethod text,
	TotalUSD numeric(10,2),
        primary key(OID)
); 

DROP TABLE IF EXISTS LineItems; 
	CREATE TABLE LineItems (
	OID char(3) not null references Orders(OID),
	ProdID char(3) not null references Products(ProdID), 
	Qty int not null,
	UnitPriceUSD int not null,
		primary key (OID, ProdID)
); 
	
		
-- INSERTS INTO Zipcode --

insert into zipcode 
(zipcode, city, state, country)
values ('18807', 'Bwater', 'NJ', 'USA'); 

insert into zipcode 
(zipcode, city, state, country)
values ('18808', 'Potown', 'NY', 'USA'); 

insert into zipcode 
(zipcode, city, state, country)
values ('18809', 'Lotown', 'CT', 'USA');   

insert into zipcode 
(zipcode, city, state, country)
values ('18810', 'Zotown', 'PA', 'USA'); 

-- INSERTS INTO PEOPLE -- 

insert into People 
(PID, FirstName, LastName, Birthdate, StreetAddress, Zipcode) 
 values ('p01', 'Pearl', 'Amin', 043096, '13 Morgan Pl', '18807');
 
 insert into People 
(PID, FirstName, LastName, Birthdate, StreetAddress, Zipcode) 
 values ('p02', 'Alan', 'Labouseur', 111120, '30 Willington Sq', '18809');

insert into People 
(PID, FirstName, LastName, Birthdate, StreetAddress, Zipcode) 
 values ('p03', 'Jane', 'Deer', 010190, '14 Morgan Pl', '18808');
 
insert into People 
(PID, FirstName, LastName, Birthdate, StreetAddress, Zipcode) 
 values ('p04', 'John','Doe', 020290, '3399 North Road', '18810'); 
 
 insert into People 
(PID, FirstName, LastName, Birthdate, StreetAddress, Zipcode) 
 values ('p05', 'Dhyan', 'Amin', 0303090, '1600 Penn Ave', '18807');
 
  insert into People 
(PID, FirstName, LastName, Birthdate, StreetAddress, Zipcode) 
 values ('p06', 'Finding', 'Nemo', 121297, '21 Wallaby Way', '18809');
 
 insert into People 
(PID, FirstName, LastName, Birthdate, StreetAddress, Zipcode) 
 values ('p07', 'Dory', 'Fish', 101095, '31 Aquarium Rd', '18810');
  
 insert into People 
(PID, FirstName, LastName, Birthdate, StreetAddress, Zipcode) 
 values ('p08', 'Joy', 'Nima', 120964, '90 Water Ct', '18808');
  
 insert into People 
(PID, FirstName, LastName, Birthdate, StreetAddress, Zipcode) 
 values ('p09', 'Data', 'Base', 042091, '40 Fulton St', '18810');
 
 insert into People 
(PID, FirstName, LastName, Birthdate, StreetAddress, Zipcode) 
 values ('p10', 'Flip', 'Flop', 050575, '50 Ocean Ct', '18807'); 
 
 -- INSERTS INTO Customers -- 
 
 insert into Customers
 (PID, CID, NewCust, Insider, VIB, Rouge)
 values ('p01', 'c01', 'yes', 'no', 'no', 'o');
 
 insert into Customers
 (PID, CID, NewCust, Insider, VIB, Rouge)
 values ('p06', 'c02', 'no', 'yes', 'no', 'no'); 
 
 insert into Customers
 (PID, CID, NewCust, Insider, VIB, Rouge)
 values ('p02', 'c03', 'no', 'no', 'yes', 'no'); 
 
 insert into Customers
 (PID, CID, NewCust, Insider, VIB, Rouge)
 values ('p07', 'c04',  'no', 'no', 'no', 'yes'); 
  
 insert into Customers
 (PID, CID, NewCust, Insider, VIB, Rouge)
 values ('p03', 'c05', 'yes', 'no', 'no', 'no'); 
 
 -- INSERT INTO Employees 
 
 insert into Employees
 (PID, EID)
 values ('p08', 'e01'); 
 
 insert into Employees 
 (PID, EID)
 values ('p04', 'e02'); 
 
 insert into Employees 
 (PID, EID)
 values ('p09' , 'e03');
 
 insert into Employees 
 (PID, EID)
 values ('p05' ,'e04');
 
 insert into Employees
 (PID, EID)
 values ('p10','e05');  
 
 -- INSERT INTO Category -- 
 
insert into Category 
 (CatID, Face, Cheek, Lip, Eye, Nails)
 values ('ca1', 'yes', 'no','no','no', 'no'); 
 
insert into Category 
 (CatID, Face, Cheek, Lip, Eye, Nails)
 values ('ca2', 'no', 'yes', 'no', 'no', 'no');
 
insert into Category 
 (CatID, Face, Cheek, Lip, Eye, Nails)
 values ('ca3','no', 'no', 'yes', 'no', 'no');
 
insert into Category 
 (CatID, Face, Cheek, Lip, Eye, Nails)
 values ('ca4','no', 'no', 'no', 'yes', 'no'); 
 
insert into Category 
 (CatID, Face, Cheek, Lip, Eye, Nails)
 values ('ca5', 'no', 'no', 'no', 'no', 'yes'); 
 
 -- INSERT INTO Products -- 
 
insert into Products 
 (ProdID, CatID, ProdName, ProdDesc, ProdPriceUSD) 
 values ('pr1', 'ca5', 'NailPolish', 'Ruby', 10.00); 
 
insert into Products 
 (ProdID, CatID, ProdName, ProdDesc, ProdPriceUSD) 
 values ('pr2', 'ca4', 'EyeLiner', 'Black', 25.00); 
 
insert into Products 
 (ProdID, CatID, ProdName, ProdDesc, ProdPriceUSD) 
 values ('pr3', 'ca3', 'LipStick', 'Purple', 35.00);  
 
insert into Products 
 (ProdID, CatID, ProdName, ProdDesc, ProdPriceUSD) 
 values ('pr4', 'ca2', 'Blush', 'Orgasm', 45.00); 
 
insert into Products 
 (ProdID, CatID, ProdName, ProdDesc, ProdPriceUSD) 
 values ('pr5', 'ca1', 'Foundation', 'Caramel', 65.00); 
 
insert into Products 
 (ProdID, CatID, ProdName, ProdDesc, ProdPriceUSD) 
 values ('pr6', 'ca1', 'Concealer', 'Butter', 20.00); 
 
insert into Products 
 (ProdID, CatID, ProdName, ProdDesc, ProdPriceUSD) 
 values ('pr7', 'ca4', 'Eyeshadow', 'Green', 20.00); 
 
insert into Products 
 (ProdID, CatID, ProdName, ProdDesc, ProdPriceUSD) 
 values ('pr8', 'ca3', 'Lipliner', 'Blood', 30.00); 
 
 
 -- INSERT INTO Ingredients -- 
 
insert into Ingredients 
 (IID, IngreName, IngrePriceUSD) 
 values ('i01', 'Talc', .1); 
 
insert into Ingredients 
 (IID, IngreName, IngrePriceUSD) 
 values ('i02', 'Oil', .7); 
 
insert into Ingredients 
 (IID, IngreName, IngrePriceUSD) 
 values ('i03', 'Silicone', .8);   
 
insert into Ingredients 
 (IID, IngreName, IngrePriceUSD) 
 values ('i04', 'Wax', .4);
 
insert into Ingredients 
 (IID, IngreName, IngrePriceUSD) 
 values ('i05', 'Water', .01); 
 
insert into Ingredients 
 (IID, IngreName, IngrePriceUSD) 
 values ('i06', 'IronOxides', .6);   
  
insert into Ingredients 
 (IID, IngreName, IngrePriceUSD) 
 values ('i07', 'TitanDiox', .2); 
 
 -- INSERT INTO ProductIngredient --
 
insert into ProductIngredient
(ProdID, IID)
values ('pr1', 'i01');   

insert into ProductIngredient
(ProdID, IID)
values ('pr1', 'i05'); 

insert into ProductIngredient
(ProdID, IID)
values ('pr1', 'i06');   
 
insert into ProductIngredient
(ProdID, IID)
values ('pr1', 'i07');  
 
insert into ProductIngredient
(ProdID, IID)
values ('pr2', 'i04');   
 
 insert into ProductIngredient
(ProdID, IID)
values ('pr2', 'i06');   
 
insert into ProductIngredient
(ProdID, IID)
values ('pr3', 'i02');  
 
insert into ProductIngredient
(ProdID, IID)
values ('pr3', 'i04'); 
 
insert into ProductIngredient
(ProdID, IID)
values ('pr3', 'i06');  
 
insert into ProductIngredient
(ProdID, IID)
values ('pr3', 'i07'); 

insert into ProductIngredient
(ProdID, IID)
values ('pr4','i01');  

insert into ProductIngredient
(ProdID, IID)
values ('pr4', 'i06'); 

insert into ProductIngredient
(ProdID, IID)
values ('pr4', 'i07'); 

insert into ProductIngredient
(ProdID, IID)
values ('pr5', 'i02');  
 
insert into ProductIngredient
(ProdID, IID)
values ('pr5', 'i03');  
 
insert into ProductIngredient
(ProdID, IID)
values ('pr5', 'i05');  
  
insert into ProductIngredient
(ProdID, IID)
values ('pr5', 'i06');  

insert into ProductIngredient
(ProdID, IID)
values ('pr5', 'i07'); 

insert into ProductIngredient
(ProdID, IID)
values ('pr6', 'i02');  
 
insert into ProductIngredient
(ProdID, IID)
values ('pr6', 'i03');  

insert into ProductIngredient
(ProdID, IID)
values ('pr6', 'i04');  
 
insert into ProductIngredient
(ProdID, IID)
values ('pr6', 'i05');  
  
insert into ProductIngredient
(ProdID, IID)
values ('pr6', 'i06');  

insert into ProductIngredient
(ProdID, IID)
values ('pr6', 'i07'); 
 
insert into ProductIngredient
(ProdID, IID)
values ('pr7','i01');  

insert into ProductIngredient
(ProdID, IID)
values ('pr7', 'i06'); 

insert into ProductIngredient
(ProdID, IID)
values ('pr7', 'i07'); 
 
insert into ProductIngredient
(ProdID, IID)
values ('pr8', 'i02');  
 
insert into ProductIngredient
(ProdID, IID)
values ('pr8', 'i03');  

insert into ProductIngredient
(ProdID, IID)
values ('pr8', 'i04');  
 
insert into ProductIngredient
(ProdID, IID)
values ('pr8', 'i05');  
  
insert into ProductIngredient
(ProdID, IID)
values ('pr8', 'i06');  

insert into ProductIngredient
(ProdID, IID)
values ('pr8', 'i07');  
 
-- INSERT INTO Orders -- 

insert into Orders 
(PID, OID, CID, Orderdate, ShippingMethod, PaymentMethod, TotalUSD)
values ('p01', 'o01', 'c01', 091017, 'USPS', 'CreditCard', 30.00);  

insert into Orders 
(PID, OID, CID, Orderdate, ShippingMethod, PaymentMethod, TotalUSD)
values ('p02', 'o02', 'c02', 091118, 'Flash', 'CreditCard', 100.00); 

insert into Orders 
(PID, OID, CID, Orderdate, ShippingMethod, PaymentMethod, TotalUSD)
values ('p03', 'o03', 'c01', 091219, 'Standard', 'CreditCard', 300.00); 

insert into Orders 
(PID, OID, CID, Orderdate, ShippingMethod, PaymentMethod, TotalUSD)
values ('p04', 'o04', 'c01', 091317, 'Flash', 'CreditCard', 145.00); 

insert into Orders 
(PID, OID, CID, Orderdate, ShippingMethod, PaymentMethod, TotalUSD)
values ('p05', 'o05', 'c01', 091418, 'Flash', 'CreditCard', 400.00); 

-- INSERT INTO LineItems --
insert into LineItems
(OID, ProdID, Qty, UnitPriceUSD)
values ('o05', 'pr1', 2, 10.00); 

insert into LineItems
(OID, ProdID, Qty, UnitPriceUSD)
values ('o05', 'pr2', 4, 25.00); 

insert into LineItems
(OID, ProdID, Qty, UnitPriceUSD)
values ('o05', 'pr4', 1, 45.00); 

insert into LineItems
(OID, ProdID, Qty, UnitPriceUSD)
values ('o04', 'pr3', 2, 35.00); 

insert into LineItems
(OID, ProdID, Qty, UnitPriceUSD)
values ('o04', 'pr5', 4, 65.00); 

insert into LineItems
(OID, ProdID, Qty, UnitPriceUSD)
values ('o04', 'pr6', 5, 20.00); 

insert into LineItems
(OID, ProdID, Qty, UnitPriceUSD)
values ('o03', 'pr7', 2, 10.00); 

insert into LineItems
(OID, ProdID, Qty, UnitPriceUSD)
values ('o03', 'pr8', 5, 25.00); 

insert into LineItems
(OID, ProdID, Qty, UnitPriceUSD)
values ('o03', 'pr1', 3, 45.00); 

insert into LineItems
(OID, ProdID, Qty, UnitPriceUSD)
values ('o02', 'pr2', 2, 10.00); 

insert into LineItems
(OID, ProdID, Qty, UnitPriceUSD)
values ('o02', 'pr3', 1, 25.00); 

insert into LineItems
(OID, ProdID, Qty, UnitPriceUSD)
values ('o02', 'pr4', 4, 45.00); 

insert into LineItems
(OID, ProdID, Qty, UnitPriceUSD)
values ('o01', 'pr7', 2, 10.00); 

insert into LineItems
(OID, ProdID, Qty, UnitPriceUSD)
values ('o01', 'pr6', 4, 25.00); 

insert into LineItems
(OID, ProdID, Qty, UnitPriceUSD)
values ('o01', 'pr5', 2, 45.00); 

-- END OF INSERTS -- 

-- VIEW for Flash Orders -- 

create or replace view FlashOrders 
	as select distinct pid, oid, shippingmethod 
	from orders 
	where shippingmethod = 'Flash'  ;
	
--﻿select * from FlashOrders; 

-- VIEW for CustomersandPeople -- 
 
﻿create or replace view CustomersandPeople
	as select distinct p.pid, p.firstname, p.lastname
	from people p, customers c 
	where c.pid in 
		(select pid 
         from people
		 where c.pid = p.pid 
		order by p.pid ASC) ; 
		
-- select * from CustomersandPeople; 

-- Stored Procedure find people by FirstName and/or LastName -- 
﻿
CREATE OR REPLACE FUNCTION searchCustomerName (text, text, REFCURSOR) returns refcursor as
$$
	Declare
			searchFirst TEXT := $1;
			searchLast TEXT := $2;
			resultSet REFCURSOR := $3; 
BEGIN 
		OPEN resultSet FOR
			SELECT *
			FROM People
			WHERE FirstName LIKE searchFirst
			AND LastName LIKE searchLast;
		return resultSet; 
end; 
$$ 
LANGUAGE plpgsql; 

--Select searchCustomerName ('P%', 'A%', 'ref');
--Fetch all from ref; 

-- Stored Procedure get totalorders per pid --
CREATE OR REPLACE FUNCTION totalsalesUSD (text, text, REFCURSOR) returns refcursor as
$$
	Declare
			totalsalesusd int := $1;
			pid TEXT := $2;
			oid TEXT := $3;
			cid TEXT := $4;
			resultSet REFCURSOR := $5; 
BEGIN 
		OPEN resultSet FOR
﻿		select pid, orders.oid, cid, qty*unitpriceUSD as "TotalSalesUSD"
		from orders inner join lineitems on orders.oid = lineitems.oid; 
return resultSet; 
end; 
$$ 
LANGUAGE plpgsql; 
		
-- TRIGGERS -- 
-- If an update occurs in lineitems, update will appear due to trigger -- 
﻿CREATE OR REPLACE FUNCTION totalsalesUSD () returns trigger as
$$
DECLARE
   newTotal int;
   cursor   refcursor;
BEGIN 
    open cursor for 
	   select sum(qty*unitpriceUSD) as "TotalSalesUSD"
	   from orders inner join lineitems on orders.oid = lineitems.oid
       where orders.oid = old.oid;
    fetch cursor into newTotal;
    
    update orders
    set new.totalSalesUSD = newTotal
    where orders.oid = old.oid;
end; 
$$ 
LANGUAGE plpgsql; 
	
CREATE TRIGGER check_totalsales
AFTER UPDATE on LineItems
FOR EACH ROW
EXECUTE PROCEDURE totalsalesUSD(); 

select * from lineitems; 

-- REPORTS ---

--Total Money collected in 2017 per product:
	select sum(qty * unitpriceUSD)
	from lineitems
	group by unitpriceUSD	
	
--	Quantity of Each Product Ordered per Order:
	SELECT OID, ProdID, SUM(Qty) AS TotalQuantityOrdered
	FROM LineItems
	GROUP BY OID, ProdID
	ORDER BY SUM(Qty) DESC; 

--Total Amount Spent by Customers in Each City:
	SELECT z.ZipCode ,z.State, SUM(o.TotalUSD) AS TotalSpent
	FROM Zipcode z, People p, Orders o
	WHERE z.ZipCode = p.ZipCode
	AND p.PID = o.PID
	GROUP BY z.ZipCode, z.State
	ORDER BY SUM(o.TotalUSD) DESC;
	﻿
--Customers that spent the most:
	SELECT p.PID, p.FirstName, p.LastName, sum(o.TotalUSD) AS TotalSpent
	FROM People p, Orders o
	WHERE p.PID = o.PID
	GROUP BY p.PID, p.FirstName, p.LastName
	ORDER BY sum(o.TotalUSD) DESC;

--Customers that made the most orders:
	SELECT p.PID, p.FirstName, p.LastName, count(o.OID) AS TotalOrders
	FROM People p, Orders o
	WHERE p.PID = o.PID
	GROUP BY p.PID, p.FirstName, p.LastName
	ORDER BY count(o.OID) DESC;  

-- SECURITY -- 
create role admin;
create role CEO; 
create role managers; 
-- Admin -- 
grant all on all tables in schema public to admin;
-- Managers -- 
grant SELECT, INSERT, UPDATE, DELETE on employees to managers;
grant SELECT, INSERT, UPDATE on people to managers;		
grant SELECT, INSERT, UPDATE on customers to managers;
grant SELECT, INSERT, UPDATE lineitems to managers;
grant SELECT, INSERT, UPDATE products to managers;
grant SELECT, INSERT, UPDATE prodcutingredients to managers;
grant SELECT, INSERT, UPDATE ingredients to managers;
grant SELECT, INSERT, UPDATE category to managers;
grant SELECT on orders to managers;
-- CEO-- 
grant SELECT, INSERT, UPDATE, DELETE on managers to CEO; 
grant SELECT, INSERT, UPDATE, DELETE on employees to CEO;
grant SELECT, INSERT, UPDATE, DELETE on people to CEO;
grant SELECT, INSERT, UPDATE, on customers to CEO;
grant SELECT, INSERT, UPDATE, DELETE on orders to CEO;
grant SELECT, INSERT, UPDATE, DELETE on lineitems to CEO;
grant SELECT, INSERT, UPDATE, DELETE on zipcode to CEO;
grant SELECT, INSERT, UPDATE, DELETE products to CEO;
grant SELECT, INSERT, UPDATE, DELETE productingredients to CEO;
grant SELECT, INSERT, UPDATE, DELETE ingredients to CEO;
grant SELECT, INSERT, UPDATE, DELETE category to CEO;

-- CEO GOES EVIL -
revoke all on all tables in schema public from CEO; 
