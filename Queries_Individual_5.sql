-- Active: 1684982784502@@127.0.0.1@3306@otro_mundo

-- Crear un usuario con todos los privilegios para trabajar con la base de datos recién creada.
CREATE USER 'otro_mundo'@'127.0.0.1' IDENTIFIED BY 'otro_mundo';
GRANT ALL PRIVILEGES ON OTRO_MUNDO.* TO 'otro_mundo'@'127.0.0.1';

-- Crear la tabla usuarios (id_usuario, nombre, apellido, contraseña,zona horaria (por defecto UTC-3), género y teléfono de contacto)

CREATE TABLE USUARIOS (
    id_usuario INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    contraseña VARCHAR(100) NOT NULL,
    zona_horaria VARCHAR(100) NOT NULL DEFAULT 'UTC-3',
    genero VARCHAR(100) NOT NULL,
    telefono VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_usuario)
);

--  Crear la tabla INGRESOS (id_ingreso, id_usuario y la fecha-hora de ingreso (por defecto la fecha-hora actual)).
CREATE TABLE INGRESOS (
    id_ingreso INT NOT NULL AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    fecha_hora_ingreso DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_ingreso),
    FOREIGN KEY (id_usuario) REFERENCES USUARIOS(id_usuario)
);


-- Crear Tabla visitas para los usuarios que ingresar a la aplicacion
CREATE TABLE VISITAS (
    id_visita INT NOT NULL AUTO_INCREMENT,
    cantidad_visitas INT NOT NULL,
    id_usuario INT NOT NULL,
    PRIMARY KEY (id_visita),
    FOREIGN KEY (id_usuario) REFERENCES USUARIOS(id_usuario)
);


-- CREA 8 USUARIOS PARA LA TABLA USUARIOS
INSERT INTO USUARIOS (nombre, apellido, contrasena, genero, telefono) VALUES 
('Juan', 'Perez', '123456', 'Masculino', '123456789');



INSERT INTO USUARIOS (nombre, apellido, contrasena, genero, telefono) VALUES 
('Juan Pablo', 'González', 'contraseña123', 'masculino', '+56912345678'),
('Andrea', 'Pérez', 'abc123', 'femenino', '+56987654321'),
('Rodrigo', 'Flores', 'programador123', 'masculino', '+56924681357'),
('Camila', 'Rojas', 'codingpass', 'femenino', '+56936925814'),
('Mario', 'Leiva', 'pass1234', 'masculino', '+56974185296'),
('Valentina', 'Araya', 'programando1', 'femenino', '+56913579024'),
('Sebastián', 'Orellana', 'programador2021', 'masculino', '+56980246713'),
('Natalia', 'Alarcón', 'password123', 'femenino', '+56957123456');


-- Crear 8 Ingresos con el id_usuario id_ingreso fecha_hora_ingreso
INSERT INTO INGRESOS (id_usuario, fecha_hora_ingreso) VALUES 
(1, NOW()),
(2, NOW()),
(3, NOW()),
(9, NOW()),
(5, NOW()),
(9, NOW()),
(7, NOW()),
(9, NOW());


-- Crea 8 visitas de usuarios
INSERT INTO VISITAS (id_usuario, cantidad_visitas) VALUES 
(1, 1),
(2, 1),
(3, 1),
(4, 0),
(5, 1),
(6, 0),
(7, 1),
(8, 0),
(9, 3);

-- Elimine una de las siguentes tablas "QUE COMIENCE EL JUEGO.."
DROP TABLE USUARIOS;
DROP TABLE INGRESOS;
DROP TABLE VISITAS;




