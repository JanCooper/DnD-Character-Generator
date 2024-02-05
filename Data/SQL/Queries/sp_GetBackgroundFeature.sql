DROP PROCEDURE IF EXISTS sp_GetBackgroundFeature;
GO

CREATE PROCEDURE sp_GetBackgroundFeature @Background VARCHAR
AS
	
	SELECT Feature
	FROM BackgroundFeature AS BF
	LEFT JOIN Background AS B ON B.ID = BF.BackgroundID
	LEFT JOIN Feature AS F ON F.ID = BF.FeatureID
	WHERE Background = @Background

GO;