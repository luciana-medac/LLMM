DROP DATABASE IF EXISTS gormitis;
CREATE DATABASE gormitis;
USE gormitis;

CREATE TABLE tribu (
  idTribu INT auto_increment PRIMARY KEY,
  nombre VARCHAR(50),
  territorio VARCHAR(100),
  lider VARCHAR(50)
);

CREATE TABLE gormiti (
  idGormiti INT auto_increment PRIMARY KEY,
  nombre VARCHAR(50),
  idTribu INT,
  FOREIGN KEY (idTribu) REFERENCES tribu(idTribu)
);

CREATE TABLE poder (
  idPoder INT auto_increment PRIMARY KEY,
  nombre VARCHAR(100),
  idGormiti INT,
  FOREIGN KEY (idGormiti) REFERENCES gormiti(idGormiti)
);

CREATE TABLE batalla (
  idBatalla INT auto_increment PRIMARY KEY,
  nombre VARCHAR(100),
  lugar VARCHAR(100),
  ganador VARCHAR(50)
);

CREATE TABLE gormiti_batalla (
  idGormiti INT,
  idBatalla INT,
  FOREIGN KEY (idGormiti) REFERENCES gormiti(idGormiti),
  FOREIGN KEY (idBatalla) REFERENCES batalla(idBatalla)
);

INSERT INTO tribu (nombre, territorio, lider) VALUES
('Volcan', 'Monte Volcan', 'Horror'),
('Mar', 'Mar de Gorm', 'Carrapax'),
('Tierra', 'Montañas Rocosas', 'Kolossus'),
('Aire', 'Cumbres Celestiales', 'Helios'),
('Luz', 'Pueblo de Luz', 'Luminor'),
('Oscuridad', 'Pueblo de Oscuridad', 'Obscurio');

INSERT INTO gormiti (idGormiti, nombre, idTribu) VALUES
(1, 'Kolossus', 3),
(2, 'Carrapax', 2);


INSERT INTO poder (idPoder, nombre, idGormiti) VALUES
(1, 'Mazo destructor antiguo', 1),
(2, 'Grandes Energías del Mar Sagrado', 2);

INSERT INTO batalla (idBatalla, nombre, lugar, ganador) VALUES
(1, 'Ruler Of Gorm', 'Llanura de Astreg', 'Luminos'), 
(2, 'Por el ojo de la vida', 'Valle del Destino', 'Hydros');

-- Batalla 1: 
INSERT INTO gormiti_batalla (idGormiti, idBatalla) VALUES
(1, 1), -- Kolossus y su batalla es Ruler of gorm
(2, 1); -- Carrapax y su batalla es valle del destino


-- Batalla 2: 
INSERT INTO gormiti_batalla (idGormiti, idBatalla) VALUES
(2, 2), -- Hydros
(4, 2); -- Aerion

-- estadisticas de los personajes
ALTER TABLE gormiti_estadisticas
ADD mimetismo INT,
ADD magia INT,
ADD potencia INT,
ADD velocidad INT,
ADD psicopoder INT;

-- necesito modificarlo con la info
UPDATE gormiti SET fuerza = 90, defensa = 70, velocidad = 80, poderMagico = 95 WHERE nombre = 'Kolossus';
UPDATE gormiti SET fuerza = 75, defensa = 85, velocidad = 70, poderMagico = 100 WHERE nombre = 'Hydros';
UPDATE gormiti SET fuerza = 95, defensa = 95, velocidad = 40, poderMagico = 60 WHERE nombre = 'Granitus';
UPDATE gormiti SET fuerza = 60, defensa = 60, velocidad = 100, poderMagico = 80 WHERE nombre = 'Aerion';



SELECT CONCAT(
  '<?xml version="1.0" encoding="UTF-8"?>',
  '\n<gormitiMundo>',

  -- Tribus
  '\n  <tribus>',
  (SELECT GROUP_CONCAT(
    CONCAT(
      '\n    <tribu nombre="', t.nombre, '">',
      '\n      <territorio>', t.territorio, '</territorio>',
      '\n      <lider>', t.lider, '</lider>',
      '\n    </tribu>'
    ) SEPARATOR ''
  ) FROM tribu t),
  '\n  </tribus>',

  -- Gormitis y sus poderes
  '\n  <gormitis>',
  (SELECT GROUP_CONCAT(
    CONCAT(
      '\n    <gormiti>',
      '\n      <nombre>', g.nombre, '</nombre>',
      '\n      <tribu>', t.nombre, '</tribu>',
      '\n      <poderes>',
      (SELECT GROUP_CONCAT(
        CONCAT('\n        <poder>', p.nombre, '</poder>')
        SEPARATOR ''
      ) FROM poder p WHERE p.idGormiti = g.idGormiti),
      '\n      </poderes>',
      '\n    </gormiti>'
    ) SEPARATOR ''
  ) FROM gormiti g JOIN tribu t ON g.idTribu = t.idTribu),
  '\n  </gormitis>',

  -- Batallas legendarias
  '\n  <batallasLegendarias>',
  (SELECT GROUP_CONCAT(
    CONCAT(
      '\n    <batalla>',
      '\n      <nombre>', b.nombre, '</nombre>',
      '\n      <lugar>', b.lugar, '</lugar>',
      '\n      <participantes>',
      (SELECT GROUP_CONCAT(
        CONCAT('\n        <gormiti>', g2.nombre, '</gormiti>')
        SEPARATOR ''
      )
      FROM gormiti_batalla gb
      JOIN gormiti g2 ON gb.idGormiti = g2.idGormiti
      WHERE gb.idBatalla = b.idBatalla),
      '\n      </participantes>',
      '\n      <ganador>', b.ganador, '</ganador>',
      '\n    </batalla>'
    ) SEPARATOR ''
  ) FROM batalla b),
  '\n  </batallasLegendarias>',

  '\n</gormitiMundo>'
) AS xml_result;
