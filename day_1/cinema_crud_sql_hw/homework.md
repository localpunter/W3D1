# SQL Homework

The local cinema are having a Marvel Movie Marathon! They have asked you to help maintain their database of movies with times and attendees.

## To access the database:

First, create a database called 'marvel'

```
# terminal
createdb marvel
```

Next, run the provided SQL script to populate your database:

```
# terminal
psql -d marvel -f marvel.sql
```

Use the supplied data as the source of data to answer the questions. Copy the SQL command you have used to get the answer, and paste it below the question, along with the result they gave.

## Questions

1.  Return ALL the data in the 'movies' table.
```sql
SELECT * FROM movies;
```

2.  Return ONLY the name column from the 'people' table
```sql
SELECT name FROM people;
```

3.  Oops! Someone at CodeClan spelled Graham's name wrong! Change it to reflect the proper spelling ('Graeme Broose' should be 'Graham Bruce').
```sql
UPDATE people
	SET
		name = 'Graham Bruce'
	WHERE
		name = 'Graeme Broose';

SELECT name FROM people;

```

4. Insert your name into the 'people' table.
```sql
INSERT INTO people (name)
	VALUES ('Alan Hunter');


SELECT name FROM people;

```
5.  Return ONLY your name from the 'people' table.
```sql
INSERT INTO people (name)
	VALUES ('Alan Hunter');

SELECT name FROM people
	WHERE name = 'Alan Hunter';

```
6.  The cinema is showing 'Batman Begins', but Batman is DC, not Marvel! Delete the entry from the 'movies' table.
```sql
DELETE FROM movies
	WHERE title = 'Batman Begins';

SELECT title FROM movies;

```
7.  Create a new entry in the 'people' table with the name of one of the instructors.
```sql
INSERT INTO people (name)
	VALUES ('Keith Douglas');

SELECT * FROM people

```
8.  Craig has decided to hijack our movie evening, Remove him from the table of people.
```sql
DELETE FROM people
	WHERE name = 'Craig Morton';

SELECT * FROM people

```
9.  The cinema has just heard that they will be holding an exclusive midnight showing of 'Avengers: Infinity War'!! Create a new entry in the 'movies' table to reflect this.
```sql
INSERT INTO movies (title, year, show_time)
	VALUES ('Avengers: Infinity War', 2018, '00:00');


SELECT * FROM movies

```
10.  The cinema would also like to make the Guardians movies a back to back feature. Find out the show time of "Guardians of the Galaxy" and set the show time of "Guardians of the Galaxy 2" to start two hours later.
```sql
SELECT show_time FROM movies
	WHERE title = 'Guardians of the Galaxy';

UPDATE movies
	SET show_time = '20:55'
	WHERE title = 'Guardians of the Galaxy 2';

SELECT * FROM movies;

```

## Extension

1.  Research how to delete multiple entries from your table in a single command.
```sql
DELETE FROM movies WHERE id IN (1,3,5);

```
