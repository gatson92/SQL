

-- 성공여부
DECLARE @ERROR_CD VARCHAR(10),
		@ERROR_MESSAGE VARCHAR(MAX)

SELECT	@ERROR_CD = 0, @ERROR_MESSAGE = ''



-- 오류 코드가 있는 UPLOAD 항목이 존재하면... 
		IF EXISTS (SELECT * FROM @TMP_TBL WHERE ISNULL(ERROR_CD, '') != '') 
			BEGIN 
				SELECT @ERROR_CD = '50001'
					 , @ERROR_MESSAGE = '오류가 발생한 항목이 존재합니다. 업로드 데이터를 다시 확인해주시기 바랍니다.' 
			END
			
				SELECT	@ERROR_CD		AS ERROR_CD, 
						@ERROR_MESSAGE	AS ERROR_MESSAGE
			
			
			
			END TRY 
			BEGIN CATCH 
					
				PRINT ERROR_PROCEDURE() + CHAR(13) + CHAR(10)   
			        + 'LINE : '   
			        + CONVERT(VARCHAR(3), ERROR_LINE())   
			   
			    -- 트랜잭션 상태 확인 
				--  1 : 트랜잭션 활성 (커밋 가능)
				--  0 : 트랜잭션 비활성 
				-- -1 : 트랜잭션 활성 (커밋 불가능)
			    IF XACT_STATE() <> 0 ROLLBACK TRAN;     
			
			    SET @ERROR_CD = IIF(ISNULL(ERROR_NUMBER(), 0) = 0, -1, ERROR_NUMBER()) 
				SET @ERROR_MESSAGE = (SELECT TEXT FROM sys.messages WHERE language_id = 1042 AND message_id = @ERROR_CD)
			
			    PRINT ERROR_NUMBER(); 
			    PRINT ERROR_MESSAGE()   
			
				SELECT @ERROR_CD AS ERROR_CD
					 , @ERROR_MESSAGE AS ERROR_MESSAGE
			
END CATCH 