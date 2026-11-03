-- Ejercicio B1.1
-- Crear tabla planes

CREATE TABLE planes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    precio_mensual NUMERIC(6,2) NOT NULL
);


-- Ejercicio B1.2
-- Crear tabla socios

CREATE TABLE socios (
    id SERIAL PRIMARY KEY,
    dni VARCHAR(9) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    fecha_alta DATE NOT NULL,
    plan_id INTEGER NOT NULL,
    FOREIGN KEY (plan_id) REFERENCES planes(id)
);


-- Ejercicio B1.3
-- Crear tabla tarjetas

CREATE TABLE tarjetas (
    id SERIAL PRIMARY KEY,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    activa BOOLEAN NOT NULL,
    socio_id INTEGER NOT NULL UNIQUE,
    FOREIGN KEY (socio_id) REFERENCES socios(id)
);


-- Ejercicio B1.4
-- Crear tabla monitores

CREATE TABLE monitores (
    id SERIAL PRIMARY KEY,
    dni VARCHAR(9) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);


-- Ejercicio B1.5
-- Crear tabla clases

CREATE TABLE clases (
    id SERIAL PRIMARY KEY,
    actividad VARCHAR(100) NOT NULL,
    sala VARCHAR(50) NOT NULL,
    fecha_hora TIMESTAMP NOT NULL,
    plazas INTEGER NOT NULL CHECK (plazas > 0),
    monitor_id INTEGER NOT NULL,
    FOREIGN KEY (monitor_id) REFERENCES monitores(id)
);


-- Ejercicio B1.6
-- Crear tabla reservas

CREATE TABLE reservas (
    id SERIAL PRIMARY KEY,
    socio_id INTEGER NOT NULL,
    clase_id INTEGER NOT NULL,
    fecha_reserva DATE NOT NULL,
    FOREIGN KEY (socio_id) REFERENCES socios(id),
    FOREIGN KEY (clase_id) REFERENCES clases(id),
    UNIQUE (socio_id, clase_id)
);


-- Ejercicio B1.7
-- Crear tabla especialidades

CREATE TABLE especialidades (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);


-- Ejercicio B1.8
-- Crear tabla monitor_especialidades

CREATE TABLE monitor_especialidades (
    monitor_id INTEGER NOT NULL,
    especialidad_id INTEGER NOT NULL,
    PRIMARY KEY (monitor_id, especialidad_id),
    FOREIGN KEY (monitor_id) REFERENCES monitores(id),
    FOREIGN KEY (especialidad_id) REFERENCES especialidades(id)
);
//EJERCICIO B2//
INSERT INTO planes (nombre, precio_mensual)
VALUES
    ('Básico', 29.90),
    ('Completo', 44.90),
    ('Estudiante', 24.90),
    ('Mañanas', 19.90);

    INSERT INTO socios (dni, nombre, email, fecha_alta, plan_id)
VALUES
    ('11111111A', 'Ana Pérez', 'ana@gym.com', '2026-01-10', 2),
    ('22222222B', 'Luis García', 'luis@gym.com', '2026-02-03', 1),
    ('33333333C', 'Marta López', 'marta@gym.com', '2026-03-15', 3),
    ('44444444D', 'Hugo Sanz', 'hugo@gym.com', '2026-03-20', 2),
    ('55555555E', 'Lucía Ruiz', 'lucia@gym.com', '2026-05-02', 3),
    ('66666666F', 'Pablo Martín', 'pablo@gym.com', '2026-06-11', 1),
    ('77777777G', 'Sara Gil', 'sara@gym.com', '2026-09-01', 2),
    ('88888888H', 'Diego Vidal', 'diego@gym.com', '2026-10-01', 1);

    INSERT INTO tarjetas (codigo, activa, socio_id)
VALUES
    ('TJ-0001', TRUE, 1),
    ('TJ-0002', TRUE, 2),
    ('TJ-0003', TRUE, 3),
    ('TJ-0004', FALSE, 4),
    ('TJ-0005', TRUE, 5),
    ('TJ-0006', TRUE, 6),
    ('TJ-0007', TRUE, 7);

    INSERT INTO monitores (dni, nombre, email)
VALUES
    ('90000001J', 'Carla Navarro', 'carla@gym.com'),
    ('90000002K', 'Javier Ortega', 'javier@gym.com'),
    ('90000003L', 'Elena Romero', 'elena@gym.com'),
    ('90000004M', 'Rubén Castro', 'ruben@gym.com');

    INSERT INTO clases (actividad, sala, fecha_hora, plazas, monitor_id)
