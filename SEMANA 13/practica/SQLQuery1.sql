use WideWorldImporters;
select *from sales.CustomerCategories;


--bulk insert sirve para importar de forma rapida y eficiente grandes 
--volumenes de datos desde un archivo externo directamente a una tabla de la base de datos
bulk insert -- 
sales.CustomerCategories -- tabla de donde se insertara
from 'C:\Documents\SQL Server Management Studio 21\PROYECTO\SEMANA 13\BULK.txt'
with (firstrow=1); -- indica desde que fila debe empezar a insertar
-- aun no funciona :(


--CONTROL DE FLUJO (manejo de funcionalidad para tomar deciciones) 
-- bloques de sentencias 

declare
  -- en esta parte van las variables 

begin -- aca ira el codigo principal
  -- (aca podria haber palabras como if-else, while, do while...)
  -- control de eventualidades , aca se maneja situaciones que se dan) 
  --  break, return ...

end

select * from warehouse.StockItems_Archive where unitprice>1000;

if exists (select * from warehouse.StockItems_Archive where unitprice>1000)
	(select stockitemname, unitprice 
	from warehouse.StockItems_Archive 
	where unitprice>100)
else
	select 'no hay articulos mayores a 10' as resultado

	-- las va riables delcaradas solo funciones en el mismo bloque de sentencia
declare
-- aca tambien se puede inicializar variables
	@id_valor int,
	@nombre varchar (20),
	@telefono numeric(10),
	@fecha date;
begin 
-- para asignar valores a las variables
    set @id_valor=1;	
	set @nombre ='Andrea';
	set @telefono= 123456789;
	set @fecha= '2006/07/06';
	select @id_valor as id_valor, @nombre as nombre, @telefono as telefono, @fecha as fecha;
end;


select * from Warehouse.StockItems;
declare 
	@unitprice decimal = 100;
begin 
select * from Warehouse.StockItems where UnitPrice=@unitprice;
end;

--creacion de funcion
create function funcion_suma (@valor1 int,@valor2 int)
	returns int 
as
	begin 
	declare @resultado int 
	set @resultado = @valor1 + @valor2
	return @resultado
end;
select dbo.funcion_suma(40,50);


-- creacion de procedimiento
create procedure pro_existencia
as 
	select * from Warehouse.StockItems
	where unitprice >100;

exec pro_existencia;