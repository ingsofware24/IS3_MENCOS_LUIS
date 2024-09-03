create database Empresa

CREATE TABLE roles (
    rol_id SERIAL PRIMARY KEY,
    rol_nombre VARCHAR(50)
);


INSERT INTO roles (rol_nombre) VALUES ('Administrativo');
INSERT INTO roles (rol_nombre) VALUES ('Usuario');
INSERT INTO roles (rol_nombre) VALUES ('Usuario');
INSERT INTO roles (rol_nombre) VALUES ('Ususario');
INSERT INTO roles (rol_nombre) VALUES ('administrador');


CREATE TABLE usuarios (
    usuario_id SERIAL PRIMARY KEY,
    usa_nombre VARCHAR(50),
    usa_correo VARCHAR(30),
    rol_id INTEGER,
    FOREIGN KEY (rol_id) REFERENCES roles(rol_id)
);

INSERT INTO usuarios (usa_nombre, usa_correo, rol_id) VALUES ('Ana Martínez', 'ana.martinez@gmail.com', 1);
INSERT INTO usuarios (usa_nombre, usa_correo, rol_id) VALUES ('Luis Gómez', 'luis.gomez@gmail.com', 2); 
INSERT INTO usuarios (usa_nombre, usa_correo, rol_id) VALUES ('Pedro López', 'pedro.lopez@gmail.com', 3); 
INSERT INTO usuarios (usa_nombre, usa_correo, rol_id) VALUES ('Marta Fernández', 'marta.fernandez@gmail.com', 4); 
INSERT INTO usuarios (usa_nombre, usa_correo, rol_id) VALUES ('Carlos Ruiz', 'carlos.ruiz@gmail.com', 5);




CREATE TABLE envios (
    envios_id SERIAL PRIMARY KEY,
    env_fecha_envio VARCHAR (30),
    usuario_id INTEGER,
    env_ori_lat DECIMAL(10, 8) NOT NULL,
    env_ori_lng DECIMAL(11, 8) NOT NULL,
    env_des_lat DECIMAL(10, 8) NOT NULL,
    env_des_lng DECIMAL(11, 8) NOT NULL,
    env_estado VARCHAR(50),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id)
);

INSERT INTO envios (env_fecha_envio, usuario_id, env_ori_lat, env_ori_lng, env_des_lat, env_des_lng, env_estado) VALUES ('2024-09-01 14:30', 1, 14.634915, -90.506882, 34.052235, -118.243683, 'En tránsito');
INSERT INTO envios (env_fecha_envio, usuario_id, env_ori_lat, env_ori_lng, env_des_lat, env_des_lng, env_estado) VALUES ('2024-09-02 09:15', 2, 14.634915, -90.506882, 51.507351, -0.127758, 'Entregado');
INSERT INTO envios (env_fecha_envio, usuario_id, env_ori_lat, env_ori_lng, env_des_lat, env_des_lng, env_estado) VALUES ('2024-09-03 18:45', 3, 14.634915, -90.506882, 48.856613, 2.352222, 'Pendiente');
INSERT INTO envios (env_fecha_envio, usuario_id, env_ori_lat, env_ori_lng, env_des_lat, env_des_lng, env_estado) VALUES ('2024-09-04 11:30', 4, 14.634915, -90.506882, 39.904202, 116.407394, 'En tránsito');
INSERT INTO envios (env_fecha_envio, usuario_id, env_ori_lat, env_ori_lng, env_des_lat, env_des_lng, env_estado) VALUES ('2024-09-05 07:00', 5, 14.634915, -90.506882, 35.689487, 139.691711, 'Cancelado');


select * from usuarios

CREATE TABLE camiones (
    camion_id SERIAL PRIMARY KEY,
    cam_matricula VARCHAR(15),
    cam_marca VARCHAR(20),
    cam_modelo VARCHAR(10),
    cam_anio VARCHAR (15)
);

INSERT INTO camiones (cam_matricula, cam_marca, cam_modelo, cam_anio) VALUES ('C-123PMT', 'Mercedes-Benz', 'FH16', '2020');
INSERT INTO camiones (cam_matricula, cam_marca, cam_modelo, cam_anio) VALUES ('C-567JPG', 'Mercedes-Benz', 'FH16', '2018');
INSERT INTO camiones (cam_matricula, cam_marca, cam_modelo, cam_anio) VALUES ('C-910UZR', 'Mercedes-Benz', 'FH16', '2019');
INSERT INTO camiones (cam_matricula, cam_marca, cam_modelo, cam_anio) VALUES ('C-112COA', 'Mercedes-Benz', 'FH16', '2021');
INSERT INTO camiones (cam_matricula, cam_marca, cam_modelo, cam_anio) VALUES ('C-314RAM', 'Mercedes-Benz', 'FH16', '2022');


CREATE TABLE envio_camiones (
    env_camion_id SERIAL PRIMARY KEY,
    envio_id INTEGER,
    camion_id INTEGER,
    fecha_egreso VARCHAR (20),
    fecha_ingreso VARCHAR (20),
    FOREIGN KEY (envio_id) REFERENCES envios(envios_id),
    FOREIGN KEY (camion_id) REFERENCES camiones(camion_id)
);

INSERT INTO envio_camiones (envio_id, camion_id, fecha_egreso, fecha_ingreso)
 VALUES (8, 1, '2024-09-01 10:00', '2024-09-01 18:00');
 INSERT INTO envio_camiones (envio_id, camion_id, fecha_egreso, fecha_ingreso)
 VALUES (9, 2, '2024-09-02 09:30', '2024-09-02 17:00');
 INSERT INTO envio_camiones (envio_id, camion_id, fecha_egreso, fecha_ingreso)
 VALUES (10, 3, '2024-09-03 14:00', '2024-09-03 20:00');
 INSERT INTO envio_camiones (envio_id, camion_id, fecha_egreso, fecha_ingreso)
 VALUES (11, 4, '2024-09-04 11:15', '2024-09-04 19:30');
 INSERT INTO envio_camiones (envio_id, camion_id, fecha_egreso, fecha_ingreso)
 VALUES (12, 5, '2024-09-05 08:00', '2024-09-05 16:00');












