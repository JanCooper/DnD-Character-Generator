DROP PROCEDURE IF EXISTS sp_GetRacialSpecificName;
GO

CREATE PROCEDURE sp_GetRacialSpecificName @Race VARCHAR, @Gender VARCHAR
AS

	DECLARE
		@raceID AS INT,
		@genderID AS INT, 
		@firstName AS VARCHAR,
		@lastName AS VARCHAR
	
	SET @raceID = (
			SELECT ID
			FROM Race
			WHERE Name = @Race
		)
		
	SET @genderID = (
		SELECT ID 
		FROM Gender
		WHERE Gender = @Gender
		)
	
	SET @firstName = (
			SELECT TOP 1 ID
			FROM Name
			WHERE TypeID = 1
				AND GenderID = @genderID
				AND RaceID = @raceID
			ORDER BY NEWID()
		)
		
	SET @lastName = (
			SELECT TOP 1 ID
			FROM Name
			WHERE TypeID = 2
				AND GenderID = @genderID
				AND RaceID = @raceID
			ORDER BY NEWID()
		)
		
	
	SELECT CONCAT(@firstName, ' ', @lastName)
GO;