use WideWorldImporters;

-- ver productos que se han vendido
select stockitemname 
from warehouse.stockitems
where exists (
    select 1 
    from sales.orderlines -- tabla de productos que ya estan ordenados
    where stockitemid = stockitems.stockitemid
);


select*from sales.orders;
select orderdate from sales.orders;


-- ver el dia, mes y año de los pedidos
select 
    orderid,
    orderdate,
    day(orderdate) as dia,
    month(orderdate) as mes, 
    year(orderdate) as año
from sales.orders;


-- cuantos daas han pasado desde el pedido
select 
    orderid,
    convert(varchar, orderdate, 103) as orderdate_formatoddmmyyyy,
    convert(varchar, expecteddeliverydate, 101) as expecteddelivery_formatommddyyyy,  
    datediff(day, orderdate, expecteddeliverydate) as diaspasados
from sales.orders
order by orderid desc;

select*from sales.Customers;
select * from sales.orders;


-- informacion de clientes con pedidos
select 
    customer.customername,
    concat('cliente desde: ', year(customer.accountopeneddate)) as infocliente,
    orders.orderdate,
    day(orders.orderdate) as diapedido
from sales.customers customer
join sales.orders orders on customer.customerid = orders.customerid
where customer.customerid in (
    select customerid 
    from sales.orders 
    where year(orders.orderdate) = 2016
);