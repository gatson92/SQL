DECLARE @DB_NAME VARCHAR(100) = 'WOORIM_230215'

BEGIN
        DECLARE @SQL    VARCHAR(MAX)          

        --SP INS                      
        DECLARE @NAME   VARCHAR(1000)                        
        DECLARE c CURSOR FOR
        SELECT Definition,NAME
        FROM WOORIM_220901.[sys].[procedures] p
        INNER JOIN WOORIM_220901.sys.sql_modules m ON p.object_id = m.object_id
		AND NAME IN ('TEST_PROC_MOVE')
        OPEN c
        FETCH NEXT FROM c INTO @sql,@NAME

        WHILE @@FETCH_STATUS = 0
        BEGIN
               SET @sql = REPLACE(@sql,'''','''''')
               SET @sql = 'USE '+@DB_NAME+'; EXEC(''' + @sql + ''')'

               EXEC (@sql)
               FETCH NEXT FROM c INTO @sql,@NAME
        END            

		CLOSE c
        DEALLOCATE c
END



--삭제필요 시 

CREATE PROC [dbo].[COPY_SP]
        @DB_NAME VARCHAR(100)
AS
BEGIN
        DECLARE @SQL    VARCHAR(MAX)          

        --SP 삭제      
        SET @SQL ='      DECLARE @SQL    VARCHAR(MAX)
                       DECLARE b CURSOR FOR
                       SELECT ''DROP PROC DBO.'' + P.NAME
                       FROM '+@DB_NAME+'.[sys].[procedures] p
                       INNER JOIN '+@DB_NAME+'.sys.sql_modules m ON p.object_id = m.object_id
                       
                       OPEN b
                       FETCH NEXT FROM b INTO @sql 

                       WHILE @@FETCH_STATUS = 0
                       BEGIN
                              SET @sql = REPLACE(@sql,'''''''','''''''''''')
                              SET @sql = ''USE '+@DB_NAME+'; EXEC(''''''+@sql+'''''')''
                              EXEC (@sql)

                              FETCH NEXT FROM b INTO @sql
                       END             

                       CLOSE b
                       DEALLOCATE b
                       '
        --PRINT @SQL
        EXEC(@SQL)
 
        --SP INS                      
        DECLARE @NAME   VARCHAR(1000)                        
        DECLARE c CURSOR FOR
        SELECT Definition,NAME
        FROM [sys].[procedures] p
        INNER JOIN sys.sql_modules m ON p.object_id = m.object_id
        OPEN c
        FETCH NEXT FROM c INTO @sql,@NAME

        WHILE @@FETCH_STATUS = 0
        BEGIN
               SET @sql = REPLACE(@sql,'''','''''')
               SET @sql = 'USE '+@DB_NAME+'; EXEC(''' + @sql + ''')'

               EXEC (@sql)
               FETCH NEXT FROM c INTO @sql,@NAME
        END            

		CLOSE c
        DEALLOCATE c
END


