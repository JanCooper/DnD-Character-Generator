DROP PROCEDURE IF EXISTS sp_GetLanguage;
GO

CREATE PROCEDURE sp_GetLanguage @Known VARCHAR
AS

	DECLARE
		@id AS INT,
		@languageData TABLE (
			ID IDENTITY(int, 1,1),
			Vernacular
		),
		@knownLanguages TABLE (
			ID IDENTITY(int, 1,1),
			Vernacular
		), 
		@vernacular AS VARCHAR,
		@languageCount AS INT
	
	IF CHARINDEX(',', @Known) > 0
	BEGIN
		SELECT Vernacular
		INTO @languageData
		FROM STRING_SPLIT(@Known, ',')
		
		SET @id = 1
		
		WHILE (@id <= COUNT(@languageData)
		BEGIN
			SET @vernacular = (
				SELECT Vernacular
				FROM @languageData
				WHERE ID = @id
				)
				
			IF @vernacular LIKE 'Choose %'
			SET @languageCount = @languageCount + SUBSTRING(@vernacular, 8, 1)
			ELSE 
			INSERT INTO @knownLanguages (Vernacular)
			VALUES(@vernacular)			
			
			@id = @id + 1
		END	
	END
	
	IF CHARINDEX(',', @Known) = 0
	BEGIN
		IF @vernacular LIKE 'Choose %'
		SET @languageCount = SUBSTRING(@vernacular, 8, 1)
	END
	
	SELECT TOP @languageCount Dialect AS Vernacular
	INTO @knownLanguages 
	FROM Dialect
	WHERE Dialect NOT IN (
		SELECT ISNULL(Vernacular, 'Nothing')
		FROM @knownLanguages
		) 
		AND Dialect != @Known
	ORDER BY NEWID()
	
	SELECT Vernacular 
	FROM @knownLanguages
GO;