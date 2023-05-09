------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
--1. TB_STORE_PART_TIME(�˹� ����)
-- CRM DB�� ����
DROP TABLE [dbo].[TB_STORE_PART_TIME]
CREATE TABLE [dbo].[TB_STORE_PART_TIME](
	[SEQ] [int] IDENTITY(1,1) NOT NULL,
	[STORE_ID] [char](3) NOT NULL,
	[PART_TIME_NAME] [varchar](10) NULL,
	[SSN1] [varchar](24) NULL,
	[SSN2] [varchar](24) NULL,
	[ADDRESS] [varchar](150) NULL,
	[MOBILE_NUM] [varchar](100) NULL,
	[NAME_IMAGE] [varchar](500) NULL,
	[BANK] [varchar](20) NULL,
	[BANK_NUMBER] [varchar](152) NULL,
	[BANK_IMAGE] [varchar](500) NULL,
	[NOTE] [varchar](100) NULL,
	[ACTIVE] [char](1) NULL,
	[REG_USER] [varchar](50) NULL,
	[REG_DATE] [smalldatetime] NULL,
	[MOD_USER] [varchar](20) NULL,
	[MOD_DATE] [smalldatetime] NULL,
	[EMAIL] [varchar](200) NULL,
	[CONFIRM_YN] [char](1) NOT NULL
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_STORE_PART_TIME', @level2type=N'COLUMN',@level2name=N'SEQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ϸ��� ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_STORE_PART_TIME', @level2type=N'COLUMN',@level2name=N'STORE_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƹ�����Ʈ �̸�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_STORE_PART_TIME', @level2type=N'COLUMN',@level2name=N'PART_TIME_NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ֹι�ȣ ���ڸ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_STORE_PART_TIME', @level2type=N'COLUMN',@level2name=N'SSN1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ֹι�ȣ ���ڸ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_STORE_PART_TIME', @level2type=N'COLUMN',@level2name=N'SSN2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ּ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_STORE_PART_TIME', @level2type=N'COLUMN',@level2name=N'ADDRESS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�޴�����ȣ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_STORE_PART_TIME', @level2type=N'COLUMN',@level2name=N'MOBILE_NUM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������� �����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_STORE_PART_TIME', @level2type=N'COLUMN',@level2name=N'NAME_IMAGE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_STORE_PART_TIME', @level2type=N'COLUMN',@level2name=N'BANK'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���¹�ȣ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_STORE_PART_TIME', @level2type=N'COLUMN',@level2name=N'BANK_NUMBER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����纻 �����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_STORE_PART_TIME', @level2type=N'COLUMN',@level2name=N'BANK_IMAGE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�޸�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_STORE_PART_TIME', @level2type=N'COLUMN',@level2name=N'NOTE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ٹ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_STORE_PART_TIME', @level2type=N'COLUMN',@level2name=N'ACTIVE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_STORE_PART_TIME', @level2type=N'COLUMN',@level2name=N'REG_USER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_STORE_PART_TIME', @level2type=N'COLUMN',@level2name=N'REG_DATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_STORE_PART_TIME', @level2type=N'COLUMN',@level2name=N'MOD_USER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_STORE_PART_TIME', @level2type=N'COLUMN',@level2name=N'MOD_DATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƹ�����Ʈ ���� ���̺�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_STORE_PART_TIME'
GO

-- ���̱׷��̼�
SET IDENTITY_INSERT TB_STORE_PART_TIME ON;
INSERT INTO TB_STORE_PART_TIME
(
	SEQ, PART_TIME_NAME, SSN1, SSN2, ADDRESS, MOBILE_NUM, 
	STORE_ID, NAME_IMAGE, BANK, BANK_NUMBER, BANK_IMAGE, 
	NOTE, ACTIVE, REG_USER, REG_DATE,CONFIRM_YN
)
SELECT  
	SEQ, PART_TIME_NAME, DAMO.DBO.ENCRYPT(SSN1), DAMO.DBO.ENCRYPT(SSN2), ADDRESS, DAMO.DBO.ENCRYPT(MOBILE_NUM), 
	STORE_ID, NAME_IMAGE, BANK, BANK_NUMBER, BANK_IMAGE, NOTE, ACTIVE, REG_USER, REG_DATE,'N'
FROM [MISSERVER].WOORIM_220901.DBO.TB_STORE_PART_TIME
SET IDENTITY_INSERT TB_STORE_PART_TIME OFF;

------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------