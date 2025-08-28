-- Seleccionamos la base de datos que vamos a usar
USE refugio_gatos;

-- Mostrar todas las bases de datos disponibles en el servidor
SELECT * FROM sys.databases;

-- Ver la estructura (columnas, tipos de datos, etc.) de la tabla adoptante
EXEC sp_help adoptante;

-- Consultar todos los registros de persona y de gato
SELECT * FROM persona;
SELECT * FROM gato;


-- Relacionar gatos con sus cuidadores o adoptantes (JOIN entre tablas)
SELECT nombre, edad, estado_gato, cuidado_requerido,
       Colaborador, cuidador_temporal, adoptante
FROM gato
LEFT JOIN persona ON gato.id_colaborador = persona.id_colaborador;


-- Renombrar columna 'nombre' de la tabla adoptante a 'nombre_adoptante'
EXEC sp_rename 'adoptante.nombre', 'nombre_adoptante', 'COLUMN';

-- Agregar nuevas columnas a la tabla adoptante
ALTER TABLE adoptante 
ADD Cuidador_temporal VARCHAR(2),
    Adoptante VARCHAR(2);

-- Agregar nuevas columnas a la tabla gato
ALTER TABLE gato 
ADD estado_gato VARCHAR(100),
    cuidado_requerido VARCHAR(20);

-- Modificar el tamaño de la columna cuidado_requerido
ALTER TABLE gato 
ALTER COLUMN cuidado_requerido VARCHAR(100);

-- Eliminar las columnas añadidas en adoptante
ALTER TABLE adoptante 
DROP COLUMN Cuidador_temporal, Adoptante;


-- Actualizar registros de la tabla adoptante
UPDATE adoptante
SET Cuidador_temporal = 'no',
    Adoptante = 'si'
WHERE id_adoptante = 2;

-- Actualizar registros de la tabla gato (relacionados con adoptante)
UPDATE gato
SET Cuidador_temporal = 'no',
    Adoptante = 'si'
WHERE id_adoptante = 2;


-- Consultas de verificación
SELECT * FROM persona;
SELECT * FROM gato;


-- Actualizar estado y cuidado requerido de un gato específico
UPDATE gato
SET estado_gato = 'sano',
    cuidado_requerido = 'ninguno'
WHERE id_gato = 1;


-- Renombrar tabla adoptante a persona
EXEC sp_rename 'adoptante', 'persona';

-- Renombrar columna id_adoptante de gato a id_colaborador
EXEC sp_rename 'gato.id_adoptante', 'id_colaborador', 'COLUMN';


-- Insertar nuevos registros en la tabla persona
INSERT INTO persona (Colaborador, Cuidador_temporal, Adoptante)
VALUES
('María López', 'si', 'no'),      
('Pedro Sánchez', 'no', 'no'),    
('Claudia Herrera', 'no', 'si'),  
('José Martínez', 'si', 'si');    


-- Insertar registros de gatos con su estado y necesidades
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


-- Actualizar a una persona como cuidador temporal
UPDATE persona
SET Cuidador_temporal = 'si'
WHERE id_colaborador = 4;


-- Consulta de gatos junto a sus cuidadores/adoptantes
SELECT nombre, edad, estado_gato, cuidado_requerido,
       Colaborador, cuidador_temporal, adoptante
FROM gato
LEFT JOIN persona ON gato.id_colaborador = persona.id_colaborador;


-- Ordenar los gatos por edad (de mayor a menor)
SELECT nombre, edad
FROM gato
ORDER BY edad DESC;

SELECT nombre, edad, estado_gato, cuidado_requerido,
       Colaborador, cuidador_temporal, adoptante
FROM gato
INNER JOIN persona ON gato.id_colaborador = persona.id_colaborador;
