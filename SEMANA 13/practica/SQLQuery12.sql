use WideWorldImporters;

select*from Warehouse.StockItems;

--variable que administrara los registros(del mismo tipo de dato que se usara d ela tabla) 
declare @descripcion decimal(18,2);

-- declaracion del curso, (for es para indicar que hara el cursor)
declare prod_info cursor for

-- es este caso el cursor se llenara de los valores devueltos por esta consulta
	select unitprice from Warehouse.StockItems

	open prod_info --abre el cursor

	-- fetch significa extraer cada registro, next from es el que salta registro por registro
	-- into, lo introduce en la variable del inicio
	fetch next from prod_info into @descripcion

	-- forma un bucle en la que @@fetch_status que es una variable global 
	-- que se encarga de la extraccion del fetch sea correcta y mientras esta
	-- sea correcta, seguira el bucle
	while @@FETCH_STATUS=0 
	begin 
	-- muestra en pantalla cada dato y vuelve a hacer la extraccion
		print @descripcion
		fetch next from prod_info into @descripcion
end 
	close prod_info -- cierra el cursor porque ya no se usara

	deallocate prod_info --se usa para liberar recursos asociados al cursor
	-- optimiza el proceso y gestiona correctamente la memoria y los recursos del sistema 
