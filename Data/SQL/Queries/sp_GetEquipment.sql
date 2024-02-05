DROP PROCEDURE IF EXISTS sp_GetEquipment;
GO

CREATE PROCEDURE sp_GetEquipment @Class VARCHAR, @Background VARCHAR
AS
	DECLARE
		@classEquipment TABLE(
			id IDENTITY(INT,1,1),
			Range VARCHAR
		),
		@backgroundEquipment TABLE(
			id IDENTITY(INT,1,1),
			Range VARCHAR
		),
		@classRange AS VARCHAR,
		@backgroundRange AS VARCHAR,
		@playerEquipment TABLE (
			Equipment VARCHAR
		),
		@id AS INT
		
	SET @classRange = (
		IF C1.BaseClassID IS NOT NULL
		SELECT C2.EquipmentIDs
		FROM Classes.Class AS C1
		LEFT JOIN Classes.Class AS C2 ON C1.BaseClassID = C2.ClassID
		WHERE C1.ClassName = @Class
		ELSE 
		SELECT EquipmentIDs
		FROM Class
		WHERE ClassName = @Class
		)
		
	SET @backgroundRange = (
		SELECT EquipmentIDs
		FROM backgroundEquipment AS BE
		LEFT JOIN Background AS B ON BE.BackgroundID = B.ID
		WHERE Background = @Background
		)
		
	SELECT Range
	INTO @classEquipment
	FROM STRING_SPLIT(@classRange, '')

	SELECT Range
	INTO @backgroundEquipment
	FROM STRING_SPLIT(@backgroundRange, ',')
	
	SET @id = 1
	DECLARE 
		@range AS VARCHAR

	WHILE @id <= COUNT(@classEquipment)
	BEGIN
		SET @range = (
			SELECT Range
			FROM @classEquipment
			WHERE id = @id
			)
		
		SELECT Equipment 
		FROM uf_GetItem (@range)
		INTO @playerEquipment
		
		SET @id = @id + 1
	END
	
	SET @id = 1
	
	WHILE @id <= COUNT(@backgroundEquipment)
	BEGIN
		SET @range = (
			SELECT Range
			FROM @backgroundEquipment
			WHERE id = @id
			)
			
		SELECT Equipment 
		FROM uf_GetItem (@range)
		INTO @playerEquipment
		
		SET @id = @id + 1
	END		
		
	SELECT Equipment
	FROM @PlayerEquipment
	 
GO;