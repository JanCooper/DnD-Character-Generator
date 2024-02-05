DROP PROCEDURE IF EXISTS sp_GetToolProficiencyRange;
GO

CREATE PROCEDURE sp_GetToolProficiencyRange @TableOption VARCHAR, @TypeOption VARCHAR
AS
	DECLARE
		@Tools TABLE(
			Count INT,
			Range VARCHAR
		),
		@baseClassID INT
		
	SET @baseClassID = (
			SELECT BaseClassID
			FROM Classes.Class
			WHERE Class = @TypeOption
			)
		
	IF @TableOption = 'Background'
		SELECT 
			ToolCount, 
			ToolTypeIDs
		INTO @Tools
		FROM Background
		WHERE Background = @TypeOption
		
	IF @TableOption = 'Class' 
		AND @baseClassID IS NOT NULL
			
		SELECT 
			C1.ToolCount + C2.ToolCount AS ToolCount, 
			C1.ToolTypeIDs + C2.ToolTypeIDs
		INTO @Tools
		FROM Classes.Class AS C1
		LEFT JOIN Classes.Class AS C2 ON C1.BaseClassID = C2.ID
		WHERE C1.Class = @TypeOption 
		
	IF @TableOption = 'Class'
		AND @baseClassID IS NULL
		
		SELECT 
			ToolCount,
			ToolTypeIDs
		INTO @Tools
		FROM Classes.Class
		WHERE Class = @TypeOption
		
		SELECT *
		FROM @Tools		
GO;