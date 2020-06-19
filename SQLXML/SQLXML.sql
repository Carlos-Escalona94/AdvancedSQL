use AdventureWorks2012

Select * From xmlsampletable

INSERT INTO xmlsampletable (xmldata) VALUES ('<note>
<to>Tove</to>
<from>Jani</from>
<heading>Reminder</heading>
<body>Dont forget me this weekend!</body>
</note>')

Select * From xmlsampletable

Select * from sales.SalesTerritory
for xml auto, elements, root ('SalesTerritory')

Select * from sales.SalesTerritory
for xml raw, elements, root ('SalesTerritory')

select xmldata.query('/note/to') as [to] from xmlsampletable

select xmldata.value('(/note/to)[1]', 'varchar(10)') as [to]
from xmlsampletable

select top 10 territoryid from sales.SalesTerritory
for xml auto, elements, root ('SalesTerritory')


select * from sales.SalesTerritory
for xml auto, elements, root ('SalesTerritory')

declare @xmlhandle int
declare @xmldocument xml

set @xmldocument = (select * from sales.SalesTerritory
for xml auto, elements, root ('SalesTerritory'))

exec sp_xml_preparedocument @xmlhandle output, @xmldocument

select * from openxml(@xmlhandle, '/SalesTerritory/sales.SalesTerritory', 2)
with (TerritoryID int, SalesYTD MONEY)

exec sp_xml_removedocument @xmlhandle

