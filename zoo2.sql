/* PART 9 */

CREATE DATABASE db_zooTest2
GO
USE db_zooTest2

CREATE PROCEDURE createZooDB
AS
BEGIN

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
		care_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		care_type VARCHAR(50) NOT NULL,
		care_specialist INT NOT NULL
	);