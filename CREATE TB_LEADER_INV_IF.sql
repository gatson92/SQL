USE [WOORIM_230215]
GO

/****** Object:  Table [dbo].[TB_LEADER_INV_IF]    Script Date: 2023-02-15 오전 11:15:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_LEADER_INV_IF](
	[SEQ] [int] IDENTITY(1,1) NOT NULL,
	[INV_YMD] [varchar](8) NOT NULL,
	[IF_SEQ] [int] NOT NULL,
	[OWNMALL_PRODUCT_SEQ] [int] NOT NULL,
	[OWNMALL_MODEL_NO] [varchar](200) NULL,
	[QTY] [int] NOT NULL,
	[POLICY_QTY] [int] NULL,
	[REG_DATE] [smalldatetime] NOT NULL,
	[IF_YN] [char](1) NOT NULL,
	[IF_DATE] [smalldatetime] NULL,
 CONSTRAINT [PK_TB_LEADER_INV_IF_SEQ] PRIMARY KEY CLUSTERED 
(
	[SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'순번' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_INV_IF', @level2type=N'COLUMN',@level2name=N'SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'재고일자' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_INV_IF', @level2type=N'COLUMN',@level2name=N'INV_YMD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'재고일자내 연동 순번' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_INV_IF', @level2type=N'COLUMN',@level2name=N'IF_SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'자사몰 상품 일련번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_INV_IF', @level2type=N'COLUMN',@level2name=N'OWNMALL_PRODUCT_SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'자사몰 MODEL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_INV_IF', @level2type=N'COLUMN',@level2name=N'OWNMALL_MODEL_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'수량' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_INV_IF', @level2type=N'COLUMN',@level2name=N'QTY'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'정책수량' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_INV_IF', @level2type=N'COLUMN',@level2name=N'POLICY_QTY'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'등록일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_INV_IF', @level2type=N'COLUMN',@level2name=N'REG_DATE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'연동여부' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_INV_IF', @level2type=N'COLUMN',@level2name=N'IF_YN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'수정일시' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_INV_IF', @level2type=N'COLUMN',@level2name=N'IF_DATE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'자사몰 재고 인터페이스' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_INV_IF'
GO


