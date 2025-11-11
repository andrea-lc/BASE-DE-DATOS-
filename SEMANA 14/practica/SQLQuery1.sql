use WideWorldImporters;

select stockitemname, unitprice from Warehouse.StockItems;

-- consulta para reducir precios
begin transaction 
	update  Warehouse.StockItems
	set UnitPrice=UnitPrice*0.90
	where unitprice>100;
	print 'aplica 10%'
	save transaction descuento1;

	update  Warehouse.StockItems
	set UnitPrice=UnitPrice*0.90
	where unitprice<100;
	print 'aplica 10%'

	save transaction descuento2;

DECLARE @decision VARCHAR(10) = 'continuar'; -- cambiar a 'revertir' para probar;
 if (@decision = 'revertir')
	begin 
	rollback transaction descuento1
	end ;
commit;
print 'transaccion finalizada';

