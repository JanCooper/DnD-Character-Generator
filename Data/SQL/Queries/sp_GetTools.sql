DROP PROCEDURE IF EXISTS sp_GetTools;
GO

CREATE PROCEDURE sp_GetTools @ToolCount INT, @ToolRanges VARCHAR
AS
	DECLARE
		@ranges TABLE (
			ID IDENTITY(INT,1,1),
			Ranges VARCHAR
		),
		@id AS INT,
		@selectFrom VARCHAR,
		@playerTool TABLE (
			Tool VARCHAR
		),
		
	
	SELECT Range
	INTO @ranges
	FROM STRING_SPLIT(@ToolRanges, '')
	
	SET @id = 1

	WHILE @id <= COUNT(@ranges)
	BEGIN
		SET @selectFrom = (
			SELECT Range
			FROM @ranges
			WHERE id = @id
			)
	
		IF COUNT(@ranges) = @ToolCount
		SELECT Tool
		INTO @playerTool
		FROM uf_GetTool (@range)

		
		IF COUNT(@ranges) != @ToolCount
		SELECT Tool
		INTO @playerTool
		FROM uf_GetTool (@range, @ToolCount)
		
		SET @id = @id + 1
	END
	
	SELECT Tool
	FROM @PlayerTool
	 
GO;