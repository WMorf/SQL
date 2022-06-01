



UPDATE tbl_class SET class_type = 'bird' WHERE class_type = 'birds';

SELECT REPLACE(class_type, 'birds', 'bird') FROM tbl_class

SELECT UPPER(class_type) FROM tbl_class WHERE class_type = 'bird';

CREATE TABLE tbl_persons (
	persons_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	persons_fname VARCHAR(50) NOT NULL,
	persons_lname VARCHAR(50) NOT NULL,
	persons_contact VARCHAR(50) NOT NULL
);

INSERT INTO tbl_persons
	(persons_fname,persons_lname,persons_contact)
	VALUES
	('Bob','Smith','555-555-8790'),
	('Sally','Smith','575-555-8790'),
	('Hank','Blue','555-555-8790'),
	('Tom','Burt','555-555-8791'),
	('Bob','Mackey','555-535-8790')
;

SELECT * FROM tbl_persons;

SELECT persons_fname, persons_lname, persons_contact FROM tbl_persons WHERE persons_id BETWEEN 3 AND 5;

SELECT persons_fname, persons_lname, persons_contact FROM tbl_persons WHERE persons_lname LIKE 'sm%';

SELECT persons_fname, persons_lname, persons_contact FROM tbl_persons WHERE persons_lname LIKE '_a%';

UPDATE tbl_persons SET persons_fname = 'Mars' WHERE persons_fname = 'bob';

SELECT persons_fname AS 'FirstName', persons_lname AS 'LastName', persons_contact AS 'Phone' FROM tbl_persons WHERE persons_fname LIKE 'm%' ORDER BY persons_lname;

DELETE FROM tbl_persons WHERE persons_lname = 'burt';

DELETE FROM tbl_order, tbl_care, tbl_habitat, tbl_nutrition, tbl_animalia, tbl_specialist, tbl_persons, tbl_class, tbl_species
DROP TABLE tbl_order, tbl_care, tbl_habitat, tbl_nutrition, tbl_animalia, tbl_specialist, tbl_persons, tbl_class, tbl_species