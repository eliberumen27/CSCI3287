/*Query #1 DONE*/
SELECT SalesPersonID FROM Fact_ProductSales fp
JOIN Dim_Date AS dd ON fp.SalesdateKey = dd.DateKey
WHERE fp.SalesPrice*fp.Quantity = (SELECT MAX(SalesPrice*Quantity) FROM Fact_ProductSales AS fp JOIN Dim_Date AS dd ON fp.SalesdateKey = dd.DateKey AND dd.YEAR = "2012")
AND dd.YEAR = "2012";

/*Query #2*/
/*Finds 2012 first*/
SELECT c.CustomerID AS Customer, SUM(fp.SalesPrice*fp.Quantity) AS Revenue FROM Dim_Customer c
JOIN Fact_ProductSales AS fp on fp.CustomerID = c.CustomerID
JOIN Dim_Date AS dd ON fp.SalesdateKey = dd.DateKey
WHERE dd.YEAR = "2012"
GROUP BY c.CustomerID;
/*Finds 2013 next*/
SELECT c.CustomerID AS Customer, SUM(fp.SalesPrice*fp.Quantity) AS Revenue FROM Dim_Customer c
JOIN Fact_ProductSales AS fp on fp.CustomerID = c.CustomerID
JOIN Dim_Date AS dd ON fp.SalesdateKey = dd.DateKey
WHERE dd.YEAR = "2013"
GROUP BY c.CustomerID;

/*Query #3 DONE*/
SELECT fp.StoreID, SUM(fp.SalesPrice*fp.Quantity) AS StoreRevenue
FROM Fact_ProductSales fp
JOIN Dim_Date AS dd ON fp.SalesDateKey = dd.DateKey WHERE dd.YEAR = "2010"
AND dd.YEAR = "2010"
GROUP BY fp.StoreID
ORDER BY StoreRevenue DESC;

SELECT fp.StoreID, SUM(fp.SalesPrice*fp.Quantity) AS StoreRevenue
FROM Fact_ProductSales fp
JOIN Dim_Date AS dd ON fp.SalesDateKey = dd.DateKey WHERE dd.YEAR = "2011"
AND dd.YEAR = "2011"
GROUP BY fp.StoreID
ORDER BY StoreRevenue DESC;

SELECT fp.StoreID, SUM(fp.SalesPrice*fp.Quantity) AS StoreRevenue
FROM Fact_ProductSales fp
JOIN Dim_Date AS dd ON fp.SalesDateKey = dd.DateKey WHERE dd.YEAR = "2012"
AND dd.YEAR = "2012"
GROUP BY fp.StoreID
ORDER BY StoreRevenue DESC;

SELECT fp.StoreID, SUM(fp.SalesPrice*fp.Quantity) AS StoreRevenue
FROM Fact_ProductSales fp
JOIN Dim_Date AS dd ON fp.SalesDateKey = dd.DateKey WHERE dd.YEAR = "2013"
AND dd.YEAR = "2013"
GROUP BY fp.StoreID
ORDER BY StoreRevenue DESC;

/*Query #4: Here we order the total profit from each product and then select the first entry*/
SELECT ProductID, SUM((SalesPrice-ProductCost)*Quantity) AS Profit
FROM Fact_ProductSales AS fp
JOIN Dim_Date AS dd
ON fp.SalesDateKey = dd.DateKey
WHERE YEAR = "2015"
GROUP BY ProductID
ORDER BY Profit DESC
LIMIT 1;

/*Query #5*/
SELECT SUM(SalesPrice*Quantity) AS Revenue, QUARTER
FROM fact_productsales AS f
JOIN Dim_Date AS d
ON f.SalesDateKey = d.DateKey WHERE
YEAR = 2016
AND StoreID = 1
GROUP BY QUARTER
ORDER BY Revenue DESC
limit 1; 