VALUES
    ('Spinning', 'Sala 1', '2026-11-02 09:00', 12, 1),
    ('Yoga', 'Sala 2', '2026-11-02 18:00', 10, 2),
    ('Pilates', 'Sala 2', '2026-11-03 10:00', 8, 3),
    ('Spinning', 'Sala 1', '2026-11-03 19:00', 12, 1),
    ('Zumba', 'Sala 3', '2026-11-04 18:30', 20, 3),
    ('Yoga', 'Sala 2', '2026-11-05 09:30', 10, 2),
    ('Crossfit', 'Sala 3', '2026-11-05 20:00', 3, 1);

    INSERT INTO reservas (socio_id, clase_id, fecha_reserva)
VALUES
    (1, 1, '2026-10-28'),
    (1, 3, '2026-10-28'),
    (1, 7, '2026-10-29'),
    (2, 1, '2026-10-29'),
    (2, 2, '2026-10-29'),
    (3, 2, '2026-10-30'),
    (3, 5, '2026-10-30'),
    (4, 1, '2026-10-30'),
    (4, 7, '2026-10-31'),
    (5, 3, '2026-10-31'),
    (5, 5, '2026-10-31'),
    (6, 4, '2026-11-01'),
    (7, 5, '2026-11-01'),
    (7, 7, '2026-11-01');

    INSERT INTO especialidades (nombre)
VALUES
    ('Ciclo indoor'),
    ('Yoga'),
    ('Pilates'),
    ('Baile'),
    ('Fuerza');

    INSERT INTO monitor_especialidades (monitor_id, especialidad_id)
VALUES
    (1, 1),
    (1, 5),
    (2, 2),
    (2, 3),
    (3, 3),
    (3, 4),
    (4, 5);

    SELECT
    (SELECT COUNT(*) FROM planes) AS planes,
    (SELECT COUNT(*) FROM socios) AS socios,
    (SELECT COUNT(*) FROM tarjetas) AS tarjetas,
    (SELECT COUNT(*) FROM monitores) AS monitores,
    (SELECT COUNT(*) FROM clases) AS clases,
    (SELECT COUNT(*) FROM reservas) AS reservas,
    (SELECT COUNT(*) FROM especialidades) AS especialidades;
 planes | socios | tarjetas | monitores | clases | reservas | especialidades
--------+--------+----------+-----------+--------+----------+----------------
      4 |      8 |        7 |         4 |      7 |       14 |              5
(1 row)


--EJERCICIO B3--

-- Ejercicio B3.1
INSERT INTO socios (dni, nombre, email, fecha_alta, plan_id)
VALUES ('99999999Z', 'Nora Prueba', 'nora@gym.com', '2026-10-27', 99);
-- Ejercicio B3.2

INSERT INTO socios (dni, nombre, email, fecha_alta, plan_id)
VALUES ('99999999Z', 'Nora Prueba', 'ana@gym.com', '2026-10-27', 1);
-- Ejercicio B3.3

INSERT INTO tarjetas (codigo, activa, socio_id)
VALUES ('TJ-0099', TRUE, 1);
-- Ejercicio B3.4
INSERT INTO reservas (socio_id, clase_id, fecha_reserva)
VALUES (1, 1, '2026-10-30');

-- Ejercicio B3.5
INSERT INTO reservas (socio_id, clase_id, fecha_reserva)
VALUES (2, 50, '2026-10-30');

-- Ejercicio B3.6
DELETE FROM planes WHERE nombre = 'Básico';

-- Ejercicio B3.7
DELETE FROM planes WHERE nombre = 'Mañanas';

-- Volver a insertar el plan Mañanas
INSERT INTO planes (nombre, precio_mensual) VALUES ('Mañanas', 19.90);

--EJERCICIO B4--
SELECT s.nombre AS socio, p.nombre AS plan, p.precio_mensual
FROM socios s
JOIN planes p ON s.plan_id = p.id
ORDER BY s.nombre;
 socio     |    plan    | precio_mensual
--------------+------------+----------------
 Ana Pérez    | Completo   |          44.90
 Diego Vidal  | Básico     |          29.90
 Hugo Sanz    | Completo   |          44.90
 Lucía Ruiz   | Estudiante |          24.90
 Luis García  | Básico     |          29.90
 Marta López  | Estudiante |          24.90
 Pablo Martín | Básico     |          29.90
 Sara Gil     | Completo   |          44.90
(8 rows)

