use WideWorldImporters;

select * from sales.customercategories;
select * from sales.customers;
select * from sales.invoices; --factura
select * from sales.invoicelines; --detalles de la factura


-- consulta para ver las ventas realizadas por cada tipo de cliente  
select 
    c.customercategoryname as categoria,
    count(*) as total_clientes,  
    sum(il.quantity) as productos_vendidos,
    avg(il.unitprice) as precio_promedio
from sales.customercategories c
inner join sales.customers cl on c.customercategoryid = cl.customercategoryid
inner join sales.invoices i on cl.customerid = i.customerid
inner join sales.invoicelines il on i.invoiceid = il.invoiceid
group by c.customercategoryname
having sum(il.quantity) > 1000
order by productos_vendidos desc;

--consulta para ver la cantidad de pedidos de los clientes 
select  
    c.CustomerID, c.CustomerName,
    count (*) as pedidos_totales,
    min (ol.UnitPrice) as transaccion_minima,
    max (ol.UnitPrice)as transaccion_maxima,
    sum (ol.UnitPrice) as transaccion_total
from sales.Orders o
inner join sales.Customers c on o.CustomerID=c.CustomerID
inner join sales.OrderLines ol on o.OrderID=ol.OrderID
group by c.CustomerID, c.CustomerName
having count(*)>10 and sum(ol.UnitPrice) >10000
order by c.CustomerID asc;
