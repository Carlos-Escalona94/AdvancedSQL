use AdventureWorks2012

--Ranking Functions
SELECT * FROM Person.Address

SELECT PostalCode FROM Person.Address
Where PostalCode IN ('98052','98027','98055','97205')

SELECT PostalCode
, ROW_NUMBER() OVER (ORDER BY PostalCode) AS 'ROW NUMBER'
, RANK() OVER (ORDER BY PostalCode) AS 'RANK'
, DENSE_RANK() OVER (ORDER BY PostalCode) AS 'DENSE RANK'
, NTILE(10) OVER (ORDER BY POSTALCODE) AS 'NTILE'
FROM Person.Address
Where PostalCode IN ('98052','98027','98055','97205')