--EJERCICIO B4.2--
SELECT c.actividad, c.fecha_hora, c.sala, m.nombre AS monitor
FROM clases c
JOIN monitores m ON c.monitor_id = m.id
ORDER BY c.fecha_hora;
actividad |     fecha_hora      |  sala  |    monitor
-----------+---------------------+--------+---------------
 Spinning  | 2026-11-02 09:00:00 | Sala 1 | Carla Navarro
 Yoga      | 2026-11-02 18:00:00 | Sala 2 | Javier Ortega
 Pilates   | 2026-11-03 10:00:00 | Sala 2 | Elena Romero
 Spinning  | 2026-11-03 19:00:00 | Sala 1 | Carla Navarro
 Zumba     | 2026-11-04 18:30:00 | Sala 3 | Elena Romero
 Yoga      | 2026-11-05 09:30:00 | Sala 2 | Javier Ortega
 Crossfit  | 2026-11-05 20:00:00 | Sala 3 | Carla Navarro
(7 rows)
--EJERCICIO B4.3--
SELECT s.nombre AS socio, t.codigo AS tarjeta
FROM socios s
LEFT JOIN tarjetas t ON t.socio_id = s.id
ORDER BY s.nombre;
  socio     | tarjeta
--------------+---------
 Ana Pérez    | TJ-0001
 Diego Vidal  |
 Hugo Sanz    | TJ-0004
 Lucía Ruiz   | TJ-0005
 Luis García  | TJ-0002
 Marta López  | TJ-0003
 Pablo Martín | TJ-0006
 Sara Gil     | TJ-0007
(8 rows)

--EJERCICIO B4.4--
SELECT s.nombre AS socio
FROM socios s
LEFT JOIN tarjetas t ON t.socio_id = s.id
WHERE t.id IS NULL;
 socio
-------------
 Diego Vidal
(1 row)

--EJERCICIO B4.5--
SELECT p.nombre AS plan, COUNT(s.id) AS num_socios
FROM planes p
LEFT JOIN socios s ON s.plan_id = p.id
GROUP BY p.id, p.nombre
ORDER BY p.nombre;
 plan    | num_socios
------------+------------
 Básico     |          3
 Completo   |          3
 Estudiante |          2
 Mañanas    |          0
(4 rows)

--EJERCICIO B4.6--
SELECT s.nombre AS socio, c.actividad, c.fecha_hora
FROM reservas r
JOIN socios s ON r.socio_id = s.id
JOIN clases c ON r.clase_id = c.id
ORDER BY s.nombre, c.fecha_hora;
 socio     | actividad |     fecha_hora
--------------+-----------+---------------------
 Ana Pérez    | Spinning  | 2026-11-02 09:00:00
 Ana Pérez    | Pilates   | 2026-11-03 10:00:00
 Ana Pérez    | Crossfit  | 2026-11-05 20:00:00
 Hugo Sanz    | Spinning  | 2026-11-02 09:00:00
 Hugo Sanz    | Crossfit  | 2026-11-05 20:00:00
 Lucía Ruiz   | Pilates   | 2026-11-03 10:00:00
 Lucía Ruiz   | Zumba     | 2026-11-04 18:30:00
 Luis García  | Spinning  | 2026-11-02 09:00:00
 Luis García  | Yoga      | 2026-11-02 18:00:00
 Marta López  | Yoga      | 2026-11-02 18:00:00
 Marta López  | Zumba     | 2026-11-04 18:30:00
 Pablo Martín | Spinning  | 2026-11-03 19:00:00
 Sara Gil     | Zumba     | 2026-11-04 18:30:00
 Sara Gil     | Crossfit  | 2026-11-05 20:00:00
(14 rows)

--EJERCICIO B4.7--
SELECT s.nombre AS socio
FROM reservas r
JOIN socios s ON r.socio_id = s.id
WHERE r.clase_id = 1;
 socio
-------------
 Ana Pérez
 Luis García
 Hugo Sanz
(3 rows)

--EJERCICIO B4.8--
SELECT c.actividad, c.fecha_hora, c.plazas, COUNT(r.id) AS num_reservas
FROM clases c
LEFT JOIN reservas r ON r.clase_id = c.id
GROUP BY c.id, c.actividad, c.fecha_hora, c.plazas
ORDER BY c.fecha_hora;
actividad |     fecha_hora      | plazas | num_reservas
-----------+---------------------+--------+--------------
 Spinning  | 2026-11-02 09:00:00 |     12 |            3
 Yoga      | 2026-11-02 18:00:00 |     10 |            2
 Pilates   | 2026-11-03 10:00:00 |      8 |            2
 Spinning  | 2026-11-03 19:00:00 |     12 |            1
 Zumba     | 2026-11-04 18:30:00 |     20 |            3
 Yoga      | 2026-11-05 09:30:00 |     10 |            0
 Crossfit  | 2026-11-05 20:00:00 |      3 |            3

 --EJERCICIO B4.9--
 SELECT m.nombre AS monitor
