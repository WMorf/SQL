CREATE DATABASE movieDB;

USE movieDB

	/* DROP TABLE tbl_movies, tbl_actors, tbl_directors, tbl_genre */
	/*CREATION*/

	CREATE TABLE tbl_actors (
		actor_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		actor_name VARCHAR(50) NOT NULL,
		actor_first_film VARCHAR(50) NOT NULL
	);

	CREATE TABLE tbl_directors (
		director_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		director_name VARCHAR(50) NOT NULL,
		director_first_film VARCHAR(50) NOT NULL
	);

	CREATE TABLE tbl_genre (
		genre_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		genre_name VARCHAR(50) NOT NULL,
	);

	INSERT INTO  tbl_actors
		(actor_name,actor_first_film)
		VALUES
		('Tom_Hanks','He_Knows_You''re_Alone'),
		('Tim_Allen','Tropical_Snow'),
		('John_Ratzenberger','The_Ritz'),
		('R_Lee_Ermey','The_Boys_in_Company_C'),
		('Wallace_Shawn','Manhatten')
	;

	INSERT INTO  tbl_directors
		(director_name,director_first_film)
		VALUES
		('Stanley_Kubrick','Fear_and_Desire'),
		('Rob_Reiner','Enter_Laughing'),
		('Pete_Docter','Monsters_Inc'),
		('John_Lasseter','Nightmare'),
		('Dean_Parisot','Home_Fries')
	;

	INSERT INTO  tbl_genre
		(genre_name)
		VALUES
		('Family'),
		('Comedy'),
		('Horror'),
		('Action'),
		('Drama')
	;

	SELECT * FROM tbl_actors;
	SELECT * FROM tbl_directors;
	SELECT * FROM tbl_genre;


	CREATE TABLE tbl_movies (
		movie_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		movie_name VARCHAR(50) NOT NULL,
		movie_genre INT NOT NULL CONSTRAINT fk_genre_id FOREIGN KEY REFERENCES tbl_genre(genre_id) ON UPDATE CASCADE ON DELETE CASCADE,
		movie_actor INT NOT NULL CONSTRAINT fk_actor_id FOREIGN KEY REFERENCES tbl_actors(actor_id) ON UPDATE CASCADE ON DELETE CASCADE,
		movie_director INT NOT NULL CONSTRAINT fk_director_id FOREIGN KEY REFERENCES tbl_directors(director_id) ON UPDATE CASCADE ON DELETE CASCADE
	);

	SELECT * FROM tbl_movies;

		INSERT INTO  tbl_movies
		(movie_name, movie_genre, movie_actor, movie_director)
		VALUES
		('Toy_Story', 1, 1, 4),
		('Galaxy_Quest', 2, 2, 5),
		('Monsters_Inc', 1, 3, 3),
		('Full_Metal_Jacket', 5, 4, 1),
		('Princess_Bride', 5, 5, 2)
	;

	SELECT
		a1.movie_name, a2.actor_name, a3.director_name, a4.genre_name
		FROM tbl_movies a1
		INNER JOIN tbl_actors a2 ON a2.actor_id = a1.movie_actor 
		INNER JOIN tbl_directors a3 ON a3.director_id = a1.movie_director
		INNER JOIN tbl_genre a4 ON a4.genre_id = a1.movie_genre
		WHERE genre_name = 'Drama';