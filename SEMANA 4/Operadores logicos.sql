use refugio_gatos;

select*from adopcion;
select*from cuidado;
select*from encargados_refugio;
select*from gato;
select*from persona;
select*from roles;
select*from usuario;
select*from veterinaria;


-- Verificar si algun gato esta sin adoptar, quiere decir que su estado es NULL
select *from gato
where estado_gato IS NULL;

-- Buscar personas que tienen una j en cualquier lugar de su nombre
select*from persona
where nombre like '%j%';

-- Ejemplo con like para buscar un el nombre de  un cuidador temporal que
-- empieze con p
select gato.nombre , estado_gato,persona.nombre, roles.rol_cuidador_temporal
from gato
inner join cuidado on gato.id_gato = cuidado.id_cuidador
inner join persona on cuidado.id_cuidador = persona.id_persona
inner join roles on persona.id_persona = roles.id_roles
where persona.nombre like 'p%';

select*from roles;

-- In para buscar gatos con una edad de 1 o 2 años
select *from gato
where edad in (1,2)
order by edad asc;


-- En el caso hipotetico que cada mes todos los animales del refugio 
-- van al veterinario por un chequeo, y cada dia atenderan 5 animales por orden de id

select gato.nombre, gato.cuidado_requerido,veterinaria.fecha_visita, veterinaria.vacuna
from gato
left join veterinaria on gato.id_gato = veterinaria.id_gato
where gato.id_gato between 1 and 5;


-- Saber  que personas segun su id han adoptado mas de 1 gato 
SELECT id_adoptante, COUNT(*) AS adopciones_por_persona
FROM adopcion
GROUP BY id_adoptante
having count(*)>1;


--ejemplo con case
select nombre,
       estado_gato,
       CASE estado_gato
           WHEN 'adoptado' THEN 'Con familia'
           WHEN NULL THEN 'Busca familia'
           ELSE 'Estado desconocido'
       END AS observacion
FROM gato;

select *from roles;

-- borrar columnas
alter table roles 
drop column rol_adoptante;

alter table roles 
drop column rol_cuidadorzzz;



