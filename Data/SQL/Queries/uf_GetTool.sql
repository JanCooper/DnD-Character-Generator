IF OBJECT_ID (N'dbo.uf_GetTool', N'FN') IS NOT NULL  
    DROP FUNCTION uf_GetTool;  
GO  
CREATE FUNCTION dbo.uf_GetTool(@ToolIDRange VARCHAR, @ToolCount INT = NULL)  
RETURNS TABLE   
AS   
-- Returns Tool based on ID or range of IDs.  
BEGIN  
	DECLARE 
		@tools TABLE (
			id IDENTITY(INT,1,1),
			Tool VARCHAR
		),
		@choice VARCHAR = NULL,
		@id INT = 1
		
	IF @ToolIDRange LIKE '%..%'
	BEGIN
		IF @ToolCount IS NULL
		SET @choice = (
			SELECT TOP 1
			FROM STRING_SPLIT(@ToolIDRange, '..')
			ORDER BY NEWID()
			)
			
		IF @ToolCount IS NOT NULL
		SELECT TOP @ToolCount Tool
		INTO @tools
		FROM Tool
		WHERE ID IN (
			SELECT Value
			FROM STRING_SPLIT(@ToolIDRange, '..')
			ORDER BY NEWID()
			)
	END
	
	IF @choice LIKE '%&%'
	BEGIN
		SELECT Value
		FROM STRING_SPLIT(@choice,'&')
	
		WHILE @id <= COUNT(Value)
		BEGIN
			SELECT Tool
			INTO @tools
			FROM Tool
			WHERE ID = @id
		END
	END
	
	ELSE IF @choice = NULL
		SET @choice = @ToolIDRange
	
	SELECT Tool
	INTO @tools
	FROM Tool
	WHERE ID = @choice	
		
    RETURN @tools;  
END; 