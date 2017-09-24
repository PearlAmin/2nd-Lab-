-- QUESTION 1 -- 

SELECT city
FROM agents 
WHERE aid in (SELECT aid
              FROM orders
              WHERE cid = 'c006')
	;
    
-- QUESTION 2 -- 

SELECT DISTINCT pid
FROM orders 
WHERE cid IN (SELECT cid
				FROM customers 
				WHERE city = 'Beijing')
				AND aid IN (SELECT aid
							FROM orders 
							ORDER BY aid)
ORDER BY pid DESC
    ;

-- QUESTION 3 -- 

SELECT cid, name
FROM customers 
WHERE cid IN (SELECT cid
				FROM orders 
				WHERE aid != 'a03')
   ;

-- QUESTION 4 -- 

SELECT cid
FROM customers 
WHERE cid IN (SELECT cid
				FROM orders 
				WHERE pid = 'p01'
				AND cid IN (SELECT cid
							FROM orders 
							WHERE pid = 'p07'))
    ;

-- QUESTION 5 --

SELECT DISTINCT pid
FROM products 
WHERE pid NOT IN (SELECT pid
					FROM orders 
					WHERE aid IN ('a02', 'a03'))
ORDER BY pid DESC
    ;
    
-- QUESTION 6 -- 

SELECT name, city, discountPct
FROM customers 
WHERE cid IN (SELECT cid
				FROM orders 
				WHERE aid IN (SELECT aid
								FROM agents 
								WHERE city IN ('Tokyo', 'New York')))
    ;

-- QUESTION 7 -- 

SELECT *
FROM customers 
WHERE discountPct IN (SELECT discountPct
						FROM customers 
						WHERE city IN ('Duluth', 'London'))
	;
-- QUESTION 8 -- 

-- Check constraints are integrity constraints in SQL that specifies requirements that must be met by each row in a database table.
-- The check constraints essentially rules and restrictions that are applied to the table or columns to ensure that unwanted data cannot be inserted into the tables. 
-- This is to make sure that the data in the database remains accurate and reliable. 
-- Some examples of check constraints can result in the answer of 'true', 'false', or 'unknown' (if there is a NULL). 
-- So in a table containing employee's first name, last name, job, and age, someone could ask a check constraint to check for 
-- select first name, from employees, where age >= 40. This check constraint would return all of the employees first names that were 40 years of age or older. 
-- This would be an example of a good check constraint. A bad check constraint would compromise the integrity and validity of the data. This could happen if a user tried to 
-- ALTER, INSERT, OR DELETE certain data without being careful. For example, inserting inserting an age for a user with an unknown last name would compromise the validity of the data.
-- It is key for the data to remain as accurate as possible as of the highest quality. 
