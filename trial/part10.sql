

/* PART 10 */

DECLARE @animalName VARCHAR(50)
DECLARE @errorString VARCHAR(100)
DECLARE @results AS VARCHAR(5)

SET @animalName = 'jaguar'
SET @errorString = 'There are no ' + @animalName + '''s found at this zoo.'

BEGIN TRY
	SET @results = (SELECT COUNT(tbl_species.species_name) FROM tbl_species WHERE species_name = @animalName)
	IF @results = 0
		BEGIN
			RAISERROR(@errorString, 16, 1)
			RETURN
		END
	ELSE IF @results = 1
		BEGIN
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
			WHERE a1.species_name = @animalName
		END
END TRY

BEGIN CATCH
	SELECT @errorString = ERROR_MESSAGE()
	RAISERROR (@errorString, 10, 1)
END CATCH

USE [db_zooTest2]
GO
/**/
SET ANSI_NULL ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[getANIMAL_INFO]

@animalName VARCHAR(50)
AS
BEGIN
	DECLARE @errorString VARCHAR (100)
	DECLARE @results AS VARCHAR(5)
	SET @errorString = 'There are no' + @animalName + '''s found at this zoo'

	BEGIN TRY
		SET @results = (SELECT COUNT(tbl_species.species_name) FROM tbl_species WHERE species_name = @animalName)
		IF @results = 0
			BEGIN
				RAISERROR(@errorString, 16, 1)
				RETURN
			END
		ELSE IF @results = 1
			BEGIN
				SELECT
				a1.species_name, a2.animalia_type,
				a3.class_type, a4.order_type, a5.habitat_type,
				a6.nutrition_type, a7.care_type
				FROM tbl_species a1
				INNER JOIN tbl_animalia a2 ON a2.animalia_id = a1.species_animalia
				INNER JOIN tbl_animalia a3 ON a3.class_id = a1.species_class
				INNER JOIN tbl_animalia a4 ON a4.order_id = a1.species_order
				INNER JOIN tbl_animalia a5 ON a5.habitat_id = a1.species_habitat
				INNER JOIN tbl_animalia a6 ON a6.nutrition_id = a1.species_nutrition
				INNER JOIN tbl_animalia a7 ON a7.care_id = a1.species_care
				WHERE species_name = @animalName
				;
			END
		END TRY

		BEGIN CATCH
			SELECT @errorString, 10, 1)
		END CATCH
	END

USE db_zooClean

GO

/* CONVERT(VARCHAR(50), @totalHAB) = This is converting the data from MONEY to VARCHAR
 * CHAR(13) = Line Break
 * CHAR(9) = TAB KEY */

 DECLARE @totalHab MONEY;
 DECLARE @totalNut MONEY;
 DECLARE @results MONEY;

 SET @totalHab = (SELECT SUM(habitat_cost) FROM tbl_habitat);
 SET @totalNut = (SELECT SUM(nutrition_cost) FROM tbl_nutrition);
 SET @results = (@totalHab + @totalNut);

 PRINT (
	CONVERT(VARCHAR(50), @totalHab) + CHAR(9) + ' - The Total Habitat Cost' + CHAR(13) +
	CONVERT(VARCHAR(50), @totalNut) + CHAR(9) + CHAR(9) + ' - The Total NUtrition Cost' + CHAR(13) + '-----------' +CHAR(13) +
	CONVERT(VARCHAR(50), @results)
);