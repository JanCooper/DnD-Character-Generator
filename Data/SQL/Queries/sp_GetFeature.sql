DROP PROCEDURE IF EXISTS sp_GetFeature;
GO

CREATE PROCEDURE sp_GetFeature @Category VARCHAR, @Compare VARCHAR, @Lvl INT = NULL
AS
	IF @Category LIKE 'Background'
	
		SELECT Feature
		FROM BackgroundFeature AS BF
		LEFT JOIN Background AS B ON BF.BackgroundID = B.ID
		LEFT JOIN Feature AS F ON BF.FeatureID = F.ID
		WHERE Background = @Compare
		
	ELSE IF @Category LIKE 'Class'
	
		SELECT Feature
		FROM Classes.Feature AS CF
		LEFT JOIN Class AS C ON BF.ClassID = C.ID
		LEFT JOIN Feature AS F ON CF.FeatureID = F.ID
		WHERE Class = @Compare
		AND Lvl = @Lvl
GO;