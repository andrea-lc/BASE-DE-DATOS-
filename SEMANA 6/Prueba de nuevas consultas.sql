use AdventureWorksDW2022;

select * from DimProduct;
select * from FactProductInventory;
select * from DimDate;


select * from DimPromotion;
select * from DimCurrency;
select TotalProductCost from FactInternetSales where TotalProductCost is null;
select EnglishProductName, StandardCost from DimProduct;
select * from DimCustomer;
select * from DimGeography;
select * from DimSalesTerritory;


select * from FactInternetSales;
-- mostrar los 5 primeros registros de una tabla 
select top 5 *from FactInternetSales;

-- mostrar el 5% de los registros de una tabla 
select top 5 percent  *from FactInternetSales;

-- seleccionar registros en donde su precio estandar no sea nulo
select top 50 percent * from DimProduct
where StandardCost is not null;

-- actualiza la tabla de productos para llenar todos los campos nulos de estilos como "u"
update DimProduct set Style = 'U'
where Style is null;
 