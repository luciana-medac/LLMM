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

CREATE TABLE estadisticas_ataque (
  idEstadisticas INT auto_increment PRIMARY KEY,
  idGormiti INT,
  mimetismo INT,
  magia INT,
  potencia INT,
  velocidad INT,
  psicopoder INT,
  FOREIGN KEY (idGormiti) REFERENCES gormiti(idGormiti)
);

CREATE TABLE estadisticas_defensa (
  idEstadisticas INT auto_increment PRIMARY KEY,
  idGormiti INT,
  mimetismo INT,
  magia INT,
  potencia INT,
  velocidad INT,
  psicopoder INT,
  FOREIGN KEY (idGormiti) REFERENCES gormiti(idGormiti)
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

INSERT INTO gormiti (nombre, idTribu) VALUES
('Kolossus', 3),
('Carrapax', 2),
('Tasarau', 3),
('Magmion', 1),
('Luminor', 5),
('Obscurio', 6);

INSERT INTO poder (nombre, idGormiti) VALUES
('Mazo destructor antiguo', 1),
('Grandes Energías del Mar Sagrado', 2),
('Lianas Atrapadoras', 3),
('Explosión de Magma', 4),
('Rayo Solar', 5),
('Oscuridad absoluta', 6);

INSERT INTO estadisticas_ataque (idGormiti, mimetismo, magia, potencia, velocidad, psicopoder) VALUES
(1, 6, 15, 17, 6, 13),  -- Kolossus
(2, 9, 13, 7, 6, 10), -- Carrapax
(3, 12, 7, 8, 2, 13),  -- Tasarau
(4, 3, 20, 18, 5, 8), -- Magmion
(5, 2, 28, 12, 18, 30), -- Luminor
(6, 4, 33, 21, 11, 15); -- Obscurio

INSERT INTO estadisticas_defensa (idGormiti, mimetismo, magia, potencia, velocidad, psicopoder) VALUES
(1, 10, 13, 17, 5, 8),  -- Luminos
(2, 11, 13, 9, 6, 16), -- Carrapax
(3, 11, 4, 7, 2, 13),  -- Tasarau
(4, 4, 10, 12, 3, 7), -- Magmion
(5, 5, 32, 8, 15, 20), -- Luminor
(6, 3, 25, 18, 12, 18); -- Obscurio

INSERT INTO batalla (idBatalla, nombre, lugar, ganador) VALUES
(1, 'Ruler Of Gorm', 'Llanura de Astreg', 'Luminos'), 
(2, 'Por el ojo de la vida', 'Valle del Destino', 'Hydros');

-- Batalla 1: Ruler of Gorm
INSERT INTO gormiti_batalla (idGormiti, idBatalla) VALUES
(1, 1), -- Kolossus y su batalla es Ruler of Gorm
(2, 1); -- Carrapax y su batalla es Ruler of Gorm


-- Batalla 2: Por el ojo de la vida
INSERT INTO gormiti_batalla (idGormiti, idBatalla) VALUES
(5, 2), -- Luminor y su batalla es por el ojo de la vida
(6, 2); -- Obscurio y su batalla es por el ojo de la vida

SELECT CONCAT(
  '<?xml version="1.0" encoding="UTF-8"?>',
  '\n<universoGormiti>',

  -- Tribus
  '\n  <tribus>',
  (SELECT GROUP_CONCAT(
    CONCAT(
      '\n    <tribu>',
      '\n      <nombre>', t.nombre, '</nombre>',
      '\n      <territorio>', t.territorio, '</territorio>',
      '\n      <lider>', t.lider, '</lider>',
      '\n    </tribu>'
    ) SEPARATOR ''
  ) FROM tribu t),
  '\n  </tribus>',

  -- Gormitis con estadísticas y poderes
  '\n  <gormitis>',
  (SELECT GROUP_CONCAT(
    CONCAT(
      '\n    <gormiti>',
      '\n      <nombre>', g.nombre, '</nombre>',
      '\n      <tribu>', t.nombre, '</tribu>',

      -- Estadísticas de ataque
      '\n      <estadisticas_ataque>',
      '\n        <mimetismo>', ea.mimetismo, '</mimetismo>',
      '\n        <magia>', ea.magia, '</magia>',
      '\n        <velocidad>', ea.velocidad, '</velocidad>',
      '\n        <psicopoder>', ea.psicopoder, '</psicopoder>',
      '\n      </estadisticas_ataque>',

      -- Estadísticas de defensa
      '\n      <estadisticas_defensa>',
      '\n        <mimetismo>', ed.mimetismo, '</mimetismo>',
      '\n        <magia>', ed.magia, '</magia>',
      '\n        <velocidad>', ed.velocidad, '</velocidad>',
      '\n        <psicopoder>', ed.psicopoder, '</psicopoder>',
      '\n      </estadisticas_defensa>',

      -- Poderes
      '\n      <poderes>',
      (SELECT GROUP_CONCAT(
        CONCAT('\n        <poder>', p.nombre, '</poder>')
        SEPARATOR ''
      ) FROM poder p WHERE p.idGormiti = g.idGormiti),
      '\n      </poderes>',

      '\n    </gormiti>'
    ) SEPARATOR ''
  ) FROM gormiti g
  JOIN tribu t ON g.idTribu = t.idTribu
  JOIN estadisticas_ataque ea ON g.idGormiti = ea.idGormiti
  JOIN estadisticas_defensa ed ON g.idGormiti = ed.idGormiti),
  '\n  </gormitis>',

  -- Batallas
  '\n  <batallas>',
  (SELECT GROUP_CONCAT(
    CONCAT(
      '\n    <batalla>',
      '\n      <nombre>', b.nombre, '</nombre>',
      '\n      <lugar>', b.lugar, '</lugar>',
      '\n      <ganador>', b.ganador, '</ganador>',
      '\n      <participantes>',
      (SELECT GROUP_CONCAT(
        CONCAT('\n        <gormiti>', g.nombre, '</gormiti>')
        SEPARATOR ''
      )
      FROM gormiti_batalla gb
      JOIN gormiti g ON gb.idGormiti = g.idGormiti
      WHERE gb.idBatalla = b.idBatalla),
      '\n      </participantes>',
      '\n    </batalla>'
    ) SEPARATOR ''
  ) FROM batalla b),
  '\n  </batallas>',

  '\n</universoGormiti>'
) AS xml_result;

SET SESSION group_concat_max_len = 1000000;

SELECT CONCAT(
  '<?xml version="1.0" encoding="UTF-8"?>',
  '\n<gormitis>',
  (SELECT GROUP_CONCAT(
    CONCAT(
      '\n  <gormiti>',
      '\n    <nombre>', g.nombre, '</nombre>',
      '\n    <tribu>', t.nombre, '</tribu>',

      '\n    <estadisticas_ataque>',
      '\n      <mimetismo>', ea.mimetismo, '</mimetismo>',
      '\n      <magia>', ea.magia, '</magia>',
      '\n      <velocidad>', ea.velocidad, '</velocidad>',
      '\n      <psicopoder>', ea.psicopoder, '</psicopoder>',
      '\n    </estadisticas_ataque>',

      '\n    <estadisticas_defensa>',
      '\n      <mimetismo>', ed.mimetismo, '</mimetismo>',
      '\n      <magia>', ed.magia, '</magia>',
      '\n      <velocidad>', ed.velocidad, '</velocidad>',
      '\n      <psicopoder>', ed.psicopoder, '</psicopoder>',
      '\n    </estadisticas_defensa>',

      '\n    <poderes>',
      IFNULL((SELECT GROUP_CONCAT(
        CONCAT('\n      <poder>', p.nombre, '</poder>')
      ) FROM poder p WHERE p.idGormiti = g.idGormiti), '\n      <poder>Ninguno</poder>'),
      '\n    </poderes>',

      '\n    <batallas>',
      IFNULL((SELECT GROUP_CONCAT(
        CONCAT('\n      <batalla>', b.nombre, '</batalla>')
      ) FROM gormiti_batalla gb
       JOIN batalla b ON gb.idBatalla = b.idBatalla
       WHERE gb.idGormiti = g.idGormiti), '\n      <batalla>Ninguna</batalla>'),
      '\n    </batallas>',

      '\n  </gormiti>'
    ) SEPARATOR ''
  ) FROM gormiti g
  JOIN tribu t ON g.idTribu = t.idTribu
  JOIN estadisticas_ataque ea ON g.idGormiti = ea.idGormiti
  JOIN estadisticas_defensa ed ON g.idGormiti = ed.idGormiti),
  '\n</gormitis>'
) AS xml_gormitis;
