use AdventureWorksDW2022;

select * from DimProduct;
select * from FactProductInventory;
select *from DimDate;

update DimProduct set Status = 'Old'
where Status is null;

--Promedio de precios (747.6617), entonces esta consulta mostrara precios mayores a ese valor 
select p.EnglishProductName as ProductName, p.ListPrice
from DimProduct p
where p.ListPrice > (select avg(p2.ListPrice) from DimProduct p2);


-- Muestra los productos que tienen al menos un registro en el inventario
select p.EnglishProductName
from DimProduct p
where exists (select 1 from FactProductInventory f where p.ProductKey= f.ProductKey);

--Devuelve los nombres de productos cuyo nombre contiene "Long" y sus costos 
--unitarios en el inventario, usando un FULL JOIN para combinar productos y sus respectivos costos unitarios
select p.EnglishProductName, f.UnitCost
from DimProduct p
full join FactProductInventory f on p.ProductKey=f.ProductKey
where f.ProductKey in (select p.ProductKey from DimProduct p where p.EnglishProductName like '%Long%');

-- Devuelve todos los productos, junto con las fechas de movimiento de inventario, Si el producto no tiene movimientos,
-- o si un movimiento no tiene fecha registrada, los valores relacionados aparecen como NULL.
select p.EnglishProductName as ProductName, f.MovementDate, d.DayNumberOfWeek,d.DayNumberOfMonth,d.DayNumberOfYear
from DimProduct p
left join FactProductInventory f on p.ProductKey= f.ProductKey
left join DimDate d on f.DateKey= d.DateKey;