use eko_ride;
SELECT Name, Rating
FROM Drivers
ORDER BY Rating DESC
LIMIT 5;

-- --1) Top 5 highest-rated drivers in Lagos




-- 2)Riders with more than 5 rides in the last 30 days in Lagos

SELECT SUM(Fare) AS TotalRevenue
FROM Rides;



-- 3)Total revenue for the past month for Lagos rides


SELECT City, COUNT(*) AS RideCount
FROM Riders
GROUP BY City
ORDER BY RideCount DESC
LIMIT 1;


-- 4) Area in Lagos with the most rides


SELECT d.DriverID, d.Name, SUM(r.Fare) AS TotalRevenue
FROM Drivers d
JOIN Rides r ON d.DriverID = r.DriverID
GROUP BY d.DriverID, d.Name 
ORDER BY TotalRevenue DESC
LIMIT 1;

-- 5)Driver with the highest revenue in Lagos
-- Expected result table:





-- 6) SELECT RideID, Fare, avg(r.Fare) AS AverageFare
-- FROM Rides


select Rides.RideID, Riders.Name, Drivers.Rating as AverageRating
from Riders
join Rides on Riders.RiderID = Rides.RiderID
join Drivers on Rides.DriverID = Drivers.DriverID
where Drivers.Rating < 3;

-- 7) Find riders in Lagos who rated their drivers less than 3 on average

-- 8) Find rides where the fare is more than 50% higher or lower than the average fareridersRiderIDriders



