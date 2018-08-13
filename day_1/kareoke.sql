DROP TABLE guests;
DROP TABLE songs;
DROP TABLE rooms;

CREATE TABLE rooms (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE songs (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  artist VARCHAR(255) NOT NULL,
  room_id INT8 REFERENCES rooms(id)
);

CREATE TABLE guests (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  age INT,
  favsong_id INT8 REFERENCES songs(id),
  room_id INT8 REFERENCES rooms(id)
);




INSERT INTO rooms (name)
VALUES ('Indie Room');

INSERT INTO songs (name, artist, room_id)
  VALUES ('Song 2', 'Blur', 1);

INSERT INTO songs (name, artist, room_id)
  VALUES ('Waterfall', 'Stone Roses', 1);

INSERT INTO guests (name, age, favsong_id, room_id)
  VALUES ('Ian Brown', 45, 1, 1);

INSERT INTO guests (name, age, favsong_id, room_id)
  VALUES ('Damien Alburn', 43, 2, 1);




SELECT * FROM rooms;
SELECT * FROM guests;
SELECT * FROM songs;
