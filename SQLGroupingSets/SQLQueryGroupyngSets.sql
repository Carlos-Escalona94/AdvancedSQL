--CTE (Tablas temporales)
use AdventureWorks2012

SELECT * FROM Sales.SalesTerritory

WITH CTE_SALESTERR
AS
(
	SELECT Name, CountryRegionCode FROM Sales.SalesTerritory
)

SELECT * FROM CTE_SALESTERR
WHERE NAME LIKE 'North%';

--GROUP BY

SELECT * FROM Sales.SalesTerritory

SELECT Name, SUM(SALESYTD) AS 'sum'
FROM Sales.SalesTerritory
GROUP BY Name

SELECT Name, CountryRegionCode, SUM(SalesYTD)
FROM Sales.SalesTerritory
GROUP BY Name, CountryRegionCode

SELECT Name, CountryRegionCode, [Group], SUM(SalesYTD)
FROM Sales.SalesTerritory
GROUP BY Name, CountryRegionCode, [group]

--GROUPING SET

SELECT Name, CountryRegionCode, [Group], SUM(SalesYTD)
FROM Sales.SalesTerritory
GROUP BY GROUPING SETS(
	(Name),
	(Name, CountryRegionCode),
	(Name, CountryRegionCode, [group])
)

--ROLLUP

SELECT Name, CountryRegionCode, [Group], SUM(SalesYTD)
FROM Sales.SalesTerritory
GROUP BY ROLLUP(
	(Name, CountryRegionCode, [group])
)

--CUBE

SELECT Name, CountryRegionCode, [Group], SUM(SalesYTD)
FROM Sales.SalesTerritory
GROUP BY CUBE(
	(Name, CountryRegionCode, [group])
)


