use WideWorldImporters;

select * from sales.Customers;
select * from sales.Orders;


-- Relacion uno a muchos, ya que un cliente puede tener varios pedidos, 
select c.CustomerID ,c.CustomerName, count (o.OrderID) as TotalPedidos
from sales.Customers c 
inner join sales.Orders o on c.CustomerID= o.CustomerID
group by c.CustomerID, c.CustomerName
order by TotalPedidos asc; 
