DROP PROCEDURE IF EXISTS sp_GetAbility;
GO

CREATE PROCEDURE sp_GetAbility @Known VARCHAR, @GetCount VARCHAR
AS

	IF CHARINDEX(',', @Known) > 0
	BEGIN	
		SELECT TOP @GetCount StatType
		FROM StatType
		WHERE StatType NOT IN (
			SELECT value FROM STRING_SPLIT(@Known, ',')	
			)
		ORDER BY NEWID()
	END
	
	IF CHARINDEX(',', @Known) = 0
	BEGIN		
		SELECT TOP 1 StatType
		FROM StatType
		WHERE StatType NOT LIKE @Known
		ORDER BY NEWID()
	END
	
GO;