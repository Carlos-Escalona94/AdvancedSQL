--PIVOT
select * from sales.SalesTerritory

select countryregioncode, [group], salesytd
from sales.SalesTerritory

--constryregioncode | NorthAmerica | Europe
--US				|23				|...

select countryregioncode, [North America], [Europe]
from sales.SalesTerritory
pivot
(
sum(salesytd) for [group]
in ([North America], [Europe], [Pacific])
)
as pvt

--Dynamic Queries
declare @sqlstring varchar(200)
set @sqlstring = 'select countryregioncode, [group], '
set @sqlstring = @sqlstring + 'salesytd from sales.salesterritory'

print @sqlstring
exec(@sqlstring)