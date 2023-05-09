-- 매출 마스터 정보
/****** Object:  Table [dbo].[TB_SALES_MST]    Script Date: 2021-11-04 오후 7:03:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_SALES_MST](
	[SALES_NO] [varchar](20) NOT NULL,
	[SALES_CHANNEL] [nvarchar](3) NULL,
	[CST_TYPE] [char](1) NOT NULL,
	[CST_NO] [varchar](13) NULL,
	[SAVE_POINT] [numeric](18, 0) NULL,
	[USE_POINT] [numeric](18, 0) NULL,
	[AGREE_YN] [char](1) NULL,
	[CST_GRD_CD] [varchar](2) NULL,
	[GRD_SALE_AMT] [numeric](18, 0) NULL,
	[BIZ_SALE_AMT] [numeric](18, 0) NULL,
	[COUPON_SALE_AMT] [numeric](18, 0) NULL,
	[DIF_ADJ_AMT] [numeric](18, 0) NULL,
	[DIF_ADJ_REASON] [varchar](2000) NULL,
	[NOR_PRICE] [numeric](18, 0) NULL,
	[SELL_PRICE] [numeric](18, 0) NULL,
	[ACT_SELL_PRICE] [numeric](18, 0) NULL,
	[LOSS_PRICE] [numeric](18, 0) NULL,
	[DISCOUNT_RATE] [numeric](18, 0) NULL,
	[STORE_ID] [char](3) NULL,
	[SALES_DATE] [datetime2](7) NULL,
	[AGE] [tinyint] NULL,
	[REG_DATE] [datetime2](7) NULL,
	[SEX] [tinyint] NULL,
	[NATIONALITY] [tinyint] NULL,
	[SALES_TYPE] [char](1) NOT NULL,
	[REFUND_DATE] [smalldatetime] NULL,
	[REFUND_REASON] [tinyint] NULL,
	[REFUND_PRICE] [numeric](18, 0) NULL,
	[REFUND_LOST_PRICE] [numeric](18, 0) NULL,
	[REFUND_STORE_ID] [char](3) NULL,
	[PRICE_CHANGE_REASON] [varchar](200) NULL,
	[ORG_SALES_NO] [varchar](20) NULL,
	[TOT_QTY] [int] NULL,
	[OPTION_DISCOUNT_RATE] [int] NULL,
	[OPTION_DISCOUNT_PRICE] [int] NULL,
	[EXTRA_DISCOUNT_RATE] [int] NULL,
	[EXTRA_DISCOUNT_PRICE] [int] NULL,
 CONSTRAINT [PK_TB_SALES_MST] PRIMARY KEY CLUSTERED 
(
	[SALES_NO] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'매출번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_MST', @level2type=N'COLUMN',@level2name=N'SALES_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'회원정보구분' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_MST', @level2type=N'COLUMN',@level2name=N'CST_TYPE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'통합고객번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_MST', @level2type=N'COLUMN',@level2name=N'CST_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'적립포인트' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_MST', @level2type=N'COLUMN',@level2name=N'SAVE_POINT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'사용포인트' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_MST', @level2type=N'COLUMN',@level2name=N'USE_POINT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'고객통합동의여부' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_MST', @level2type=N'COLUMN',@level2name=N'AGREE_YN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'고객등급코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_MST', @level2type=N'COLUMN',@level2name=N'CST_GRD_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'등급할인금액' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_MST', @level2type=N'COLUMN',@level2name=N'GRD_SALE_AMT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'영업할인금액' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_MST', @level2type=N'COLUMN',@level2name=N'BIZ_SALE_AMT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'쿠폰할인금액' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_MST', @level2type=N'COLUMN',@level2name=N'COUPON_SALE_AMT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'차액조정금액' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_MST', @level2type=N'COLUMN',@level2name=N'DIF_ADJ_AMT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'차액조정사유' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_MST', @level2type=N'COLUMN',@level2name=N'DIF_ADJ_REASON'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'정상가' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_MST', @level2type=N'COLUMN',@level2name=N'NOR_PRICE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'판매가' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_MST', @level2type=N'COLUMN',@level2name=N'SELL_PRICE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'실판매가' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_MST', @level2type=N'COLUMN',@level2name=N'ACT_SELL_PRICE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'손실가' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_MST', @level2type=N'COLUMN',@level2name=N'LOSS_PRICE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'할인률' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_MST', @level2type=N'COLUMN',@level2name=N'DISCOUNT_RATE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'매장ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_MST', @level2type=N'COLUMN',@level2name=N'STORE_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'구매일시' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_MST', @level2type=N'COLUMN',@level2name=N'SALES_DATE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'나이' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_MST', @level2type=N'COLUMN',@level2name=N'AGE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'등록일시' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_MST', @level2type=N'COLUMN',@level2name=N'REG_DATE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'성별코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_MST', @level2type=N'COLUMN',@level2name=N'SEX'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'국적' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_MST', @level2type=N'COLUMN',@level2name=N'NATIONALITY'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'매출구분' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_MST', @level2type=N'COLUMN',@level2name=N'SALES_TYPE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'반품일자' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_MST', @level2type=N'COLUMN',@level2name=N'REFUND_DATE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'반품사유' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_MST', @level2type=N'COLUMN',@level2name=N'REFUND_REASON'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'반품가격' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_MST', @level2type=N'COLUMN',@level2name=N'REFUND_PRICE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'반품 매장ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_MST', @level2type=N'COLUMN',@level2name=N'REFUND_STORE_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'가격변경사유' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_MST', @level2type=N'COLUMN',@level2name=N'PRICE_CHANGE_REASON'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'원주문매출번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_MST', @level2type=N'COLUMN',@level2name=N'ORG_SALES_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_SALES_MST.PK_TB_SALES_MST' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_MST', @level2type=N'CONSTRAINT',@level2name=N'PK_TB_SALES_MST'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'매출 마스터 정보' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_MST'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_SALES_MST' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_MST'
GO



/****** Object:  Table [dbo].[TB_SALES_DTL]    Script Date: 2021-11-04 오후 7:04:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_SALES_DTL](
	[SALES_NO] [varchar](20) NOT NULL,
	[SALES_DETAIL_NO] [varchar](20) NOT NULL,
	[CST_TYPE] [char](1) NOT NULL,
	[CST_NO] [varchar](13) NULL,
	[SAVE_POINT] [numeric](18, 0) NULL,
	[USE_POINT] [numeric](18, 0) NULL,
	[AGREE_YN] [char](1) NULL,
	[CST_GRD_CD] [varchar](2) NULL,
	[GRD_SALE_AMT] [numeric](18, 0) NULL,
	[BIZ_SALE_AMT] [numeric](18, 0) NULL,
	[COUPON_SALE_AMT] [numeric](18, 0) NULL,
	[DIF_ADJ_AMT] [numeric](18, 0) NULL,
	[DIF_ADJ_REASON] [varchar](2000) NULL,
	[NOR_PRICE] [numeric](18, 0) NULL,
	[SELL_PRICE] [numeric](18, 0) NULL,
	[ACT_SELL_PRICE] [numeric](18, 0) NULL,
	[LOSS_PRICE] [numeric](18, 0) NULL,
	[DISCOUNT_RATE] [numeric](18, 0) NULL,
	[SALES_TYPE] [tinyint] NOT NULL,
	[STORE_ID] [char](3) NULL,
	[SALES_DATE] [smalldatetime] NULL,
	[TRANS_DATE] [smalldatetime] NULL,
	[PRO_SEQ] [int] NULL,
	[QTY] [float] NULL,
	[MARGIN] [int] NULL,
	[PAY_TYPE] [varchar](10) NULL,
	[CER_NO] [varchar](100) NULL,
	[EVENT_STORE_SEQ] [int] NULL,
	[BRAND_GIFT_PRICE] [int] NULL,
	[EMP_SEQ] [int] NULL,
	[REFUND_DATE] [smalldatetime] NULL,
	[REFUND_REASON] [tinyint] NULL,
	[REFUND_PRICE] [numeric](18, 0) NULL,
	[REFUND_LOST_PRICE] [numeric](18, 0) NULL,
	[PRICE_CHANGE_REASON] [varchar](200) NULL,
	[REFUND_STORE_ID] [char](3) NULL,
	[ORG_SALES_NO] [varchar](20) NULL,
	[ORG_SALES_DETAIL_NO] [varchar](20) NULL,
	[seq] [int] NULL,
	[ORIGIN_DATA_TYPE] [nvarchar](3) NULL,
	[ORIGIN_DATA_SEQ] [int] NULL,
	[RES_DATE] [smalldatetime] NULL,
	[REG_DATE] [datetime] NULL,
 CONSTRAINT [PK_TB_SALES_DTL] PRIMARY KEY CLUSTERED 
(
	[SALES_NO] DESC,
	[SALES_DETAIL_NO] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TB_SALES_DTL] ADD  CONSTRAINT [DF_TB_SALES_DTL_REG_DATE]  DEFAULT (GETDATE()) FOR [REG_DATE]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'매출_번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'SALES_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'매출상세번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'SALES_DETAIL_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'회원정보구분' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'CST_TYPE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'통합고객번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'CST_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'적립포인트' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'SAVE_POINT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'사용포인트' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'USE_POINT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'고객통합동의여부' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'AGREE_YN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'고객등급코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'CST_GRD_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'등급할인금액' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'GRD_SALE_AMT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'영업할인금액' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'BIZ_SALE_AMT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'쿠폰할인금액' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'COUPON_SALE_AMT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'차액조정금액' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'DIF_ADJ_AMT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'차액조정사유' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'DIF_ADJ_REASON'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'정상가' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'NOR_PRICE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'판매가' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'SELL_PRICE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'실판매가' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'ACT_SELL_PRICE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'손실가' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'LOSS_PRICE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'할인률' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'DISCOUNT_RATE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'유형' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'SALES_TYPE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'매장ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'STORE_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'판매일자' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'SALES_DATE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'제품 일련번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'PRO_SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'수량' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'QTY'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'마진' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'MARGIN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'지불유형' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'PAY_TYPE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'보증번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'CER_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'할인매장번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'EVENT_STORE_SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'브랜드상품권금액' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'BRAND_GIFT_PRICE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'매장 직원 일련번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'EMP_SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'반품일자' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'REFUND_DATE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'반품사유' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'REFUND_REASON'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'반품가격' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'REFUND_PRICE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'반품 손실가' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'REFUND_LOST_PRICE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'가격변경사유' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'PRICE_CHANGE_REASON'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'반품 매장 ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'REFUND_STORE_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'원주문매출번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'ORG_SALES_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'원주문매출상세번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'COLUMN',@level2name=N'ORG_SALES_DETAIL_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_SALES_DTL.PK_TB_SALES_DTL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL', @level2type=N'CONSTRAINT',@level2name=N'PK_TB_SALES_DTL'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'매출 상세 정보' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_SALES_DTL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_DTL'
GO


-- 매출 쿠폰 정보
/****** Object:  Table [dbo].[TB_SALES_CPN]    Script Date: 2021-11-04 오후 7:05:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_SALES_CPN](
	[SALES_NO] [varchar](20) NOT NULL,
	[COUPON_SEQ_NO] [varchar](30) NOT NULL,
	[SALE_AMT] [numeric](10, 0) NOT NULL,
 CONSTRAINT [PK_TB_SALES_CPN] PRIMARY KEY CLUSTERED 
(
	[SALES_NO] ASC,
	[COUPON_SEQ_NO] ASC,
	[SALE_AMT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'매출_번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_CPN', @level2type=N'COLUMN',@level2name=N'SALES_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'쿠폰발행번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_CPN', @level2type=N'COLUMN',@level2name=N'COUPON_SEQ_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'할인금액' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_CPN', @level2type=N'COLUMN',@level2name=N'SALE_AMT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_SALES_CPN.PK_TB_SALES_CPN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_CPN', @level2type=N'CONSTRAINT',@level2name=N'PK_TB_SALES_CPN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'매출 쿠폰 정보' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_CPN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_SALES_CPN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_CPN'
GO


-- 등급/할인률 정책 정보
/****** Object:  Table [dbo].[TB_DSCNT_INFO]    Script Date: 2021-11-04 오후 7:05:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_DSCNT_INFO](
	[SEQNO] [numeric](10, 0) NOT NULL,
	[BRAND_CD] [varchar](10) NOT NULL,
	[CST_GRD_CD] [varchar](2) NOT NULL,
	[CST_GRD_NM] [varchar](30) NOT NULL,
	[RG1_BUY_AMT] [numeric](38, 0) NULL,
	[RG2_BUY_CNT] [numeric](10, 0) NULL,
	[SALE_RTO] [numeric](10, 2) NULL,
	[MAX_SALE_AMT] [numeric](38, 0) NULL,
	[APLY_DD] [varchar](8) NOT NULL,
	[GRD_LEVEL] [numeric](1, 0) NULL,
 CONSTRAINT [PK_TB_DSCNT_INFO] PRIMARY KEY CLUSTERED 
(
	[SEQNO] ASC,
	[BRAND_CD] ASC,
	[CST_GRD_CD] ASC,
	[CST_GRD_NM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'순번' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_DSCNT_INFO', @level2type=N'COLUMN',@level2name=N'SEQNO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'브랜드코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_DSCNT_INFO', @level2type=N'COLUMN',@level2name=N'BRAND_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'고객등급코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_DSCNT_INFO', @level2type=N'COLUMN',@level2name=N'CST_GRD_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_DSCNT_INFO.CST_GRD_CD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_DSCNT_INFO', @level2type=N'COLUMN',@level2name=N'CST_GRD_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'고객등급명' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_DSCNT_INFO', @level2type=N'COLUMN',@level2name=N'CST_GRD_NM'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_DSCNT_INFO.CST_GRD_NM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_DSCNT_INFO', @level2type=N'COLUMN',@level2name=N'CST_GRD_NM'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'기준1_구매금액' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_DSCNT_INFO', @level2type=N'COLUMN',@level2name=N'RG1_BUY_AMT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_DSCNT_INFO.RG1_BUY_AMT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_DSCNT_INFO', @level2type=N'COLUMN',@level2name=N'RG1_BUY_AMT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'기준2_구매횟수' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_DSCNT_INFO', @level2type=N'COLUMN',@level2name=N'RG2_BUY_CNT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_DSCNT_INFO.RG2_BUY_CNT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_DSCNT_INFO', @level2type=N'COLUMN',@level2name=N'RG2_BUY_CNT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'할인율' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_DSCNT_INFO', @level2type=N'COLUMN',@level2name=N'SALE_RTO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'최대할인금액' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_DSCNT_INFO', @level2type=N'COLUMN',@level2name=N'MAX_SALE_AMT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'적용일자' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_DSCNT_INFO', @level2type=N'COLUMN',@level2name=N'APLY_DD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'등급레벨' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_DSCNT_INFO', @level2type=N'COLUMN',@level2name=N'GRD_LEVEL'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_DSCNT_INFO.GRD_LEVEL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_DSCNT_INFO', @level2type=N'COLUMN',@level2name=N'GRD_LEVEL'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'등급/할인율 정책 정보' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_DSCNT_INFO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_DSCNT_INFO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_DSCNT_INFO'
GO


-- 적립율 정책 정보
/****** Object:  Table [dbo].[TB_POINT_INFO]    Script Date: 2021-11-04 오후 7:06:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_POINT_INFO](
	[SEQNO] [numeric](10, 0) NOT NULL,
	[PROD_BRAND_CD] [varchar](10) NOT NULL,
	[ITEM_CD] [varchar](5) NOT NULL,
	[CST_GRD_CD] [varchar](2) NOT NULL,
	[SAVE_RTO] [numeric](10, 2) NULL,
	[SALE_SAVE_RTO] [numeric](10, 2) NULL,
	[EVENT_SAVE_RTO] [numeric](10, 2) NULL,
	[APLY_DD] [varchar](8) NOT NULL,
 CONSTRAINT [PK_TB_POINT_INFO] PRIMARY KEY CLUSTERED 
(
	[SEQNO] ASC,
	[PROD_BRAND_CD] ASC,
	[ITEM_CD] ASC,
	[CST_GRD_CD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'순번' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_POINT_INFO', @level2type=N'COLUMN',@level2name=N'SEQNO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'브랜드코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_POINT_INFO', @level2type=N'COLUMN',@level2name=N'PROD_BRAND_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'제품구분' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_POINT_INFO', @level2type=N'COLUMN',@level2name=N'ITEM_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'고객등급코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_POINT_INFO', @level2type=N'COLUMN',@level2name=N'CST_GRD_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'적립율' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_POINT_INFO', @level2type=N'COLUMN',@level2name=N'SAVE_RTO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'할인적립율' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_POINT_INFO', @level2type=N'COLUMN',@level2name=N'SALE_SAVE_RTO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'행사적립율' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_POINT_INFO', @level2type=N'COLUMN',@level2name=N'EVENT_SAVE_RTO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'적용일자' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_POINT_INFO', @level2type=N'COLUMN',@level2name=N'APLY_DD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'적립률 정책 정보' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_POINT_INFO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_POINT_INFO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_POINT_INFO'
GO



-- 포인트 적용 불가 매장 정보
/****** Object:  Table [dbo].[TB_POINT_SHOP]    Script Date: 2021-11-04 오후 7:06:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_POINT_SHOP](
	[SHOP_CD] [varchar](10) NOT NULL,
	[SHOP_APLY_DVN] [varchar](2) NOT NULL,
 CONSTRAINT [PK_TB_POINT_SHOP] PRIMARY KEY CLUSTERED 
(
	[SHOP_CD] ASC,
	[SHOP_APLY_DVN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'매장코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_POINT_SHOP', @level2type=N'COLUMN',@level2name=N'SHOP_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'매장적용구분' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_POINT_SHOP', @level2type=N'COLUMN',@level2name=N'SHOP_APLY_DVN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_POINT_SHOP.PK_TB_POINT_SHOP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_POINT_SHOP', @level2type=N'CONSTRAINT',@level2name=N'PK_TB_POINT_SHOP'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'포인트 적용 불가 매장 정보' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_POINT_SHOP'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_POINT_SHOP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_POINT_SHOP'
GO

/****** Object:  Table [dbo].[TB_MALL_ORDER]    Script Date: 2021-11-04 오후 8:01:00 ******/
/** 이관 후 DROP TABLE TB_MALL_ORDER(MIS) */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_MALL_ORDER](
	[SEQ] [int] IDENTITY(1,1) NOT NULL,
	[NO_SEQ] [int] NULL,
	[CUST_NAME] [varchar](50) NULL,
	[CUST_PHONE] [varchar](20) NULL,
	[ETC] [varchar](40) NULL,
	[MALL] [tinyint] NULL,
 CONSTRAINT [PK_TB_MALL_ORDER_SEQ] PRIMARY KEY CLUSTERED 
(
	[SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[TB_MALL_RETURN]    Script Date: 2021-11-04 오후 8:01:00 ******/
/** DATA 이관 후 DROP TABLE TB_MALL_RETURN(MIS) */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_MALL_RETURN](
	[SEQ] [int] IDENTITY(1,1) NOT NULL,
	[NO_SEQ] [int] NULL,
	[CUST_NAME] [varchar](20) NULL,
	[CUST_PHONE] [varchar](20) NULL,
	[ETC] [varchar](40) NULL,
	[MALL] [tinyint] NULL,
 CONSTRAINT [PK_TB_MALL_RETURN_SEQ] PRIMARY KEY CLUSTERED 
(
	[SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[TB_MEMBER_ORDER]    Script Date: 2021-11-04 오후 8:01:00 ******/
-- 회원 매출 정보
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_MEMBER_ORDER](
	[SEQ] [int] IDENTITY(1,1) NOT NULL,
	[TYPE] [tinyint] NOT NULL,
	[MEM_SEQ] [int] NOT NULL,
	[STORE_ID] [char](3) NOT NULL,
	[SALES_DATE] [smalldatetime] NOT NULL,
	[PRO_SEQ] [int] NOT NULL,
	[QTY] [int] NOT NULL,
	[ORIGINAL_PRICE] [int] NULL,
	[PRICE] [int] NOT NULL,
	[LOST_PRICE] [int] NULL,
	[PAY_TYPE] [varchar](10) NULL,
	[CER_NO] [varchar](100) NULL,
	[EVENT_STORE_SEQ] [int] NULL,
	[BRAND_GIFT_PRICE] [int] NULL,
	[PRICE_CHANGE_WHY] [varchar](200) NULL,
	[REG_DATE] [smalldatetime] NOT NULL,
	[SALES_MEMO] [varchar](200) NULL,
	[EMP_SEQ] [int] NULL,
	[HAND] [char](1) NULL,
	[PURPOSE] [char](1) NULL,
	[CHANGE_01] [varchar](50) NULL,
	[CHANGE_02] [varchar](50) NULL,
	[MARGIN] [int] NULL,
	[AGE] [tinyint] NULL,
	[SEX] [tinyint] NULL,
	[NATIONALITY] [tinyint] NULL,
	[CST_NO] [varchar](13) NOT NULL,
	[SALES_NO] [varchar](20) NULL,
	[SALES_DETAIL_NO] [varchar](20) NULL,
	[NOR_PRICE] [int] NULL,
	[SAVE_POINT] [numeric](18, 0) NULL,
	[USE_POINT] [numeric](18, 0) NULL,
	[AGREE_YN] [char](1) NULL,
	[CST_GRD_CD] [varchar](2) NULL,
	[GRD_SALE_AMT] [numeric](18, 0) NULL,
	[BIZ_SALE_AMT] [numeric](18, 0) NULL,
	[COUPON_SALE_AMT] [numeric](18, 0) NULL,
	[DIF_ADJ_AMT] [numeric](18, 0) NULL,
	[DIF_ADJ_REASON] [varchar](2000) NULL,
	[DISCOUNT_RATE] [numeric](18, 0) NULL,
 CONSTRAINT [PK_TB_MEMBER_ORDER] PRIMARY KEY NONCLUSTERED 
(
	[SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[TB_MEMBER_ORDER_TRANS]    Script Date: 2021-11-04 오후 8:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_MEMBER_ORDER_TRANS](
	[SEQ] [int] IDENTITY(1,1) NOT NULL,
	[ORDER_SEQ] [int] NOT NULL,
	[TRANS_DATE] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_TB_MEMBER_ORDER_TRANS] PRIMARY KEY CLUSTERED 
(
	[ORDER_SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_MEMBER_RETURN]    Script Date: 2021-11-04 오후 8:01:00 ******/
-- 회원 반품 정보
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_MEMBER_RETURN](
	[SEQ] [int] IDENTITY(1,1) NOT NULL,
	[TYPE] [tinyint] NULL,
	[STORE_ID] [char](3) NOT NULL,
	[ORDER_SEQ] [int] NOT NULL,
	[QTY] [float] NOT NULL,
	[RETURN_DATE] [smalldatetime] NOT NULL,
	[WHY] [tinyint] NOT NULL,
	[REG_DATE] [smalldatetime] NOT NULL,
	[REAL_PRICE] [int] NOT NULL,
	[LOST_PRICE] [int] NOT NULL,
	[PRICE_CHANGE_WHY] [varchar](200) NULL,
	[EMP_SEQ] [int] NULL,
	[MARGIN] [int] NULL,
	[SALES_NO] [varchar](20) NULL,
	[SALES_DETAIL_NO] [varchar](20) NULL,
	[CST_NO] [varchar](13) NULL,
	[SAVE_POINT] [numeric](18, 0) NULL,
	[USE_POINT] [numeric](18, 0) NULL,
	[AGREE_YN] [char](1) NULL,
	[CST_GRD_CD] [varchar](2) NULL,
	[ORG_SALES_NO] [varchar](20) NULL,
	[ORG_SALES_DETAIL_NO] [varchar](20) NULL,
 CONSTRAINT [PK_TB_MEMBER_RETURN] PRIMARY KEY NONCLUSTERED 
(
	[SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[TB_NO_MEMBER_ORDER]    Script Date: 2021-11-04 오후 8:01:00 ******/
-- 비회원 매출 정보
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_NO_MEMBER_ORDER](
	[SEQ] [int] IDENTITY(1,1) NOT NULL,
	[STORE_ID] [char](3) NOT NULL,
	[SALES_DATE] [smalldatetime] NOT NULL,
	[PRO_SEQ] [int] NOT NULL,
	[QTY] [int] NULL,
	[ORIGINAL_PRICE] [int] NULL,
	[PRICE] [int] NOT NULL,
	[LOST_PRICE] [int] NULL,
	[PAY_TYPE] [varchar](10) NULL,
	[CER_NO] [varchar](20) NULL,
	[EVENT_STORE_SEQ] [int] NULL,
	[BRAND_GIFT_PRICE] [int] NULL,
	[REG_DATE] [smalldatetime] NOT NULL,
	[PRICE_CHANGE_WHY] [varchar](200) NULL,
	[EMP_SEQ] [int] NULL,
	[CHANGE_01] [varchar](20) NULL,
	[CHANGE_02] [varchar](20) NULL,
	[MARGIN] [int] NULL,
	[S_PRICE] [int] NULL,
	[AGE] [tinyint] NULL,
	[SEX] [tinyint] NULL,
	[NATIONALITY] [tinyint] NULL,
	[SALES_NO] [varchar](20) NULL,
	[SALES_DETAIL_NO] [varchar](20) NULL,
	[NOR_PRICE] [int] NULL,
	[BIZ_SALE_AMT] [numeric](18, 0) NULL,
	[COUPON_SALE_AMT] [numeric](18, 0) NULL,
	[DIF_ADJ_AMT] [numeric](18, 0) NULL,
	[DIF_ADJ_REASON] [varchar](2000) NULL,
	[DISCOUNT_RATE] [numeric](18, 0) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TB_MEMBER_ORDER] ADD  CONSTRAINT [DF_TB_MEMBER_ORDER_REG_DATE]  DEFAULT (getdate()) FOR [REG_DATE]
GO
ALTER TABLE [dbo].[TB_NO_MEMBER_ORDER] ADD  CONSTRAINT [DF__TB_NO_MEMBER_ORDER_REG_DATE__0B5CAFEA]  DEFAULT (getdate()) FOR [REG_DATE]
GO

/****** Object:  Table [dbo].[TB_NO_MEMBER_RETURN]    Script Date: 2021-11-04 오후 8:01:00 ******/
-- 비회원 반품 정보
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_NO_MEMBER_RETURN](
	[SEQ] [int] IDENTITY(1,1) NOT NULL,
	[STORE_ID] [char](3) NOT NULL,
	[RETURN_DATE] [smalldatetime] NOT NULL,
	[PRO_SEQ] [int] NOT NULL,
	[QTY] [tinyint] NOT NULL,
	[PRICE] [int] NOT NULL,
	[CER_NO] [varchar](20) NULL,
	[EVENT_STORE_SEQ] [int] NULL,
	[PAY_TYPE] [varchar](10) NULL,
	[BRAND_GIFT_PRICE] [int] NULL,
	[WHY] [tinyint] NOT NULL,
	[BUY_DATE] [smalldatetime] NULL,
	[BUY_STORE_ID] [char](3) NULL,
	[REG_DATE] [smalldatetime] NOT NULL,
	[ORIGINAL_PRICE] [int] NULL,
	[LOST_PRICE] [int] NULL,
	[PRICE_CHANGE_WHY] [varchar](200) NULL,
	[EMP_SEQ] [int] NULL,
	[MARGIN] [int] NULL,
	[S_PRICE] [int] NULL,
	[O_SEQ] [int] NULL,
	[SALES_NO] [varchar](20) NULL,
	[SALES_DETAIL_NO] [varchar](20) NULL,
	[NOR_PRICE] [int] NULL,
	[ORG_SALES_NO] [varchar](20) NULL,
	[ORG_SALES_DETAIL_NO] [varchar](20) NULL,
 CONSTRAINT [PK_TB_NO_MEMBER_RETURN] PRIMARY KEY CLUSTERED 
(
	[SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TB_MEMBER_RETURN] ADD  CONSTRAINT [DF_TB_MEMBER_RETURN_REG_DATE_48BAC3E5]  DEFAULT (getdate()) FOR [REG_DATE]
GO
ALTER TABLE [dbo].[TB_MEMBER_RETURN] ADD  CONSTRAINT [DF_TB_MEMBER_RETURN_REAL_PRICE]  DEFAULT ((0)) FOR [REAL_PRICE]
GO
ALTER TABLE [dbo].[TB_MEMBER_RETURN] ADD  CONSTRAINT [DF_TB_MEMBER_RETURN_LOST_PRICE]  DEFAULT ((0)) FOR [LOST_PRICE]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'통합고객번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_ORDER', @level2type=N'COLUMN',@level2name=N'CST_NO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'매출번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_ORDER', @level2type=N'COLUMN',@level2name=N'SALES_NO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'매출상세번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_ORDER', @level2type=N'COLUMN',@level2name=N'SALES_DETAIL_NO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'정상가' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_ORDER', @level2type=N'COLUMN',@level2name=N'NOR_PRICE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'적립포인트' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_ORDER', @level2type=N'COLUMN',@level2name=N'SAVE_POINT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'사용포인트' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_ORDER', @level2type=N'COLUMN',@level2name=N'USE_POINT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'고객통합동의여부' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_ORDER', @level2type=N'COLUMN',@level2name=N'AGREE_YN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'고객등급코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_ORDER', @level2type=N'COLUMN',@level2name=N'CST_GRD_CD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'등급할인금액' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_ORDER', @level2type=N'COLUMN',@level2name=N'GRD_SALE_AMT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'영업할인금액' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_ORDER', @level2type=N'COLUMN',@level2name=N'BIZ_SALE_AMT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'쿠폰할인금액' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_ORDER', @level2type=N'COLUMN',@level2name=N'COUPON_SALE_AMT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'차액조정금액' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_ORDER', @level2type=N'COLUMN',@level2name=N'DIF_ADJ_AMT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'차액조정사유' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_ORDER', @level2type=N'COLUMN',@level2name=N'DIF_ADJ_REASON'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'할인률' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_ORDER', @level2type=N'COLUMN',@level2name=N'DISCOUNT_RATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'매출번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_RETURN', @level2type=N'COLUMN',@level2name=N'SALES_NO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'매출상세번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_RETURN', @level2type=N'COLUMN',@level2name=N'SALES_DETAIL_NO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'통합고객번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_RETURN', @level2type=N'COLUMN',@level2name=N'CST_NO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'적립포인트' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_RETURN', @level2type=N'COLUMN',@level2name=N'SAVE_POINT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'사용포인트' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_RETURN', @level2type=N'COLUMN',@level2name=N'USE_POINT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'고객통합동의여부' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_RETURN', @level2type=N'COLUMN',@level2name=N'AGREE_YN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'고객등급코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_RETURN', @level2type=N'COLUMN',@level2name=N'CST_GRD_CD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'원주문매출번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_RETURN', @level2type=N'COLUMN',@level2name=N'ORG_SALES_NO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'원주문매출상세번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_RETURN', @level2type=N'COLUMN',@level2name=N'ORG_SALES_DETAIL_NO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'매출번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_NO_MEMBER_ORDER', @level2type=N'COLUMN',@level2name=N'SALES_NO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'매출상세번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_NO_MEMBER_ORDER', @level2type=N'COLUMN',@level2name=N'SALES_DETAIL_NO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'정상가' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_NO_MEMBER_ORDER', @level2type=N'COLUMN',@level2name=N'NOR_PRICE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'영업할인금액' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_NO_MEMBER_ORDER', @level2type=N'COLUMN',@level2name=N'BIZ_SALE_AMT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'쿠폰할인금액' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_NO_MEMBER_ORDER', @level2type=N'COLUMN',@level2name=N'COUPON_SALE_AMT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'차액조정금액' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_NO_MEMBER_ORDER', @level2type=N'COLUMN',@level2name=N'DIF_ADJ_AMT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'차액조정사유' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_NO_MEMBER_ORDER', @level2type=N'COLUMN',@level2name=N'DIF_ADJ_REASON'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'할인률' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_NO_MEMBER_ORDER', @level2type=N'COLUMN',@level2name=N'DISCOUNT_RATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'매출번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_NO_MEMBER_RETURN', @level2type=N'COLUMN',@level2name=N'SALES_NO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'매출상세번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_NO_MEMBER_RETURN', @level2type=N'COLUMN',@level2name=N'SALES_DETAIL_NO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'정상가' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_NO_MEMBER_RETURN', @level2type=N'COLUMN',@level2name=N'NOR_PRICE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'원주문매출번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_NO_MEMBER_RETURN', @level2type=N'COLUMN',@level2name=N'ORG_SALES_NO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'원주문매출상세번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_NO_MEMBER_RETURN', @level2type=N'COLUMN',@level2name=N'ORG_SALES_DETAIL_NO'
GO

-- 중복처리 이력
/****** Object:  Table [dbo].[TB_CST_DUPL_CMPL_HIST]    Script Date: 2021-11-05 오후 4:53:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_CST_DUPL_CMPL_HIST](
	[CMPL_SEQ] [int] IDENTITY(1,1) NOT NULL,
	[TABLE_NAME] [varchar](100) NOT NULL,
	[TABLE_KEY_NAME] [varchar](100) NOT NULL,
	[TABLE_KEY_VALUE] [varchar](100) NOT NULL,
	[MAIN_CST_NO] [varchar](13) NOT NULL,
	[DEL_CST_NO] [varchar](13) NOT NULL,
	[MAIN_MEMBER_SEQ] [int] NULL,
	[DEL_MEMBER_SEQ] [int] NULL,
	[REG_DATE] [datetime] NOT NULL,
	[REG_USER] [varchar](20) NOT NULL,
 CONSTRAINT [PK_TB_CST_DUPL_CMPL_HIST] PRIMARY KEY CLUSTERED 
(
	[CMPL_SEQ] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'중복처리 완료 일련번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DUPL_CMPL_HIST', @level2type=N'COLUMN',@level2name=N'CMPL_SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'테이블명' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DUPL_CMPL_HIST', @level2type=N'COLUMN',@level2name=N'TABLE_NAME'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'테이블키명' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DUPL_CMPL_HIST', @level2type=N'COLUMN',@level2name=N'TABLE_KEY_NAME'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'테이블키값' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DUPL_CMPL_HIST', @level2type=N'COLUMN',@level2name=N'TABLE_KEY_VALUE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'주 고객 번호(신)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DUPL_CMPL_HIST', @level2type=N'COLUMN',@level2name=N'MAIN_CST_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'삭제고객번호(신)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DUPL_CMPL_HIST', @level2type=N'COLUMN',@level2name=N'DEL_CST_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'주 고객 번호(구)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DUPL_CMPL_HIST', @level2type=N'COLUMN',@level2name=N'MAIN_MEMBER_SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'삭제고객번호(구)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DUPL_CMPL_HIST', @level2type=N'COLUMN',@level2name=N'DEL_MEMBER_SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'등록일시' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DUPL_CMPL_HIST', @level2type=N'COLUMN',@level2name=N'REG_DATE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'등록자' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DUPL_CMPL_HIST', @level2type=N'COLUMN',@level2name=N'REG_USER'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'중복처리변경이력' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DUPL_CMPL_HIST'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CST_DUPL_CMPL_HIST' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DUPL_CMPL_HIST'
GO

-- 매출 영업할인 정보
/****** Object:  Table [dbo].[TB_SALES_BIZ]    Script Date: 2021-11-05 오후 6:33:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_SALES_BIZ](
	[SALES_NO] [varchar](20) NOT NULL,
	[COUPON_ID] [varchar](10) NOT NULL,
	[SALE_AMT] [numeric](10, 0) NOT NULL,
 CONSTRAINT [PK_TB_SALES_BIZ] PRIMARY KEY CLUSTERED 
(
	[SALES_NO] ASC,
	[COUPON_ID] ASC,
	[SALE_AMT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'매출_번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_BIZ', @level2type=N'COLUMN',@level2name=N'SALES_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'쿠폰아이디' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_BIZ', @level2type=N'COLUMN',@level2name=N'COUPON_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'할인금액' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_BIZ', @level2type=N'COLUMN',@level2name=N'SALE_AMT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_SALES_BIZ.PK_TB_SALES_BIZ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_BIZ', @level2type=N'CONSTRAINT',@level2name=N'PK_TB_SALES_BIZ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'매출 영업할인 정보' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_BIZ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_SALES_BIZ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_SALES_BIZ'
GO


-- 백화점몰 매출 AS-IS DATA 이관용 TABLE(CRM DB로 이관용)
/****** Object:  Table [dbo].[TB_MALL_ORDER_TEMP]    Script Date: 2022-09-13 오후 3:41:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_MALL_ORDER_TEMP](
	[SEQ] [int] IDENTITY(1,1) NOT NULL,
	[NO_SEQ] [int] NULL,
	[CUST_NAME] [varchar](50) NULL,
	[CUST_PHONE] [varchar](20) NULL,
	[ETC] [varchar](40) NULL,
	[MALL] [tinyint] NULL,
 CONSTRAINT [PK_TB_MALL_ORDER_SEQ] PRIMARY KEY CLUSTERED 
(
	[SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


-- 백화점몰 반품 AS-IS DATA 이관용 TABLE(CRM DB로 이관용)
/****** Object:  Table [dbo].[TB_MALL_RETURN_TEMP]    Script Date: 2022-09-13 오후 3:44:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_MALL_RETURN_TEMP](
	[SEQ] [int] IDENTITY(1,1) NOT NULL,
	[NO_SEQ] [int] NULL,
	[CUST_NAME] [varchar](20) NULL,
	[CUST_PHONE] [varchar](20) NULL,
	[ETC] [varchar](40) NULL,
	[MALL] [tinyint] NULL,
 CONSTRAINT [PK_TB_MALL_RETURN_SEQ] PRIMARY KEY CLUSTERED 
(
	[SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO