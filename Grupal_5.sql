-- Active: 1684982784502@@127.0.0.1@3306@telovendo2

-- Crear un usuario con todos los privilegios para trabajar con la base de datos recién creada.
CREATE USER 'Grupo5'@'127.0.0.1' IDENTIFIED BY 'Grupal5';

-- Darle todos los privilegios al usuario creado
GRANT ALL PRIVILEGES ON Telovendo2.* TO 'Grupo5'@'127.0.0.1';

-- Parte 2: Crear dos tablas.

-- La primera almacena a los usuarios de la aplicación (id_usuario, nombre, apellido, contraseña, zona horaria(por defecto UTC-3), género y teléfono de contacto).
CREATE TABLE Usuarios (
    id_usuario INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    contraseña VARCHAR(30) NOT NULL,
    zona_horaria VARCHAR(30) NOT NULL DEFAULT 'UTC-3',
    genero VARCHAR(30) NOT NULL,
    telefono VARCHAR(30) NOT NULL,
    PRIMARY KEY (id_usuario)
);

-- Se utilizaron id_usuario como INT de forma auto incremental y no null para que el valor nunca sea nulo
-- nombre, apellido y contraseña se consideraron como texto por lo cual se usó varchar con un largo de 30 caracteres

-- La segunda tabla almacena información relacionada a la fecha-hora de ingreso de los usuarios a la plataforma (id_ingreso, id_usuario y la fecha-hora de ingreso (por defecto la fecha-hora actual)).

CREATE TABLE Ingresos (
    id_ingreso INT NOT NULL AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    fecha_ingreso DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_ingreso),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

-- Se creo una tabla para almacenar los datos de los usuarios
-- Se designo el id el pk y el fk para relacionar ambas tablas , los valores Not Null se incluyeron

-- Parte 3: Modificación de la tabla Modifique el UTC por defecto.Desde UTC-3 a UTC-2.
ALTER TABLE Usuarios
    MODIFY zona_horaria VARCHAR(30) NOT NULL DEFAULT 'UTC-2';
    
-- Parte 4: Creación de registros.
-- Para cada tabla crea 8 registros.



-- Creen una nueva tabla llamada Contactos (id_contacto, id_usuario, número de teléfono,correo electrónico).
CREATE TABLE Contactos (
    id_contacto INT NOT NULL AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    telefono VARCHAR(30) NOT NULL,
    correo VARCHAR(30) NOT NULL,
    PRIMARY KEY (id_contacto),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);


-- Modifique la columna teléfono de contacto, para crear un vínculo entre la tabla Usuarios y la tabla Contactos.
ALTER TABLE Contactos
    ADD tel_contacto VARCHAR(30) NOT NULL;
    
    
-- 8 Usuarios de usuarios
INSERT INTO usuarios( nombre, apellido, contraseña, genero, telefono)
VALUES ('Juan', 'Pérez', '123456', 'Masculino', '123456789'),
('María', 'Gómez', 'abcdef', 'Femenino', '987654321'),
('Pedro', 'López', 'qwerty', 'Masculino', '654321987'),
('Ana', 'Rodríguez', 'zxcvbn', 'Femenino', '321654987'),
('Carlos', 'González', 'poiuyt', 'Masculino', '456789123'),
('Laura', 'Hernández', 'lkjhgf', 'Femenino', '789123456'),
('Luis', 'Torres', 'mnbvcx', 'Masculino', '369258147'),
('Sofía', 'Ramírez', 'ytrewq', 'Femenino', '852741963');


-- 8 Ingresos de usuarios

INSERT INTO ingresos(id_usuario, fecha_ingreso)
VALUES (1, '2022-01-01'),
(2, '2022-01-02'),
(3, '2022-01-03'),
(4, '2022-01-04'),
(5, '2022-01-05'),
(6, '2022-01-06'),
(7, '2022-01-07'),
(8, '2022-01-08');


-- 8 Contactos de usuarios + tel_contacto

INSERT INTO contactos(id_usuario, telefono, correo,tel_contacto)
VALUES (1, '123456789', 'juan.perez@gmail',"321654987"),
(2, '987654321', 'maria.gomez@gmail',"321654987"),
(3, '654321987', 'pedro.lópez@gmail',"321654987"),
(4, '321654987', 'ana.rodriguez@gmail',"321654987"),
(5, '456789123', 'carlos.gonzalez@gmail',"321654987"),
(6, '789123456', 'laura.hernandez@gmail',"321654987"),
(7, '369258147', 'luis.torres@gmail',"321654987"),
(8, '852741963', 'sofía.ramírez@gmail',"321654987");


