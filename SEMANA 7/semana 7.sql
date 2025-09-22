use AdventureWorksDW2022;

select * from DimProductCategory;


-- Inserta nuevos datos en la tabla de categorias de productos 
insert into DimProductCategory (ProductCategoryAlternateKey, EnglishProductCategoryName,
SpanishProductCategoryName,FrenchProductCategoryName)
values (6, 'Wheels', 'Ruedas', 'Roues');


-- Como hubo un error al insertar la llave alternativa de las categorias, uso update para corregirlo
update DimProductCategory  
set ProductCategoryAlternateKey= 5
where ProductCategoryKey= 5;

-- Elimina la fila que tenga como id 5 
delete from DimProductCategory  where ProductCategoryKey= 13;


select * from DimProduct;
select * from DimDate;


-- Se definen los nuevos campos para la tabla, tomara lo meses de la tabla Month name y se volveran los campos
-- estos nuevos campos seran llenados con los costos totales de cada producto segun el mes que se vendio por internet
select EnglishProductName, [January], [February], [March], [April],
    [May], [June], [July], [August],
    [September], [October], [November], [December]
from ( 
    select p.EnglishProductName, d.EnglishMonthName,i.TotalProductCost
    from DimProduct p 
    inner join FactInternetSales i on p.ProductKey= i.ProductKey
    inner join DimDate d on i.DueDateKey= d.DateKey
) as Fuente 
pivot (
    sum(TotalProductCost)
    for EnglishMonthName in ([January], [February], [March], [April],
    [May], [June], [July], [August],
    [September], [October], [November], [December])
    ) as PivotTable;
