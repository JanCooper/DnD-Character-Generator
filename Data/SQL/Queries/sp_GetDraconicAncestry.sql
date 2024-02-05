DROP PROCEDURE IF EXISTS sp_GetDraconicAncestry;
GO

CREATE PROCEDURE sp_GetDraconicAncestry @Tint VARCHAR
AS

	DECLARE
		@tintID AS INT
		
	SET @tintID = (
		SELECT ID 
		FROM Tint
		WHERE Tint = @Tint
		)
	
	SELECT 
		DamageType,
		Breath,
		StatType AS SaveType
	FROM Races.Dragonborn AS D
	LEFT JOIN dbo.Tint AS T ON D.TintID = T.ID
	LEFT JOIN dbo.DamageType AS damage ON damage.ID = D.DamageTypeID
	LEFT JOIN dbo.StatType AS S ON S.ID = D.SaveTypeID
	WHERE @Tint = T.Tint
	AND D.TintID = @tintID

GO;