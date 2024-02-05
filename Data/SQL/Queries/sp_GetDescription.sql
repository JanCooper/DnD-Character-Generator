DROP PROCEDURE IF EXISTS sp_GetDescription;
GO

CREATE PROCEDURE sp_GetDescription @Race VARCHAR
AS

	DECLARE
		@raceID AS INT,
		@bodyTypeID AS INT,
		@bodyType AS VARCHAR,
		@maxHeight AS INT,
		@minHeight AS INT,
		@maxWeight AS INT,
		@minWeight AS INT,
		@gender AS VARCHAR,
		@skinTone AS VARCHAR,
		@face AS VARCHAR,
		@eyeColorID AS INT,
		@eyeColor AS VARCHAR,
		@eyeHighlight AS VARCHAR,
		@eye AS VARCHAR,
		@eyebrow AS VARCHAR,
		@eyelash AS VARCHAR,
		@ear AS VARCHAR,
		@hairColorID AS INT,
		@hairStyle AS VARCHAR,
		@hair AS VARCHAR,
		@skin AS VARCHAR
	
	SET @raceID = (
		SELECT ID
		FROM Race
		WHERE Name = @Race
		)
	
	SELECT @bodyTypeID = 
		CASE WHEN @Race = "Elf" 
		THEN FLOOR(RAND()*(3-1+1)) + 1
		WHEN @Race = "Half-Elf"
		THEN FLOOR(RAND()*(4-1+1)) + 1
		ELSE (
			SELECT TOP 1 ID
			FROM BodyType
			ORDER BY NEWID()
		)
		END
		
	SET @bodyType = (
		SELECT BodyType
		FROM BodyType
		WHERE ID = @bodyTypeID
		)
		
	SET @gender = (
		SELECT TOP 1 Gender
		FROM Gender
		ORDER BY NEWID()
		)
		
	SELECT @skin = 
		CASE WHEN @Race = "Dragonborn"
		THEN (
			SELECT TOP 1 Tint
			FROM Tint AS T
			LEFT JOIN Races.Skin AS S ON T.ID = S.TintID
			WHERE S.RaceID = @raceID
			ORDER BY NEWID()
			)
		ELSE (	
			SELECT TOP 1 Color
			FROM Color
			WHERE C.ID = (
				SELECT TOP 1 ID
				FROM Color
				WHERE TintID IN (
					SELECT TintID
					FROM Races.Skin
					WHERE RaceID = @raceID
				) 
				ORDER BY NEWID()
			)
		END
		)
	
	SET @face = (
		SELECT Shape
		FROM Face
		WHERE ID = (
			SELECT TOP 1 ID
			FROM Races.Face
			WHERE RaceID = @raceID
			ORDER BY NEWID()
			)
		)
	
	SET @eyeColorID = (
			SELECT TOP 1 ID
			FROM Races.EyeColor
			WHERE RaceID = @raceID
			ORDER BY NEWID()
		)
		
	SET @eyeColor = (
			SELECT TOP 1 Color
			FROM Color AS C
			LEFT JOIN Tint AS T ON C.TintID = T.ID
			LEFT JOIN Races.EyeColor AS EC ON EC.TintID = T.ID
				AND C.TintID = EC.TintID
			WHERE EC.ID = @eyeColorID			
			ORDER BY NEWID()
		)			
	
	SET @eyeHighlight = (
			SELECT TOP 1 Color
			FROM Color AS C
			LEFT JOIN Tint AS T ON C.TintID = T.ID
			LEFT JOIN Races.EyeColor AS EC ON EC.HighlightID = T.ID
				AND C.TintID = EC.HighlightID
			WHERE EC.ID = @eyeColorID			
			ORDER BY NEWID()
		)			
	
	SET @eye = (
		SELECT TOP 1
			tboShape.Shape + 'shaped, '
			+ @eyeColor + ' and ' + @eyeHighlight + ' flecked eyes with '
			+ tboShape.Lid ' lids and '
			+ lash.LashLength + ', ' 
			+ lash.Thickness + ', '
			+ lash.Curl + '-curled lashes, under '
			+ brow.Thickness + ', '
			+ brow.Arch + '-arched brows.' AS EyeDescription
		FROM Races.EyeShape AS rShape
		LEFT JOIN tbo.EyeShape AS tShape ON rShape.ShapeID = tShape.ID
		LEFT JOIN tbo.Eyelash AS Lash ON rShape.LashID = Lash.ID
		LEFT JOIN tbo.Eyebrow AS Brow ON rShape.BrowID = Brow.ID
		WHERE rShape.ID = @raceID
		ORDER BY NEWID()
		)

	SET @ear = (
		SELECT TOP 1
			tbo.Tilt + ', '
			tbo.Shape + '-shaped, '
			+ tbo.Lobe + '-lobed ears.' AS EarDescription
		FROM Races.Ear AS rEar
		LEFT JOIN tbo.Ear AS tEar ON rEar.EarID = tEar.ID
		WHERE rEar.RaceID = @raceID
		ORDER BY NEWID()
	)
	
	SET @hairStyle = (
		SELECT TOP 1 Style
		FROM Races.HairStyle AS rStyle
		LEFT JOIN tbo.HairStyle as tStyle.ID = rStyle.StyleID
		WHERE RaceID = @raceID
		ORDER BY NEWID()
	)
	
	SET @hairColorID = (
		SELECT TOP 1 ID
		FROM Races.HairColor
		WHERE RaceID = @raceID
		ORDER BY NEWID()
	)
	
	SET @hairColor = (
			SELECT TOP 1 Color
			FROM Color AS C
			LEFT JOIN Tint AS T ON C.TintID = T.ID
			LEFT JOIN Races.HairColor AS rHair ON rHair.TintID = T.ID
				AND C.TintID = rHair.TintID
			WHERE rHair.ID = @hairColorID				
			ORDER BY NEWID()
		)
	)
			
	SET @hair = (
		SELECT
		@hairColor + '-tinted, with '
		+ C.Color + 'highlights' AS Hair
		FROM Color AS C
		WHERE C.ID = (
			SELECT TOP 1 ID
			FROM Color AS C				
			LEFT JOIN Tint AS T ON C.TintID = T.ID
			LEFT JOIN Races.HairColor AS rHair ON rHair.HighlightID = T.ID
				AND C.TintID = rHair.HighlightID
			WHERE rHair.ID = @hairColorID 
			ORDER BY NEWID()
		)
	)
	
	SELECT 
		(MaxHeight - MinHeight / 4) AS heightMod,
		(MaxWeight - MinWeight / 4) AS weightMod,
		(CASE
			WHEN @bodyTypeID = 1 THEN FLOOR(RAND()*(MaxHeight - (MaxHeight - heightMod)) + (MaxHeight - heightMod)
			WHEN @bodyTypeID = 2 THEN FLOOR(RAND()*((MaxHeight - heightMod / 2) - (MinHeight + heightMod) + (MinHeight + heightMod)
			WHEN @bodyTypeID = 3 THEN FLOOR(RAND()*((MaxHeight - heightMod / 2) - (MinHeight + heightMod / 2) + (MinHeight + heightMod / 2)
			ELSE FLOOR(RAND()*((MaxHeight - heightMod) - MinHeight) + MinHeight
		END) AS Height,
		(CASE
			WHEN @bodyType = 1 THEN FLOOR(RAND()*(MaxWeight - (weightMod * 2)) - (MinWeight + (weightMod / 3)) + (MinWeight + ((weightMod / 3))
			WHEN @bodyType = 2 THEN FLOOR(RAND()*(MaxWeight - (weightMod * 2)) - (MinWeight + (weightMod / 2)) + (MinWeight + (weightMod / 2)
			WHEN @bodyType = 3 THEN FLOOR(RAND()*((MaxWeight - weightMod / 2) - (MinWeight + weightMod)) + (MinWeight + weightMod)
			ELSE FLOOR(RAND()*(MaxWeight - (MinWeight + weightMod * 2)) + (MinWeight + weightMod * 2)
		END) AS Weight,
		Eye 		= @eye,
		Ear 		= @ear,
		HairStyle 	= @hairStyle,
		HairColor 	= @hair,
		SkinTone 	= @skin,
		Face 		= @face,
		Gender		= @gender
		BodyType 	= @bodyType
	FROM Race AS R
	LEFT JOIN Height AS H ON R.ID = H.RaceID
	LEFT JOIN Weight AS W ON R.ID = W.RaceID
	WHERE R.ID = @raceID

GO;