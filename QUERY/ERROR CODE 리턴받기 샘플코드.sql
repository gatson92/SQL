

-- ��������
DECLARE @ERROR_CD VARCHAR(10),
		@ERROR_MESSAGE VARCHAR(MAX)

SELECT	@ERROR_CD = 0, @ERROR_MESSAGE = ''



-- ���� �ڵ尡 �ִ� UPLOAD �׸��� �����ϸ�... 
		IF EXISTS (SELECT * FROM @TMP_TBL WHERE ISNULL(ERROR_CD, '') != '') 
			BEGIN 
				SELECT @ERROR_CD = '50001'
					 , @ERROR_MESSAGE = '������ �߻��� �׸��� �����մϴ�. ���ε� �����͸� �ٽ� Ȯ�����ֽñ� �ٶ��ϴ�.' 
			END
			
				SELECT	@ERROR_CD		AS ERROR_CD, 
						@ERROR_MESSAGE	AS ERROR_MESSAGE
			
			
			
			END TRY 
			BEGIN CATCH 
					
				PRINT ERROR_PROCEDURE() + CHAR(13) + CHAR(10)   
			        + 'LINE : '   
			        + CONVERT(VARCHAR(3), ERROR_LINE())   
			   
			    -- Ʈ����� ���� Ȯ�� 
				--  1 : Ʈ����� Ȱ�� (Ŀ�� ����)
				--  0 : Ʈ����� ��Ȱ�� 
				-- -1 : Ʈ����� Ȱ�� (Ŀ�� �Ұ���)
			    IF XACT_STATE() <> 0 ROLLBACK TRAN;     
			
			    SET @ERROR_CD = IIF(ISNULL(ERROR_NUMBER(), 0) = 0, -1, ERROR_NUMBER()) 
				SET @ERROR_MESSAGE = (SELECT TEXT FROM sys.messages WHERE language_id = 1042 AND message_id = @ERROR_CD)
			
			    PRINT ERROR_NUMBER(); 
			    PRINT ERROR_MESSAGE()   
			
				SELECT @ERROR_CD AS ERROR_CD
					 , @ERROR_MESSAGE AS ERROR_MESSAGE
			
END CATCH 