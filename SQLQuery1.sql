--Sales by Region
SELECT st.SalesTerritoryRegion,
       SUM(fis.SalesAmount) AS Revenue
FROM FactInternetSales fis
JOIN DimSalesTerritory st
    ON fis.SalesTerritoryKey = st.SalesTerritoryKey
GROUP BY st.SalesTerritoryRegion
ORDER BY Revenue DESC;

--Sales by Year
SELECT d.CalendarYear,
       SUM(fis.SalesAmount) AS Revenue
FROM FactInternetSales fis
JOIN DimDate d
    ON fis.OrderDateKey = d.DateKey
GROUP BY d.CalendarYear
ORDER BY d.CalendarYear;

--Sales by Month
SELECT d.CalendarYear,
       d.EnglishMonthName,
       SUM(fis.SalesAmount) AS Revenue
FROM FactInternetSales fis
JOIN DimDate d
    ON fis.OrderDateKey = d.DateKey
GROUP BY d.CalendarYear, d.EnglishMonthName, d.MonthNumberOfYear
ORDER BY d.CalendarYear, d.MonthNumberOfYear;

--Total Sales, Total Orders, Total Quantity
SELECT 
    SUM(SalesAmount) AS TotalSales,
    COUNT(DISTINCT SalesOrderNumber) AS TotalOrders,
    SUM(OrderQuantity) AS TotalQuantity
FROM FactInternetSales;
