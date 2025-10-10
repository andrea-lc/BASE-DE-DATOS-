use WideWorldImporters;

-- Esto es como preguntar: ¿Tengo la herramienta de busqueda avanzada?
select SERVERPROPERTY('IsFullTextInstalled') as TieneBusquedaAvanzada;


select 
    o.OrderID,
    o.OrderDate,
    o.ExpectedDeliveryDate,
    c.CustomerName,
    p.FullName AS ContactPerson,
    si.StockItemName as 'Product Name',
    ol.Description,
    ol.Quantity,
    ol.UnitPrice,
    ol.PickedQuantity,
    (ol.Quantity * ol.UnitPrice) AS LineTotal,
    o.Comments,
    o.DeliveryInstructions
from
    Sales.Orders o
    INNER JOIN Sales.Customers c on o.CustomerID = c.CustomerID
    INNER JOIN Application.People p on o.ContactPersonID = p.PersonID
    INNER JOIN Sales.OrderLines ol on o.OrderID = ol.OrderID
    INNER JOIN Warehouse.StockItems si on ol.StockItemID = si.StockItemID
where CONTAINS(ol.Description, 'USB')
order by
    o.OrderDate DESC, 
    o.OrderID, 
    ol.OrderLineID;

    -- Ver qué columnas tenemos en OrderLines (descripción de productos)
SELECT name AS Columna, type_name(system_type_id) AS Tipo
FROM sys.columns 
WHERE object_id = OBJECT_ID('Sales.OrderLines');

-- Ver qué columnas tenemos en StockItems (nombres de productos)  
SELECT name AS Columna, type_name(system_type_id) AS Tipo
FROM sys.columns 
WHERE object_id = OBJECT_ID('Warehouse.StockItems');
