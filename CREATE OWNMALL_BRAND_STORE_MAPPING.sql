USE [WOORIM_230215]
GO

/****** Object:  Table [dbo].[OWNMALL_BRAND_STORE_MAPPING]    Script Date: 2023-02-15 오전 11:20:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[OWNMALL_BRAND_STORE_MAPPING](
	[SEQ] [int] IDENTITY(1,1) NOT NULL,
	[BRAND_SEQ] [int] NOT NULL,
	[STORE_SEQ] [int] NOT NULL,
	[REG_USER] [varchar](20) NULL,
	[REG_DATE] [smalldatetime] NULL,
 CONSTRAINT [PK_OWNMALL_BRAND_STORE_MAPPING_SEQ] PRIMARY KEY CLUSTERED 
(
	[SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'순번' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OWNMALL_BRAND_STORE_MAPPING', @level2type=N'COLUMN',@level2name=N'SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'브랜드SEQ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OWNMALL_BRAND_STORE_MAPPING', @level2type=N'COLUMN',@level2name=N'BRAND_SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'매장SEQ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OWNMALL_BRAND_STORE_MAPPING', @level2type=N'COLUMN',@level2name=N'STORE_SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'등록USER' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OWNMALL_BRAND_STORE_MAPPING', @level2type=N'COLUMN',@level2name=N'REG_USER'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'등록일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OWNMALL_BRAND_STORE_MAPPING', @level2type=N'COLUMN',@level2name=N'REG_DATE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'자사몰 브랜드 매장 매핑' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OWNMALL_BRAND_STORE_MAPPING'
GO


