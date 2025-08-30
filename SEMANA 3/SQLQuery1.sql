use refugio_gatos;

create table persona (
    id_persona INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    direccion VARCHAR(150),
    correo VARCHAR(100) UNIQUE -- No pueden repetirse   
);

CREATE TABLE roles (
    id_roles INT IDENTITY (1,1) PRIMARY KEY,
    id_persona INT NOT NULL,
    rol_administrados VARCHAR(2) NOT NULL,      --Si o no
    rol_voluntariado VARCHAR(2) NOT NULL,       --Si o no
    rol_cuidador_temporal VARCHAR(2) NOT NULL,  --Si o no
    rol_adoptante VARCHAR(2) NOT NULL,          --Si o no
    FOREIGN KEY (id_persona) references persona(id_persona)
);

CREATE TABLE usuario (
    id_usuario INT IDENTITY(1,1) PRIMARY KEY,
    id_persona INT NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    contraseña VARCHAR(200) NOT NULL,  
    foreign key  (id_persona) references persona(id_persona)
);

CREATE TABLE gato (
    id_gato INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    edad INT,
    raza VARCHAR(50),
    estado_gato VARCHAR(20),
    cuidado_requerido VARCHAR(200)
);

CREATE TABLE adopcion (
    id_adopcion INT IDENTITY(1,1) PRIMARY KEY,
    id_gato INT NOT NULL,
    id_adoptante INT NOT NULL,  -- persona con rol = 'Adoptante'
    fecha_adopcion DATE NOT NULL,
    observaciones VARCHAR(200),
    foreign key (id_gato) references gato(id_gato),
    foreign key (id_adoptante) references persona(id_persona)  
);

CREATE TABLE cuidado (
    id_cuidado INT IDENTITY(1,1) PRIMARY KEY,
    id_gato INT NOT NULL,
    id_cuidador INT NOT NULL,   -- persona con rol = 'Cuidador'
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    notas VARCHAR(200),
    foreign key (id_gato) references gato(id_gato),
    foreign key (id_cuidador) references persona(id_persona)
);


CREATE TABLE veterinaria (
    id_vet INT IDENTITY(1,1) PRIMARY KEY,
    id_gato INT NOT NULL,
    fecha_visita DATE NOT NULL,  --(año,mes,dia)
    diagnostico VARCHAR(200),
    tratamiento VARCHAR(200),
    vacuna VARCHAR(100),
    foreign key (id_gato) references gato(id_gato)
);

CREATE TABLE encargados_refugio (
    id_encargado INT IDENTITY(1,1) PRIMARY KEY,
    id_persona INT NOT NULL,
    tarea VARCHAR(200) NOT NULL,
    fecha DATE NOT NULL,
    foreign key (id_persona) references persona(id_persona)
);

select*from adopcion;
select*from cuidado;
select*from encargados_refugio;
select*from gato;
select*from persona;
select*from roles;
select*from usuario;
select*from veterinaria;




