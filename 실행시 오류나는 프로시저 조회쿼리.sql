SET NOCOUNT ON

DECLARE @BadObjects TABLE (ALLINVALIDOBJECTS NVARCHAR(4000))
DECLARE @objname NVARCHAR(4000)
	, @cmd NVARCHAR(max)

--#################################################################################################
--Views
--#################################################################################################
DECLARE acursor CURSOR
FOR
SELECT QUOTENAME(s.name) + '.' + QUOTENAME(v.name)
FROM sys.VIEWS v
INNER JOIN sys.schemas s
	ON v.schema_id = s.schema_id

OPEN acursor

FETCH NEXT
FROM acursor
INTO @objname

WHILE @@FETCH_STATUS = 0
BEGIN
	BEGIN TRANSACTION

	BEGIN TRY
		EXEC sp_refreshview @objname
	END TRY

	BEGIN CATCH
		ROLLBACK TRANSACTION

		INSERT @BadObjects
		VALUES (@objname)
	END CATCH

	FETCH NEXT
	FROM acursor
	INTO @objname
END

CLOSE acursor

DEALLOCATE acursor

--#################################################################################################
--Procs
--#################################################################################################
DECLARE c1 CURSOR
FOR
SELECT QUOTENAME(s.name) + '.' + QUOTENAME(obs.name)
	, mods.DEFINITION
FROM sys.objects obs
INNER JOIN sys.sql_modules mods
	ON obs.object_id = mods.object_id
INNER JOIN sys.schemas s
	ON obs.schema_id = s.schema_id
WHERE obs.is_ms_shipped = 0 AND obs.type_desc IN ('SQL_STORED_PROCEDURE')

OPEN c1

FETCH NEXT
FROM c1
INTO @objname
	, @cmd

WHILE @@fetch_status <> - 1
BEGIN
	BEGIN TRANSACTION

	BEGIN TRY
		SET @cmd = REPLACE(@cmd, convert(VARCHAR(max), N'CREATE PROCEDURE'), convert(VARCHAR(max), N'ALTER PROCEDURE'))

		PRINT @cmd

		EXEC (@cmd)
	END TRY

	BEGIN CATCH
		ROLLBACK TRANSACTION

		INSERT @BadObjects
		VALUES (@objname)
	END CATCH

	FETCH NEXT
	FROM c1
	INTO @objname
		, @cmd
END --WHILE

CLOSE c1

DEALLOCATE c1

--#################################################################################################
--Functions
--#################################################################################################
DECLARE c1 CURSOR
FOR
SELECT QUOTENAME(s.name) + '.' + QUOTENAME(obs.name)
	, mods.DEFINITION
FROM sys.objects obs
INNER JOIN sys.sql_modules mods
	ON obs.object_id = mods.object_id
INNER JOIN sys.schemas s
	ON obs.schema_id = s.schema_id
WHERE obs.is_ms_shipped = 0 AND obs.type_desc IN ('AGGREGATE_FUNCTION', 'SQL_INLINE_TABLE_VALUED_FUNCTION', 'SQL_TABLE_VALUED_FUNCTION', 'SQL_SCALAR_FUNCTION'
		)

OPEN c1

FETCH NEXT
FROM c1
INTO @objname
	, @cmd

WHILE @@fetch_status <> - 1
BEGIN
	BEGIN TRANSACTION

	BEGIN TRY
		SET @cmd = REPLACE(@cmd, convert(VARCHAR(max), N'CREATE FUNCTION'), convert(VARCHAR(max), N'ALTER FUNCTION'))

		PRINT @cmd

		EXEC (@cmd)
	END TRY

	BEGIN CATCH
		ROLLBACK TRANSACTION

		INSERT @BadObjects
		VALUES (@objname)
	END CATCH

	FETCH NEXT
	FROM c1
	INTO @objname
		, @cmd
END --WHILE

CLOSE c1

DEALLOCATE c1

SELECT *
FROM @BadObjects
