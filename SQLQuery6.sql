create database refugio_gatos;


use refugio_gatos;

create table adoptante (
    id_adoptante int primary key identity(1,1), 
    nombre varchar(30) not null
);

create table gato (
    id_gato int primary key identity(1,1), 
    nombre varchar(100) not null,
    edad int,
    id_adoptante int, 
    foreign key (id_adoptante) references adoptante(id_adoptante)
);

insert into adoptante (nombre)
values ('ana torres'),
       ('luis pérez');
insert into gato (nombre, edad, id_adoptante)
values ('michi', 2, 1),   
       ('luna', 1, null), 
       ('tommy', 3, 2);   


select * from adoptante;

select * from gato;

update adoptante
set nombre = 'luis ramirez'
where id_adoptante = 2;

select g.nombre as gato, a.nombre as adoptante
from gato g
left join adoptante a on g.id_adoptante = a.id_adoptante;
