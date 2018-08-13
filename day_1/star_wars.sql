DROP TABLE lightsabers;
DROP TABLE characters;

CREATE TABLE characters (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  darkside BOOLEAN NOT NULL,
  age INT NOT NULL
);

CREATE TABLE lightsabers (
  id SERIAL8 PRIMARY KEY,
  colour VARCHAR(255) NOT NULL,
  hilt_metal VARCHAR(255) NOT NULL,
  character_id INT8 REFERENCES characters(id)
);



INSERT INTO characters (name, darkside, age)
  VALUES ('Obi-Wan Kenobi', false, 150);

INSERT INTO characters (name, darkside, age)
  VALUES ('Anakin Skywalker', false, 19);

INSERT INTO characters (name, darkside, age)
  VALUES ('Darth Maul', true, 32);

INSERT INTO characters (name, darkside, age)
  VALUES ('Yoda', false, 900);

INSERT INTO characters (name, darkside, age)
  VALUES ('Stormtrooper', true, 25);

INSERT INTO characters (name, darkside, age)
  VALUES ('Stormtrooper', true, 25);

INSERT INTO characters (name, darkside, age)
  VALUES ('Stormtrooper', true, 25);

INSERT INTO characters (name, darkside, age)
  VALUES ('Stormtrooper', true, 25);

INSERT INTO characters (name, darkside, age)
  VALUES ('Stormtrooper', true, 25);

INSERT INTO lightsabers (colour, hilt_metal, character_id)
  VALUES ('green', 'Tungsten Carbide', 4);

INSERT INTO lightsabers (colour, hilt_metal, character_id)
  VALUES ('red', 'Steel', 3);

INSERT INTO lightsabers (colour, hilt_metal, character_id)
  VALUES ('blue', 'Wood', 2);

  INSERT INTO lightsabers (colour, hilt_metal, character_id)
    VALUES ('orange', 'ceramic', 2);



UPDATE characters
  SET
    darkside = true,
    name = 'Darth Vader'
  WHERE name = 'Anakin Skywalker';

UPDATE characters
  SET
    name = 'Old Ben Kenobi', age = 200
  WHERE
    name = 'Obi-Wan Kenobi';

UPDATE characters
  SET age = 26
  WHERE id = 5;

-- DELETE FROM characters
--   WHERE name = 'Darth Maul'
--   AND age = 32; -- OR could be used here as well

SELECT * FROM characters
  ORDER BY id;

SELECT * FROM lightsabers;

-- SELECT MIN(age) FROM characters;
-- SELECT MAX(age) FROM characters;
-- SELECT SUM(age) FROM characters;
-- SELECT * FROM characters
--   ORDER BY name DESC
--   LIMIT 2;
