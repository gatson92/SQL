USE [WOORIM_230215]
GO

/****** Object:  Table [dbo].[TB_LEADER_PRODUCT_IF]    Script Date: 2023-02-15 오전 11:18:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_LEADER_PRODUCT_IF](
	[SEQ] [int] IDENTITY(1,1) NOT NULL,
	[OWNMALL_PRODUCT_SEQ] [int] NOT NULL,
	[SET_GUBUN] [varchar](20) NOT NULL,
	[OWNMALL_MODEL_NO] [varchar](200) NOT NULL,
	[OWNMALL_MODEL_NAME] [varchar](200) NULL,
	[BRAND_SEQ] [int] NOT NULL,
	[BRAND_NAME] [varchar](30) NULL,
	[PRICE] [int] NOT NULL,
	[EVENT_STORE_SEQ] [int] NULL,
	[SELL_PRICE] [int] NOT NULL,
	[CHG_PRICE] [int] NULL,
	[CHG_EVENT_STORE_SEQ] [int] NULL,
	[CHG_SELL_PRICE] [int] NULL,
	[USE_YN] [char](1) NULL,
	[REG_DATE] [smalldatetime] NOT NULL,
	[IF_YN] [varchar](1) NOT NULL,
	[IF_DATE] [smalldatetime] NULL,
	[STORE_SEQ] [int] NULL,
 CONSTRAINT [PK_TB_LEADER_PRODUCT_IF_SEQ] PRIMARY KEY CLUSTERED 
(
	[SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'순번' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_PRODUCT_IF', @level2type=N'COLUMN',@level2name=N'SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'자사몰 상품 일련번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_PRODUCT_IF', @level2type=N'COLUMN',@level2name=N'OWNMALL_PRODUCT_SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'세트구분(P-단일/S-세트)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_PRODUCT_IF', @level2type=N'COLUMN',@level2name=N'SET_GUBUN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'자사몰 MODEL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_PRODUCT_IF', @level2type=N'COLUMN',@level2name=N'OWNMALL_MODEL_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'자사몰 MODEL 명' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_PRODUCT_IF', @level2type=N'COLUMN',@level2name=N'OWNMALL_MODEL_NAME'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'브랜드 일련번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_PRODUCT_IF', @level2type=N'COLUMN',@level2name=N'BRAND_SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'브랜드 명' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_PRODUCT_IF', @level2type=N'COLUMN',@level2name=N'BRAND_NAME'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'소비자가' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_PRODUCT_IF', @level2type=N'COLUMN',@level2name=N'PRICE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'할인매장번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_PRODUCT_IF', @level2type=N'COLUMN',@level2name=N'EVENT_STORE_SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'판매가' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_PRODUCT_IF', @level2type=N'COLUMN',@level2name=N'SELL_PRICE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'변경 소비자가' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_PRODUCT_IF', @level2type=N'COLUMN',@level2name=N'CHG_PRICE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'변경 할인매장번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_PRODUCT_IF', @level2type=N'COLUMN',@level2name=N'CHG_EVENT_STORE_SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'변경 판매가' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_PRODUCT_IF', @level2type=N'COLUMN',@level2name=N'CHG_SELL_PRICE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'사용여부' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_PRODUCT_IF', @level2type=N'COLUMN',@level2name=N'USE_YN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'등록일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_PRODUCT_IF', @level2type=N'COLUMN',@level2name=N'REG_DATE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'연동여부' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_PRODUCT_IF', @level2type=N'COLUMN',@level2name=N'IF_YN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'연동일시' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_PRODUCT_IF', @level2type=N'COLUMN',@level2name=N'IF_DATE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'매장SEQ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_PRODUCT_IF', @level2type=N'COLUMN',@level2name=N'STORE_SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'자사몰 상품 인터페이스' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_PRODUCT_IF'
GO


