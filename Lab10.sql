-- Pearl Amin 
-- Database System Lab 10: Stored Procedures 
-- November 26th 2017 


-- Question 1 --
-- ThePreReqsFor: -- 

Create or Replace function PreReqsFor(int, refcursor) 
									  returns refcursor as 
$$
Declare
   							Course_Number int      := $1;
   							ResultSet   refcursor := $2;
Begin

  	 Open ResultSet for 
     					 Select PreReqNum
      					 From   PreRequisites
     					 Where  CourseNum = Course_Number;
     					 
   Return ResultSet;
   
End;

$$ 
language plpgsql;

-- Select Statement for PreReqsFor -- 

Select PreReqsFor(499, 'results');
Fetch all from results;

--221, 308-- 

-- Question 2 -- 
-- IsPreReqsFor: --

Create or Replace function IsPreReqFor(int, refcursor) 
									   returns refcursor as 
$$
Declare
   									PreReq int      := $1;
   									ResultSet   refcursor := $2;
Begin

   	Open ResultSet for 
      					Select CourseNum
     					From   PreRequisites
       					Where  PreReqNum= PreReq;
       					
   Return ResultSet;
   
End;

$$ 
language plpgsql;

-- Select Statement for IsPreReqsFor -- 

Select IsPreReqFor(120, 'results');
Fetch all from results;

-- 308, 220 -- 

