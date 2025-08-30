use refugio_gatos;
-- insertando personas
insert into persona (nombre, telefono, direccion, correo) values
('ana torres', '999111222', 'av. los olivos 123', 'ana@mail.com'),
('carlos ramirez', '988222333', 'jr. lima 456', 'carlos@mail.com'),
('maria perez', '977333444', 'av. brasil 789', 'maria@mail.com'),
('juan lopez', '966444555', 'calle sol 321', 'juan@mail.com'),
('lucia fernandez', '955555666', 'av. peru 654', 'lucia@mail.com'),
('pedro diaz', '944666777', 'jr. cuzco 987', 'pedro@mail.com'),
('sofia rojas', '933777888', 'av. arequipa 147', 'sofia@mail.com'),
('diego castillo', '922888999', 'calle luna 258', 'diego@mail.com'),
('elena suarez', '911999000', 'av. san juan 369', 'elena@mail.com'),
('jorge villanueva', '900000111', 'jr. libertad 753', 'jorge@mail.com');

-- asignando roles
insert into roles (id_persona, rol_administrados, rol_voluntariado, rol_cuidador_temporal, rol_adoptante) values
(1, 'no', 'si', 'no', 'si'),   -- ana es adoptante y voluntaria
(2, 'no', 'si', 'si', 'no'),   -- carlos es voluntario y cuidador
(3, 'no', 'no', 'no', 'si'),   -- maria adoptante
(4, 'no', 'si', 'si', 'no'),   -- juan voluntario y cuidador
(5, 'si', 'no', 'no', 'no'),   -- lucia administradora
(6, 'no', 'si', 'si', 'no'),   -- pedro voluntario y cuidador
(7, 'no', 'no', 'no', 'si'),   -- sofia adoptante
(8, 'no', 'si', 'no', 'no'),   -- diego voluntario
(9, 'no', 'si', 'si', 'no'),   -- elena voluntaria y cuidadora
(10, 'no', 'no', 'no', 'si');  -- jorge adoptante

-- creando usuarios 
insert into usuario (id_persona, username, contraseña) values
(1, 'ana123', 'clave1'),
(2, 'carlos88', 'clave2'),
(3, 'maria90', 'clave3'),
(4, 'juan77', 'clave4'),
(5, 'lucia_admin', 'clave5'),
(6, 'pedro66', 'clave6'),
(7, 'sofia33', 'clave7'),
(8, 'diego22', 'clave8'),
(9, 'elena44', 'clave9'),
(10, 'jorge55', 'clave10');

-- insertando gatos
insert into gato (nombre, edad, raza, estado_gato, cuidado_requerido) values
('michi', 2, 'mestizo', 'adoptado', 'requiere control de vacunas'),
('luna', 1, 'siames', 'en refugio', 'requiere socializacion'),
('toby', 3, 'persa', 'adoptado', 'dieta especial'),
('nala', 2, 'mestizo', 'en refugio', 'tratamiento post quirúrgico'),
('felix', 4, 'angora', 'adoptado', 'control dental'),
('simba', 1, 'mestizo', 'en refugio', 'requiere desparasitación'),
('tommy', 5, 'siames', 'adoptado', 'medicación diaria'),
('pelusa', 2, 'mestizo', 'en refugio', 'requiere cuidado extra por fractura'),
('garfield', 6, 'persa', 'en refugio', 'dieta baja en grasas'),
('kira', 3, 'angora', 'adoptado', 'chequeo regular');

-- adopciones (solo algunos gatos)
insert into adopcion (id_gato, id_adoptante, fecha_adopcion, observaciones) values
(1, 1, '2025-01-15', 'adoptado rápidamente por ana'),
(3, 3, '2025-02-20', 'adoptado por maria, muy cariñoso'),
(5, 7, '2025-03-12', 'adoptado por sofia, necesita controles'),
(7, 10, '2025-05-05', 'adoptado por jorge, tratamiento de medicación'),
(10, 1, '2025-06-10', 'ana adoptó un segundo gato');

-- cuidados temporales
insert into cuidado (id_gato, id_cuidador, fecha_inicio, fecha_fin, notas) values
(2, 2, '2025-01-10', null, 'carlos cuida a luna mientras encuentra adoptante'),
(4, 4, '2025-03-01', null, 'juan cuida a nala tras operación'),
(6, 6, '2025-04-15', null, 'pedro cuida a simba'),
(8, 9, '2025-05-20', null, 'elena cuida a pelusa tras fractura'),
(9, 2, '2025-06-01', null, 'carlos cuida a garfield con dieta especial');

-- visitas veterinarias
insert into veterinaria (id_gato, fecha_visita, diagnostico, tratamiento, vacuna) values
(1, '2025-01-05', 'resfriado leve', 'vitaminas', 'triple felina'),
(2, '2025-01-15', 'problemas de socialización', 'sesiones de conducta', null),
(4, '2025-03-05', 'operación de esterilización', 'reposo', 'antirrábica'),
(6, '2025-04-20', 'parásitos intestinales', 'desparasitación', null),
(8, '2025-05-25', 'fractura de pata', 'inmovilización', null),
(9, '2025-06-10', 'sobrepeso', 'dieta especial', null),
(10, '2025-06-15', 'control general', 'chequeo anual', 'triple felina');

-- encargados del refugio
insert into encargados_refugio (id_persona, tarea, fecha) values
(5, 'coordinación general del refugio', '2025-01-01'),
(2, 'apoyo en limpieza y alimentación', '2025-01-02'),
(4, 'gestión de adopciones', '2025-02-01'),
(6, 'mantenimiento de instalaciones', '2025-02-10'),
(8, 'organización de eventos de recaudación', '2025-03-15'),
(9, 'control de medicamentos', '2025-04-01');

select*from adopcion;
select*from cuidado;
select*from encargados_refugio;
select*from gato;
select*from persona;
select*from roles;
select*from usuario;
select*from veterinaria;
