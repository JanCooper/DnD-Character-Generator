IF OBJECT_ID (N'dbo.uf_GetEquipment', N'FN') IS NOT NULL  
    DROP FUNCTION uf_GetEquipment;  
GO  
CREATE FUNCTION dbo.uf_GetEquipment(@EquipmentRange VARCHAR)  
RETURNS TABLE   
AS   
-- Returns equipment based on ID or range of IDs.  
BEGIN  
		DECLARE 
			@returnEquipment TABLE (
				id IDENTITY(INT,1,1),
				Equipment VARCHAR
			),
			@choice VARCHAR = NULL,
			@id INT = 1
		
		IF @EquipmentRange LIKE '%..%'
		BEGIN
			SET @choice = (
				SELECT TOP 1
				FROM STRING_SPLIT(@EquipmentRange, '..')
				ORDER BY NEWID()
				)
		END
		
		ELSE IF @choice LIKE '%&%'
		BEGIN
			SELECT Value
			FROM STRING_SPLIT(@choice,'&')
		
			WHILE @id <= COUNT(Value)
			BEGIN
				SELECT Equipment
				INTO @returnEquipment
				FROM Equipment
				WHERE ID = @id
			END
		END
		
		ELSE IF @choice = NULL
			SET @choice = @EquipmentRange
			
		SELECT Equipment
		INTO @returnEquipment
		FROM Equipment
		WHERE ID = @choice	
		
    RETURN @returnEquipment;  
END; 