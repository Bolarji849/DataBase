use cape_codd;

select SKU,SKU_Description

from inventory;

-- ANS TO 2.17 Write an SQL statement to display SKU and SKU_Description-- 



select SKU_Description,SKU

from inventory;

-- ANS TO Write an SQL statement to display SKU_Description and SKU



select WarehouseID

from inventory;

--  Ans To Write an SQL statement to display WarehouseID.


select distinct warehouseID

from inventory;

 -- Write an SQL statement to display unique WarehouseIDs
 
 

select warehouseID,SKU,SKU_Description,QuantityOnHand,QuantityOnOrder

from inventory;

--  Ans To Write an SQL statement to display all of the columns without using the SQL asterisk 
-- (*) wildcard character.



select *

from inventory;

--  Ans to 2.22 Write an SQL statement to display all of the columns using the SQL asterisk (*) wildcard character


select * from inventory

where QuantityOnHand > 0;

--  Ans to 2.23 Write an SQL statement to display all data on products having a QuantityOnHand 
-- greater than 0.



select SKU,SKU_Description

from inventory

where QuantityOnHand = 0;


-- 2.24 Write an SQL statement to display the SKU and SKU_Description for products having QuantityOnHand equal to 0.



select SKU,SKU_Description,WarehouseID

from inventory

where QuantityOnHand = 0

order by WarehouseID ASC;



--  Write an SQL statement to display the SKU, SKU_Description, and WarehouseID for 
-- products that have a QuantityOnHand equal to 0. Sort the results in ascending order 
-- by WarehouseID.


select SKU,SKU_Description,WarehouseID

from inventory

where QuantityOnHand > 0

order by WarehouseID DESC,SKU ASC;




--  Write an SQL statement to display the SKU, SKU_Description, and WarehouseID for 
-- products that have a QuantityOnHand greater than 0. Sort the results in descending 
-- order by WarehouseID and in ascending order by SKU



select SKU,SKU_Description,WarehouseID

from inventory

where QuantityOnHand = 0 AND QuantityOnOrder > 0

order by WarehouseID DESC,SKU ASC;


--   Write an SQL statement to display SKU, SKU_Description, and WarehouseID for all 
-- products that have a QuantityOnHand equal to 0 and a QuantityOnOrder greater than 0. 
-- Sort the results in descending order by WarehouseID and in ascending order by SKU.



select SKU,SKU_Description,WarehouseID

from inventory

where QuantityOnHand = 0 AND QuantityOnOrder = 0

order by WarehouseID DESC,SKU ASC;


-- Ans to  Write an SQL statement to display SKU, SKU_Description, and WarehouseID for 
-- all products that have a QuantityOnHand equal to 0 or a QuantityOnOrder equal 
-- to 0. Sort the results in descending order by WarehouseID and in ascending order 
-- by SKU.

select SKU,SKU_Description,WarehouseID,QuantityOnHand

from inventory

where QuantityOnHand > 1 And  QuantityOnHand  < 10;

--  Write an SQL statement to display the SKU, SKU_Description, WarehouseID, and 
-- QuantityOnHand for all products having a QuantityOnHand greater than 1 and less 
-- than 10. Do not use the BETWEEN keyword.


select distinct SKU,SKU_Description

from inventory

where SKU_Description like "Half-Dome%";


-- write an SQL statement to show a unique SKU and SKU_Description for all products with an SKU description starting with ‘Half-Dome’


select distinct SKU,SKU_Description

from inventory

where SKU_Description like "%Climb%";

-- write an SQL statement to show a unique SKU and SKU_Description for all products with a description that includes the word ‘Climb’



select distinct SKU,SKU_Description

from inventory

where SKU_Description like "__d%";

-- 2.33 Write an SQL statement to show a unique SKU and SKU_Description for all products with a ‘d’ in the third position from the left in SKU_Description

select sum(QuantityOnHand) AS Quantitysum,
		 avg(QuantityOnHand) AS  Quantityavg,
        MIN(QuantityOnHand) AS		QuantityMin,
        MAX(QuantityOnHand) AS		QuantityMax

from inventory;


-- 2.34 write an SQL statement that uses all of the SQL built-in functions on the QuantityOnHand column. Include meaningful column names in the result.



select WarehouseID, sum(QuantityOnHand) AS TotalItemsOnHand
from inventory
group by WarehouseID

ORDER BY TotalItemsOnHand DESC;

-- 2.36 Write an SQL statement to display the WarehouseID and the sum of QuantityOnHand grouped by WarehouseID. Name the sum TotalItemsOnHand and display the d display the
-- results in descending order of TotalItemsOnHand.




select WarehouseID, sum(QuantityOnHand) AS TotalItemsOnHandLT3
from inventory
where SKU < 3
group by WarehouseID
ORDER BY TotalItemsOnHandLT3 DESC;



-- 2.37 Write an SQL statement to display the WarehouseID and the sum of QuantityOnHand grouped by WarehouseID. Omit all SKU items that have three or more items 
-- on hand from the sum, name the sum TotalItemsOnHandLT3, and display the results 
-- in descending order of TotalItemsOnHandLT3.



select WarehouseID, sum(QuantityOnHand) AS TotalItemsOnHandLT3
from inventory
group by WarehouseID
Having COUNT(DISTINCT SKU) < 3
ORDER BY TotalItemsOnHandLT3 DESC;





--  Write an SQL statement to display the WarehouseID and the sum of Quantity 
-- OnHand grouped by WarehouseID. Omit all SKU items that have three or 
-- more items on hand from the sum, and name the sum TotalItemsOnHandLT3. 
-- Show the WarehouseID only for warehouses having fewer than two SKUs 
-- in their TotalItemsOnHandLT3. Display the results in descending order of 
-- TotalItemsOnHandLT3.


-- ANS The HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.

 -- In your answer to Review Question 2.38, was the WHERE clause or the HAVING 
-- clause applied first? Why?


select SKU, SKU_Description, inv.WarehouseID, WarehouseCity,WarehouseState
from inventory inv , warehouse
where warehousestate = "GA"
union
select SKU, SKU_Description,inv.WarehouseID, WarehouseCity,WarehouseState
from inventory inv, warehouse
where WarehouseState = "ME" or WarehouseState = "IL";



 -- Write an SQL statement to display the SKU, SKU_Description, WarehouseID, 
-- WarehouseCity, and WarehouseState for all items stored in the Atlanta, Bangor, or 
-- Chicago warehouse. Do not use the IN keyword.