use AdventureWorksDW2022;

select * from DimPromotion;
select * from DimCurrency;
select TotalProductCost from FactInternetSales where TotalProductCost is null;
select EnglishProductName, StandardCost from DimProduct;
select * from DimCustomer;
select * from DimGeography;
select * from DimSalesTerritory;
select * from DimDate;

-- Pedidos por Internet ordenador por llame primaria de los productos 
select p.EnglishProductName as Product, f.OrderQuantity, f.TotalProductCost, c.FirstName AS Customer, c.LastName,
       c.EmailAddress, c.AddressLine1, f.OrderDate, f.ShipDate, g.City, g.StateProvinceName,g. EnglishCountryRegionName as Country
from DimProduct p
left join FactInternetSales f on p.ProductKey= f.ProductKey
left join DimCustomer c on f.CustomerKey = c.CustomerKey
left join DimGeography g on c.GeographyKey= g.GeographyKey
Order by f.ProductKey asc;

-- Cantidad de productos pedidos
select p.EnglishProductName as Product, count (*) as InternetSalesTotal
from DimProduct p
INNER join FactInternetSales f on p.ProductKey= f.ProductKey
Group by p.EnglishProductName
having count (*) >1000;





-- Pedidos del producto Touring-3000 Blue, 54
select p.EnglishProductName as Product, f.OrderQuantity, f.TotalProductCost, c.FirstName AS Customer, c.LastName,
       c.EmailAddress, c.AddressLine1, f.OrderDate, f.ShipDate, g.City, g.StateProvinceName,g. EnglishCountryRegionName as Country
from DimProduct p 
left join FactInternetSales f on p.ProductKey= f.ProductKey
left join DimCustomer c on f.CustomerKey = c.CustomerKey
left join DimGeography g on c.GeographyKey= g.GeographyKey
where p.EnglishProductName like '%Touring-3000 Blue, 54%'
Order by f.ProductKey asc;


select EnglishProductName, StandardCost from DimProduct;


-- Si se hace alguna operacion con null, el resultado siempre sera null, resultado: unknown
select p.EnglishProductName as Product, p.StandardCost
from DimProduct p
left join FactInternetSales f on p.ProductKey= f.ProductKey
where p.StandardCost>1000 and p.StandardCost IS NULL; 
-- en este caso todo aparecera vacio ya que un campo no puede ser verdadero y desconocido a la vez 
