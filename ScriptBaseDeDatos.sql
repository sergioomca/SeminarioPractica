CREATE database Masters;

use Masters;

CREATE TABLE grupo (
	grupo_id INT PRIMARY KEY,
    g_nombre VARCHAR(60),
	edad_max INT,
    edad_min INT
);

CREATE TABLE campo (
	campo_id INT PRIMARY KEY,
    c_nombre VARCHAR(60),
    precio DECIMAL(10,2),
    cant_jug INT NOT NULL,
    piso VARCHAR(20)
);

CREATE TABLE turno (
	turno_id INT PRIMARY KEY,
    hora DATETIME NOT NULL,
    duracion INT,
    grupo INT NOT NULL,
    campo_id INT NOT NULL,
    FOREIGN KEY (grupo) REFERENCES Grupo(grupo_id),
    FOREIGN KEY (campo_id) REFERENCES Campo(campo_id)
);

CREATE TABLE jugador (
	jugador_id INT PRIMARY KEY,
    nombre VARCHAR(60),
    edad INT,
    contacto VARCHAR(60),
    posicion VARCHAR(30),
    valoracion INT,
    grupo_id INT,
    FOREIGN KEY (grupo_id) REFERENCES Grupo(grupo_id)
);

CREATE TABLE jugadorTurno (
	jt_id INT PRIMARY KEY,
    turno_id INT,
    jugador_id INT,
    FOREIGN KEY (turno_id) REFERENCES Turno(turno_id),
    FOREIGN KEY (jugador_id) REFERENCES Jugador(jugador_id)
);

-- -------------------------------------------------------
-- Insertar datos de prueba
INSERT INTO grupo(grupo_id, g_nombre, edad_max, edad_min)
VALUES
	(1, "Regulares", 35, 18),
    (2, "Veteranos", 45, 36),
    (3, "Senior", 55, 46);

INSERT INTO campo(campo_id, c_nombre, precio, cant_jug, piso)
VALUES
	(1, "La escondida 1", 40000.00, 22, "Sintetico"),
    (2, "La escondida 2", 20000.00, 10, "Sintetico"),
    (3, "Universitario", 35000, 18, "Gramilla"),
    (4, "El desvio 1", 25000.00, 10, "Alfombra");

INSERT INTO turno(turno_id, hora, duracion, grupo, campo_id)
VALUES
	(1, "2024-05-27 20:00:00", 1, 2, 1),
    (2, "2024-05-29 18:00:00", 1, 3, 2),
    (3, "2024-05-29 18:00:00", 1.5, 2, 3),
    (4, "2024-05-29 18:00:00", 1, 1, 1),
    (5, "2024-05-29 18:00:00",2, 1, 4);

INSERT INTO jugador(jugador_id, nombre, edad, contacto, posicion, valoracion, grupo_id)
VALUES
	(1,"Juan Dominguez", 43, "jdominguez@gmail.com", "Delantero", 7, 2),
    (2,"Pedro Peres", 41, "133333@gmail.com", "Defensor", 8, 2),
    (3,"Jose Diaz", 33, "sdarsota@gmail.com", "Delantero", 6, 1),
    (4, "Juan Gomez", 46, "sadarsa@gmail.com", "Defensor",7,3),
    (5, "Esteban Cadiz", 47, "ecadiz@gmail.com", "Mediocampista",8,3),
    (6, "Luis Timen", 47, "ltimen@gmail.com", "Mediocampista",7,3),
    (7, "Enrique Paez", 51, "epaez@gmail.com", "Delantero",6,3),
    (8, "Jonas Dorin", 48, "jdorin@gmail.com", "Defensor",9,3),
    (9, "Diego Tames", 46, "dtamez@gmail.com", "Mediocampista",8,3),
    (10, "Emanuel Sair", 46, "esair@gmail.com", "Delantero",7,3),
    (11, "Antonio Gomez", 46, "agomez@gmail.com", "Defensor",9,3),
    (12, "Paulo Gomez", 46, "pgomez@gmail.com", "Delantero",9,3),
    (13, "Damian Suarez", 46, "dsuarez@gmail.com", "Delantero",6,3),
    (14, "Diego Josal", 46, "djosal@gmail.com", "Mediocampista",6,3),
    (15, "Lucas Araya", 46, "laraya@gmail.com", "Mediocampista",7,3);
    
INSERT INTO jugadorTurno(jt_id, turno_id, jugador_id)
VALUES
	(1, 2, 15),
    (2, 2, 6),
    (3, 2, 7),
    (4, 2, 8),
    (5, 2, 9),
    (6, 2, 10),
    (7, 2, 11),
    (8, 2, 12),
    (9, 2, 13),
    (10, 2, 14),
    (11, 3, 5),
    (12, 1, 2),
    (13, 4, 1);

-- Consultar datos turnos 
 SELECT 
	turno.turno_id AS "Turno",
    turno.hora AS "Fecha",
    jugador.nombre AS "Jugador",
    campo.c_nombre AS "Lugar",
    campo.precio AS "Precio",
    campo.cant_jug AS "Cant Jug",
    jugador.contacto AS "Contacto"
FROM
	turno,
    jugadorTurno,
    campo,
    jugador
WHERE
	JugadorTurno.turno_id  = turno.turno_id
    AND turno.campo_id = campo.campo_id
    AND jugador.jugador_id = jugadorTurno.jugador_id

;

    
 
 -- -------------------------------------------------- 
 -- Para borrado de datos de prueba y verificacion. 
  DELETE FROM campo;
  DELETE FROM grupo;
  DELETE FROM jugador;
  DELETE FROM jugadorTurno;
  DELETE FROM turno;
  
  SELECT * FROM campo;
  SELECT * FROM grupo;
  SELECT * FROM jugador;
  SELECT * FROM jugadorTurno;
  SELECT * FROM turno;
  -- --------------------------------------------------