use WideWorldImporters;

select * from sales.customercategories;
select * from sales.customers;
select * from sales.invoices; --factura
select * from sales.invoicelines; --detalles de la factura

-- consulta para ver las ventas realizadas 
select 
    c.customercategoryname as categoria,
    count(*) as total_clientes, --contara 
    sum(il.quantity) as productos_vendidos,
    avg(il.unitprice) as precio_promedio
from sales.customercategories c
join sales.customers cl on c.customercategoryid = cl.customercategoryid
join sales.invoices i on cl.customerid = i.customerid
join sales.invoicelines il on i.invoiceid = il.invoiceid
group by c.customercategoryname
having sum(il.quantity) > 1000
order by productos_vendidos desc;