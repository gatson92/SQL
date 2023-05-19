USE [WOORIM_230215]
GO

/****** Object:  Table [dbo].[TB_LEADER_INVOICE_NO_IF]    Script Date: 2023-02-15 ���� 11:18:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_LEADER_INVOICE_NO_IF](
	[SEQ] [int] IDENTITY(1,1) NOT NULL,
	[ORDER_NO] [varchar](100) NOT NULL,
	[ORDER_SEQ] [int] NOT NULL,
	[STORE_SEQ] [int] NOT NULL,
	[INVOICE_NO] [varchar](100) NULL,
	[REG_DATE] [smalldatetime] NOT NULL,
	[IF_YN] [char](1) NULL,
	[IF_DATE] [smalldatetime] NULL,
 CONSTRAINT [PK_TB_LEADER_INVOICE_NO_IF_SEQ] PRIMARY KEY CLUSTERED 
(
	[SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_INVOICE_NO_IF', @level2type=N'COLUMN',@level2name=N'SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ֹ���ȣ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_INVOICE_NO_IF', @level2type=N'COLUMN',@level2name=N'ORDER_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ֹ���ȣ�� ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_INVOICE_NO_IF', @level2type=N'COLUMN',@level2name=N'ORDER_SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ŷ�ó ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_INVOICE_NO_IF', @level2type=N'COLUMN',@level2name=N'STORE_SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ȣ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_INVOICE_NO_IF', @level2type=N'COLUMN',@level2name=N'INVOICE_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����Ͻ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_INVOICE_NO_IF', @level2type=N'COLUMN',@level2name=N'REG_DATE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���� ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_INVOICE_NO_IF', @level2type=N'COLUMN',@level2name=N'IF_YN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����Ͻ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_INVOICE_NO_IF', @level2type=N'COLUMN',@level2name=N'IF_DATE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ڻ�� ����� �������̽�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_INVOICE_NO_IF'
GO


