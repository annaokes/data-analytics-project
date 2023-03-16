SELECT * FROM `niyo-378413.console.console_sales`;

-- Display the number of genres where the total number of games is greater than 1000
SELECT Genre, COUNT(Name) AS TotalNumberofGames FROM `niyo-378413.console.console_sales`
GROUP BY Genre
HAVING COUNT(Name) > 1000;
-- Find the games where the average EU sales by genre is greater than 0.15
SELECT Genre, ROUND(AVG(EU_Sales),2) AS AvgSales FROM `niyo-378413.console.console_sales`
GROUP BY Genre
HAVING AVG(EU_Sales) > 0.15;
-- Find the total eu sales where total EU sales by platform is greater than 10
SELECT Platform, ROUND(SUM(EU_Sales),2) AS TotalEUSales FROM `niyo-378413.console.console_sales`
GROUP BY Platform
HAVING SUM(EU_Sales)>10
ORDER BY 2 ASC; 
-- Find the total sales where total EU sales by platform is greater than 10 for platforms Wii, PS3 AND PS4
SELECT Platform, ROUND(SUM(EU_Sales),2) AS TotalEUSales FROM `niyo-378413.console.console_sales`
WHERE Platform IN ('Wii', 'PS3', 'PS4')
GROUP BY Platform
HAVING SUM(EU_Sales)>10
ORDER BY 2 ASC; 
-- Find the game name where total sales > 50million across all regions 
SELECT Name, ROUND(SUM(EU_Sales + JP_Sales + NA_Sales + Other_Sales),2) AS TotalRegionSales
FROM `niyo-378413.console.console_sales`
GROUP BY Name
HAVING SUM(EU_Sales + JP_Sales + NA_Sales + Other_Sales) > 50
ORDER BY 2 Desc;