FROM monitores m
LEFT JOIN clases c ON c.monitor_id = m.id
WHERE c.id IS NULL;
 monitor
--------------
 Rubén Castro
(1 row)
--EJERCICIO B4.10--
SELECT m.nombre AS monitor, e.nombre AS especialidad
FROM monitor_especialidades me
JOIN monitores m ON me.monitor_id = m.id
JOIN especialidades e ON me.especialidad_id = e.id
ORDER BY m.nombre, e.nombre;
 monitor    | especialidad
---------------+--------------
 Carla Navarro | Ciclo indoor
 Carla Navarro | Fuerza
 Elena Romero  | Baile
 Elena Romero  | Pilates
 Javier Ortega | Pilates
 Javier Ortega | Yoga
 Rubén Castro  | Fuerza

--EJERCICIO B5--
SELECT * FROM socios WHERE email = 'luis@gym.com';
 id |    dni    |   nombre    |    email     | fecha_alta | plan_id
----+-----------+-------------+--------------+------------+---------
  2 | 22222222B | Luis García | luis@gym.com | 2026-02-03 |       1
(1 row)
SELECT * FROM socios WHERE email = 'luis@gym.com';

UPDATE socios
SET plan_id = 2
WHERE email = 'luis@gym.com';
id |    dni    |   nombre    |    email     | fecha_alta | plan_id
----+-----------+-------------+--------------+------------+---------
  2 | 22222222B | Luis García | luis@gym.com | 2026-02-03 |       2

--EJERCICIO 5.2--
SELECT * FROM tarjetas WHERE codigo = 'TJ-0004';
 id | codigo  | activa | socio_id
----+---------+--------+----------
  4 | TJ-0004 | f      |        4
  UPDATE tarjetas
SET activa = TRUE
WHERE codigo = 'TJ-0004';
SELECT * FROM tarjetas WHERE codigo = 'TJ-0004';
 id | codigo  | activa | socio_id
----+---------+--------+----------
  4 | TJ-0004 | t      |        4
(1 row)

--EJERCICIO 5.3--
 SELECT id, nombre FROM socios WHERE email = 'diego@gym.com';
 id |   nombre
----+-------------
  8 | Diego Vidal
(1 row)
INSERT INTO tarjetas (codigo, activa, socio_id)
VALUES ('TJ-0008', TRUE, 8);

SELECT s.nombre AS socio
FROM socios s
LEFT JOIN tarjetas t ON t.socio_id = s.id
WHERE t.id IS NULL;
 socio
-------
(0 rows)

--EJERCICIO 5.4--
INSERT INTO reservas (socio_id, clase_id, fecha_reserva)
VALUES (8, 6, '2026-11-02');
INSERT 0 1
SELECT * FROM reservas WHERE clase_id = 6;
 id | socio_id | clase_id | fecha_reserva
----+----------+----------+---------------
 17 |        8 |        6 | 2026-11-02
(1 row)

SELECT * FROM reservas WHERE socio_id = 2 AND clase_id = 2;
 id | socio_id | clase_id | fecha_reserva
----+----------+----------+---------------
  5 |        2 |        2 | 2026-10-29
(1 row)
DELETE FROM reservas WHERE socio_id = 2 AND clase_id = 2;
DELETE 1
-- Ejercicio B5.5 
SELECT * FROM reservas WHERE socio_id = 2 AND clase_id = 2;
 id | socio_id | clase_id | fecha_reserva
----+----------+----------+---------------
(0 rows)
-- Ejercicio B5.6
-- Intento de borrar a Pablo directamente (da error)
DELETE FROM socios WHERE email = 'pablo@gym.com';

-- Comprobar qué apunta a Pablo
SELECT * FROM reservas WHERE socio_id = 6;
SELECT * FROM tarjetas WHERE socio_id = 6;

-- Borrar en orden: primero lo que apunta a Pablo, Pablo al final
DELETE FROM reservas WHERE socio_id = 6;
DELETE FROM tarjetas WHERE socio_id = 6;
DELETE FROM socios WHERE email = 'pablo@gym.com';
