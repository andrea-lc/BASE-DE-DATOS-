use refugio_gatos;
select *from sys.databases;
exec sp_help adoptante;
select*from persona;
select*from gato;


select nombre,edad, estado_gato, cuidado_requerido,Colaborador,cuidador_temporal,adoptante
from gato
left join persona on gato.id_colaborador=persona.id_colaborador;

EXEC sp_rename 'adoptante.nombre',
'nombre_adoptante', 'COLUMN';

alter table adoptante 
add Cuidador_temporal VARCHAR (2),Adoptante varchar (2);

ALTER TABLE gato 
ADD estado_gato VARCHAR(100),
    cuidado_requerido VARCHAR(20);

alter TABLE gato 
alter column cuidado_requerido varchar(100);

alter table adoptante drop COLUMN Cuidador_temporal,Adoptante; 

update adoptante
set 
	Cuidador_temporal='no',
	Adoptante='si'
where id_adoptante=2;

update gato
set 
	Cuidador_temporal='no',
	Adoptante='si'
where id_adoptante=2;

select*from persona;
select*from gato;

update gato
set 
	estado_gato='sano',
	cuidado_requerido='ninguno'
where id_gato=1;

EXEC sp_rename 'adoptante', 'persona';

EXEC sp_rename 'gato.id_adoptante',
'id_colaborador', 'COLUMN';

INSERT INTO persona (Colaborador, Cuidador_temporal, Adoptante)
VALUES
('María López', 'si', 'no'),      
('Pedro Sánchez', 'no', 'no'),    
('Claudia Herrera', 'no', 'si'),  
('José Martínez', 'si', 'si');    



INSERT INTO gato (nombre, edad, id_colaborador, estado_gato, cuidado_requerido)
VALUES
('Pelusa', 4, NULL, 'enfermo', 'medicación diaria'),
('Simba', 2, NULL, 'herido leve', 'curación de heridas'),
('Nina', 1, 3, 'sano', 'ninguno'),
('Coco', 5, NULL, 'desnutrido', 'alimentación especial'),
('Lolo', 3, NULL, 'herido grave', 'cirugía y reposo'),
('Kira', 6, 4, 'recuperación', 'terapia y chequeo veterinario'),
('Max', 2, 1, 'sano', 'vacunación pendiente'),
('Luna', 7, NULL, 'enfermo', 'tratamiento contra parásitos');

UPDATE persona
SET Cuidador_temporal = 'si'
WHERE id_colaborador = 4;


select nombre,edad, estado_gato, cuidado_requerido,Colaborador,cuidador_temporal,adoptante
from gato
left join persona on gato.id_colaborador=persona.id_colaborador;


SELECT nombre, edad
FROM gato
ORDER BY edad DESC;
