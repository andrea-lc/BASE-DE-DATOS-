use AdventureWorksDW2022;

select * from FactFinance;

-- inicia una nueva transaccion 
begin transaction;

begin try -- el try contiene el codigo a ejecutar 
	-- El campo DeparmentGroupKey debe ser llenado con elementos de tipo int, por lo que generara un error
	update FactFinance set DepartmentGroupKey=1 where FinanceKey =1;
	print 'DepartmentGroupKey changed';
	commit transaction -- confirma la transaccion y al hacerlo es permanente 
end try
begin catch -- captura los errores 
	rollback transaction; -- Revierte las operaciones realizadas dentro de la transacción si ocurre algún error
	print 'Error';
end catch;