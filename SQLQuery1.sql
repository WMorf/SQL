CREATE DATABASE db_zoo;

USE db_zoo;

CREATE TABLE tbl_animalia (
	animalia_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	animalia_type VARCHAR(50) NOT NULL
	);


CREATE TABLE tbl_class (
	class_id INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	class_type VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_order (
	order_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	order_type VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_care (
	care_id VARCHAR(50) PRIMARY KEY NOT NULL,
	care_type VARCHAR(50) NOT NULL,
	care_specialist INT NOT NULL
);

CREATE TABLE tbl_nutrition (
	nutrition_id INT PRIMARY KEY NOT NULL IDENTITY (2200,1),
	nutrition_type VARCHAR(50) NOT NULL,
	nutrition_cost MONEY NOT NULL
);

CREATE TABLE tbl_habitat (
	habitat_id INT PRIMARY KEY NOT NULL IDENTITY (5000,1),
	habitat_type VARCHAR(50) NOT NULL,
	habitat_cost MONEY NOT NULL
);

CREATE TABLE tbl_specialist (
	specialist_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	specialist_fname VARCHAR(50) NOT NULL,
	specialist_lname VARCHAR(50) NOT NULL,
	specialist_contact VARCHAR(50) NOT NULL,
);

CREATE TABLE tbl_species (
	species_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	species_name VARCHAR(50) NOT NULL,
	species_animalia INT NOT NULL CONSTRAINT fk_animalia_id FOREIGN KEY REFERENCES tbl_animalia(animalia_id) ON UPDATE CASCADE ON DELETE CASCADE,
	species_class INT NOT NULL CONSTRAINT fk_class_id FOREIGN KEY REFERENCES tbl_class(class_id) ON UPDATE CASCADE ON DELETE CASCADE,
	species_order INT NOT NULL CONSTRAINT fk_order_id FOREIGN KEY REFERENCES tbl_order(order_id) ON UPDATE CASCADE ON DELETE CASCADE,
	species_habitat INT NOT NULL CONSTRAINT fk_habitat_id FOREIGN KEY REFERENCES tbl_habitat(habitat_id) ON UPDATE CASCADE ON DELETE CASCADE,
	species_nutrition INT NOT NULL CONSTRAINT fk_nutrition_id FOREIGN KEY REFERENCES tbl_nutrition(nutrition_id) ON UPDATE CASCADE ON DELETE CASCADE,
	species_care VARCHAR(50) NOT NULL CONSTRAINT fk_care_id FOREIGN KEY REFERENCES tbl_care(care_id) ON UPDATE CASCADE ON DELETE CASCADE,
);

INSERT INTO tbl_species
	(species_name, species_animalia, species_class, species_order, species_habitat, species_nutrition, species_care)
	VALUES
	('brown bear',1,102,3,5007,2200,'care1'),
	('jaguar',1,102,1,5007,2200,'care4'),
	('penguin',1,100,1,5003,2200,'care6'),
	('ghost bat',1,102,1,5007,2204,'care2'),
	('chicken',1,100,3,5001,2205,'care0'),
	('panda',1,102,3,5006,2202,'care4'),
	('bobcat',1,102,1,5001,2204,'care5'),
	('grey wolf',1,102,1,5000,2201,'care4')
;

INSERT INTO tbl_nutrition
	(nutrition_type, nutrition_cost)
	VALUES
	('raw fish', 1500),
	('living rodents', 600),
	('mixture of fruit and rice', 800),
	('warm bottle of milk', 600),
	('syringe fed broth',600),
	('lard and seed mix',300),
	('aphids',150),
	('vitamins and marrow',3500)
;

INSERT INTO tbl_habitat
	(habitat_type, habitat_cost)
	VALUES
	('tundra', 40000),
	('grassy knoll with trees', 12000),
	('10 ft pond and rocks', 30000),
	('icy aquarium with snowy facade', 50000),
	('short grass, shade and moat', 50000),
	('netted forest atrium', 10000),
	('jungle vines and winding branches', 15000),
	('cliff and shaded cave', 15000)
;

INSERT INTO tbl_specialist
	(specialist_fname, specialist_lname, specialist_contact)
	VALUES
	('Frank','Red', '555-555-5555'),
	('Hrank','Blue', '555-555-5554'),
	('Tank','Green', '555-555-5553'),
	('Spank','Yellow', '555-555-5552'),
	('Rank','Purple', '555-555-5551')
;

INSERT INTO  tbl_animalia
	(animalia_type)
	VALUES
	('vertebrate'),
	('invertebrate')
;

INSERT INTO tbl_class
	(class_type)
	VALUES
	('birds'),
	('reptillian'),
	('mammal'),
	('anthropod'),
	('fish'),
	('worm')
;

INSERT INTO  tbl_order
	(order_type)
	VALUES
	('carnivore'),
	('omnivore'),
	('herbivore')
;

INSERT INTO tbl_care
	(care_id, care_type, care_specialist)
	VALUES
	('care0', 'replace the straw', 1),
	('care1', 'repair broken toys', 4),
	('care2', 'bottle feed vitamins', 1),
	('care3', 'human contact_pet subject', 2),
	('care4', 'clean up animal waste', 1),
	('care5', 'move subject to excercise pen', 3),
	('care6', 'drain and refill aquarium', 1),
	('care7', 'extensive dental work', 3)
;

SELECT * FROM tbl_species;
SELECT * FROM tbl_nutrition;
SELECT * FROM tbl_habitat;
SELECT * FROM tbl_specialist;
SELECT * FROM tbl_care;

/* Part 6 */

SELECT * FROM tbl_species WHERE species_name = 'chicken';

SELECT
	a1.species_name, a2.animalia_type,
	a3.class_type, a4.order_type, a5.habitat_type,
	a6.nutrition_type, a7.care_type
	FROM tbl_species a1
	INNER JOIN tbl_animalia a2 ON a2.animalia_id = a1.species_animalia
	INNER JOIN tbl_class a3 ON a3.class_id = a1.species_class
	INNER JOIN tbl_order a4 ON a4.order_id = a1.species_order
	INNER JOIN tbl_habitat a5 ON a5.habitat_id = a1.species_habitat
	INNER JOIN tbl_nutrition a6 ON a6.nutrition_id = a1.species_nutrition
	INNER JOIN tbl_care a7 ON a7.care_id = a1.species_care
	WHERE species_name = 'brown bear'
;

SELECT
	a1.species_name, a2.habitat_type, a2.habitat_cost,
	a3.nutrition_type, a3.nutrition_cost
	FROM tbl_species a1
	INNER JOIN tbl_habitat a2 ON a2.habitat_id = a1.species_habitat
	INNER JOIN tbl_nutrition a3 ON a3.nutrition_id = a1.species_nutrition
	WHERE species_name = 'ghost bat'
;


SELECT * FROM tbl_nutrition
INNER JOIN tbl_species ON tbl_species.species_nutrition = tbl_nutrition.nutrition_id;


/* PART 7 */

DROP TABLE tbl_species, tbl_animalia, tbl_care, tbl_habitat, tbl_nutrition, tbl_order, tbl_specialist;

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES tbl_species)
	DROP TABLE tbl_species, tbl_animala, tbl_care, tbl_class, tbl_habitat, tbl_nutrition, tbl_order, tbl_specialist;

PRINT 'HELLO WORLD'

DECLARE @myVariable INT
SET @myVariable = 6
PRINT @myVariable

DECLARE @var1 INT, @var2 INT
SET @var1 = 3
SET @var2 = 5

PRINT 'Having fun with' + ' TSQL and MS SQL SERVER'

PRINT 'I have ' + CONVERT(VARCHAR(50), @var1) + ' dollars...'



/* PART 8 */
/*DECLARE @var1 INT, @var2 INT*/

SET @var1 = 3
SET @var2 = 5

PRINT CHAR(9) + 'I have' + CONVERT(VARCHAR(50), @var1) + CHAR(13) +' dollars...'

PRINT 'Variable 1 = ' + CONVERT(VARCHAR(5), @var1) + CHAR(13) + 'Variable 2 = ' + CONVERT(VARCHAR(5), @var2)

PRINT 'Variable 1 = ' + CONVERT(VARCHAR(5), @var1) + CHAR(13) + 'Variable 2 = ' + CONVERT(VARCHAR(5), @var2) + CHAR(13) + 'Total: '
PRINT @var1 + @var2

IF @var1 <= 3
	BEGIN
		PRINT 'Variable 1 <= ' + CONVERT(VARCHAR(5), @var1) + CHAR(13)
	END
ELSE
	BEGIN
		PRINT 'Variable 1 is not < ' + CONVERT(VARCHAR(5), @var1) + CHAR(13)
	END

	IF @var1 != 3
	BEGIN
		PRINT 'Variable 1 is NOT ' + CONVERT(VARCHAR(5), @var1) + CHAR(13)
	END
ELSE
	BEGIN
		PRINT 'Variable 1 is not < ' + CONVERT(VARCHAR(5), @var1) + CHAR(13)
	END