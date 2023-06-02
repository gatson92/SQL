USE [WOORIM_230215]
GO
/****** Object:  Table [dbo].[BATCH_HIS]    Script Date: 2023-06-01 ���� 12:02:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- DROP TABLE BATCH_HIS 
CREATE TABLE [DBO].[BATCH_HIS](
	[SEQ]					[INT] IDENTITY(1,1)	NOT NULL PRIMARY KEY,
	[NAME]					[VARCHAR](100)		NULL,
	[CONTENT]				[VARCHAR](2000)		NULL,
	[START_DATE]			[DATETIME]			NULL,
	[END_DATE]				[DATETIME]			NULL,
	[SUCC_YN]				[CHAR](1)			NULL,
	[FAIL_RSN]				[VARCHAR](2000)		NULL,
	[DESC]					[VARCHAR](2000)		NULL
 
) ON [PRIMARY]
GO


EXEC SP_ADDEXTENDEDPROPERTY 'MS_Description', '���ν��� ��',		'USER', dbo, 'TABLE', BATCH_HIS, 'COLUMN', [NAME];
EXEC SP_ADDEXTENDEDPROPERTY 'MS_Description', '���ν��� ����',		'USER', dbo, 'TABLE', BATCH_HIS, 'COLUMN', [CONTENT];
EXEC SP_ADDEXTENDEDPROPERTY 'MS_Description', 'BATCH �����Ͻ�',		'USER', dbo, 'TABLE', BATCH_HIS, 'COLUMN', [START_DATE];
EXEC SP_ADDEXTENDEDPROPERTY 'MS_Description', 'BATCH �����Ͻ�',		'USER', dbo, 'TABLE', BATCH_HIS, 'COLUMN', [END_DATE];
EXEC SP_ADDEXTENDEDPROPERTY 'MS_Description', '��������',			'USER', dbo, 'TABLE', BATCH_HIS, 'COLUMN', [SUCC_YN];
EXEC SP_ADDEXTENDEDPROPERTY 'MS_Description', '���л���',			'USER', dbo, 'TABLE', BATCH_HIS, 'COLUMN', [FAIL_RSN];
EXEC SP_ADDEXTENDEDPROPERTY 'MS_Description', '���',				'USER', dbo, 'TABLE', BATCH_HIS, 'COLUMN', [DESC];


/*
	�� 1. ���ν����� ���� ��������  

	-- ##1. ��ġ ���Ժ�
	DECLARE @PROC_NM		VARCHAR(100),
			@CONTENT		VARCHAR(2000),
			@START_DATE		DATETIME,
			@SUCC_YN		CHAR(1),
			@DESC			VARCHAR(2000)

	 SELECT @PROC_NM	= 'LEADER_PRODUCT_IF_SYNC',
			@CONTENT	= '�ڻ�� ���������� ����ȭ',
			@START_DATE = GETDATE(),
			@SUCC_YN	= 'N'

	-- ##2. ��ġ ���� ���� 
	SET @SUCC_YN = 'Y'

	-- ##3. ��ġ ���� ����
	EXEC BATCH_HIS_INSERT @PROC_NM, @CONTENT, @START_DATE, @SUCC_YN, @ERROR_MSG



	�� 2. ���� ���ν��� �ҽ� 


	USE WOORIM_230215
	GO
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO

	ALTER PROC [dbo].[BATCH_HIS_INSERT]
		@NAME			VARCHAR(100)	= '',
		@CONTENT		VARCHAR(2000)	= '',
		@START_DATE		DATETIME,
		@SUCC_YN		CHAR(1)			= '',
		@FAIL_RSN		VARCHAR(2000)	= '',
		@DESC			VARCHAR(2000)	= ''
	AS
	/******************************************************************************
	** File:
	** Name: BATCH_HIS_INSERT
	**
	** Desc: BATCH �̷� INSERT 
	**
	** EXEC dbo.BATCH_HIS_INSERT 
	**
	** This template can be customized:
	**
	** Called by: 
	**
	** Parameters:
	** Input Output
	** ---------- -----------
	**
	** Auth: �̻���
	** Date: 2023.06.01
	*******************************************************************************
	** Change History
	*******************************************************************************
	** Date:		Author:	Description:
	** ---------	------	-----------------
	*******************************************************************************/
	SET NOCOUNT ON

	DECLARE @RGT_ID			VARCHAR(10),
		
			@ERROR_PROC		VARCHAR(100) = '',
			@ERROR_MSG		VARCHAR(MAX) = '',
			@ERROR_TRACE	VARCHAR(MAX) = ''

		SET @RGT_ID = 'BATCH'

	BEGIN TRY
		-- �� ��ǰ ���� SYNC
		BEGIN 
			BEGIN TRY

				 IF(ISNULL(@START_DATE,'') = '') SET @START_DATE = GETDATE()

				 INSERT INTO BATCH_HIS  
				  (  
					[NAME],
					[CONTENT],
					[START_DATE],
					[END_DATE],
					[SUCC_YN],
					[FAIL_RSN],
					[DESC]
				  )  
				 VALUES  
				  (  
					@NAME,
					@CONTENT,
					@START_DATE,
					GETDATE(),
					@SUCC_YN,
					@FAIL_RSN,
					@DESC 
				  )  
			
			END TRY
			BEGIN CATCH
			
				ROLLBACK TRAN
	
				SELECT	@ERROR_PROC = ERROR_PROCEDURE(),
						@ERROR_MSG	= ERROR_MESSAGE(),
						@ERROR_TRACE = (ERROR_NUMBER()+' '+ERROR_STATE()+' '+ERROR_LINE())
				EXEC LSH_ERROR_LOG_INSERT @ERROR_PROC, @ERROR_MSG, @ERROR_TRACE,'',@RGT_ID, @RGT_ID	

				PRINT '[1] ERROR : ' + @ERROR_MSG

			END CATCH 
		END

	END TRY
	BEGIN CATCH

				SELECT	@ERROR_PROC = ERROR_PROCEDURE(),
						@ERROR_MSG	= ERROR_MESSAGE(),
						@ERROR_TRACE = (ERROR_NUMBER()+' '+ERROR_STATE()+' '+ERROR_LINE())
				EXEC LSH_ERROR_LOG_INSERT @ERROR_PROC, @ERROR_MSG, @ERROR_TRACE,'',@RGT_ID, @RGT_ID			

				PRINT '[2] ERROR : ' + @ERROR_MSG

	END CATCH


*/




