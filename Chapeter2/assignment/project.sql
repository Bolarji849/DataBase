use mdc_work;

select* from customer,invoice,invoice_item;

 -- A. Show all data in each of the tablescustomer
 
 
 select FirstName,LastName,phone
  from customer;
 
--  B. List the LastName, FirstName, and Phone of all customers.

 select FirstName,LastName,phone
  from customer
 where FirstName = "Nikki";
 
-- C. List the LastName, FirstName, and Phone for all customers with a FirstName of ‘Nikki’

 select cus.FirstName,cus.LastName,cus.phone, i.DateIn,i.DateOut
  from customer cus
  join
  invoice i on cus.customerID = i.customerID
 where TotalAmount > 100.00;
 
 
-- D. List the LastName, FirstName, Phone, DateIn, and DateOut of all orders in excess 
-- of $100.00.


 select FirstName,LastName,phone
 from customer
 where FirstName like "B%";
 
-- E  List the LastName, FirstName, and Phone of all customers whose first name starts 
-- with ‘B’



 select FirstName,LastName,phone
 from customer
 where LastName like "%cat%";

-- F List the LastName, FirstName, and Phone of all customers whose last name includes 
-- the characters ‘cat


 select FirstName,LastName,phone
 from customer
 where phone like "_23%";
 
-- . List the LastName, FirstName, and Phone for all customers whose second and third 
-- digits (from the left) of their phone number are 23. For example, any phone number 
-- with an area code of “723” would meet the criteria.



 select min(TotalAmount) AS TotalAmountMin,
		max(TotalAmount)  AS TotalAmountMax
        
 from invoice;
 
 -- H Determine the maximum and minimum TotalAmount

 select avg(TotalAmount) AS  TotalAmountAvg
  from invoice;
  
-- I. Determine the average TotalAmount.

select count(*) AS NumberOfCustomers
from customer;

--  Count the number of customers.


select  LastName, FirstName
FROM customer
GROUP BY LastName, FirstName;

-- K. Group customers by LastName and then by FirstName.

select  LastName, FirstName, COUNT(*) AS customerCountOfNames
FROM customer
GROUP BY LastName, FirstName;

-- L. Count the number of customers having each combination of LastName and FirstName.

select  LastName, FirstName,phone
from customer
where customerID IN (select customerID from invoice where TotalAmount > 100.00)
ORDER BY LastName ASC, FirstName DESC;


-- M. Show the LastName, FirstName, and Phone of all customers who have had an order 
-- with TotalAmount greater than $100.00. Use a subquery. Present the results sorted by 
-- LastName in ascending order and then FirstName in descending order.

select cus.LastName, cus.FirstName,cus.phone
from  customer cus, invoice inv
WHERE cus.CustomerID = inv.CustomerID
AND inv.TotalAmount > 100.00
ORDER BY LastName ASC, FirstName DESC;



-- N. Show the LastName, FirstName, and Phone of all customers who have had an order 
-- with TotalAmount greater than $100.00. Use a join, but do not use JOIN ON syntax. 
-- Present results sorted by LastName in ascending order and then FirstName in descending order.


SELECT cus.LastName, cus.FirstName, cus.Phone
FROM customer cus
JOIN invoice inv ON cus.CustomerID = inv.CustomerID
WHERE inv.TotalAmount > 100.00
ORDER BY cus.LastName ASC, cus.FirstName DESC;

-- O. Show the LastName, FirstName, and Phone of all customers who have had an order with 
-- TotalAmount greater than $100.00. Use a join using JOIN ON syntax. Present results 
-- sorted by LastName in ascending order and then FirstName in descending order.

select  LastName, FirstName,phone
from customer
where customerID IN (select customerID from invoice_item where item like "%Dress Shirt%")
ORDER BY LastName DESC, FirstName ASC;

-- P. Show the LastName, FirstName, and Phone of all customers who have had an order 
-- with an Item named ‘Dress Shirt’. Use a subquery. Present results sorted by LastName 
-- in ascending order and then FirstName in descending order.

select cus.LastName, cus.FirstName,cus.phone
from customer cus, invoice_item it,invoice inv
where cus.customerID = inv.customerID
And inv.customerID = it.itemNumber
And it.Item = "Dress shirt" 
ORDER BY cus.LastName ASC, cus.FirstName DESC;







-- Q. Show the LastName, FirstName, and Phone of all customers who have had an 
-- order with an Item named ‘Dress Shirt’. Use a join, but do not use JOIN ON 

select cus.LastName, cus.FirstName,cus.phone
FROM customer cus
JOIN invoice_item it ON cus.CustomerID = it.itemNumber
WHERE Item like "%Dress Shirt%"
ORDER BY cus.LastName ASC, cus.FirstName DESC;


-- R. Show the LastName, FirstName, and Phone of all customers who have had an order with 
-- an Item named ‘Dress Shirt’. Use a join using JOIN ON syntax. Present results sorted by 
-- LastName in ascending order and then FirstName in descending order


select  cus.LastName AS CustomerLastName,cus.FirstName  AS CustomerFirstName,
       rf.LastName AS ReferredByLastName, rf.FirstName AS ReferredByFirstName
from customer cus
left join customer rf ON cus.ReferredBy = rf.CustomerID
order by CustomerLastName ASC, CustomerFirstName DESC;





--  Who referred each customer to Marcia’s Dry Cleaning? Show columns named CustomerLastName, CustomerFirstName, ReferredByLastName, and ReferredByFirstName. 
-- Include the names of customers who were not referred by any other customer in the 
-- results of the query.

select cus.LastName, cus.FirstName, cus.Phone
from customer cus
join invoice inv ON cus.CustomerID = inv.CustomerID
where inv.CustomerID IN (select inv.CustomerID from invoice_item where Item = 'Dress Shirt')
order by cus.LastName ASC, cus.FirstName DESC;


-- T. Show the LastName, FirstName, and Phone of all customers who have had an order 
-- with an Item named ‘Dress Shirt’. Use a combination of a join using JOIN ON syntax 
-- and a subquery. Present results sorted by LastName in ascending order and then FirstName in descending order







-- U. Show the LastName, FirstName, Phone, and TotalAmount of all customer orders 
-- that included an Item named ‘Dress Shirt’. Also show the LastName, FirstName, 
-- and Phone of all other customers. Present results sorted by TotalAmount in ascending 
-- order, then LastName in ascending order, and then FirstName in descending order. 
-- HINT: In Microsoft Access 2016, you will either need to use a UNION statement or 
-- a sequence of two queries to solve this because Microsoft Access disallows nesting an 
-- INNER join inside a LEFT OUTER or RIGHT OUTER join. The other DBMS products can complete this question with one query (not a UNION statement).