USE [WOORIM_230215]
GO

/****** Object:  Table [dbo].[TB_LEADER_ORDER_IF]    Script Date: 2023-02-15 오전 11:18:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_LEADER_ORDER_IF](
	[SEQ] [int] IDENTITY(1,1) NOT NULL,
	[ORDER_NO] [varchar](100) NOT NULL,
	[SALES_TYPE] [tinyint] NOT NULL,
	[ORDER_DATE] [smalldatetime] NOT NULL,
	[STORE_SEQ] [int] NOT NULL,
	[STORE_NM] [varchar](50) NULL,
	[CST_TYPE] [char](1) NOT NULL,
	[CST_NO] [varchar](13) NULL,
	[SAVE_POINT] [int] NULL,
	[USE_POINT] [int] NULL,
	[AGREE_YN] [char](1) NULL,
	[CST_GRD_CD] [varchar](2) NULL,
	[GRD_SALE_AMT] [int] NULL,
	[BIZ_SALE_AMT] [int] NULL,
	[COUPON_SALE_AMT] [int] NULL,
	[DIF_ADJ_AMT] [int] NULL,
	[DIF_ADJ_AMT_FOB] [numeric](9, 4) NULL,
	[DIF_ADJ_REASON] [varchar](2000) NULL,
	[TOT_QTY] [int] NULL,
	[PRICE] [int] NULL,
	[PRICE_FOB] [numeric](9, 4) NULL,
	[SELL_PRICE] [int] NULL,
	[SELL_PRICE_FOB] [numeric](9, 4) NULL,
	[PAY_AMT] [int] NULL,
	[PAY_AMT_FOB] [numeric](9, 4) NULL,
	[OPT_PRICE] [int] NULL,
	[OPT_PRICE_FOB] [numeric](9, 4) NULL,
	[LOSS_PRICE] [int] NULL,
	[DISCOUNT_RATE] [numeric](18, 0) NULL,
	[REFUND_DATE] [smalldatetime] NULL,
	[REFUND_REASON] [tinyint] NULL,
	[REFUND_PRICE] [int] NULL,
	[REFUND_LOST_PRICE] [int] NULL,
	[PRICE_CHANGE_REASON] [varchar](200) NULL,
	[CLAIM_TYPE] [varchar](200) NULL,
	[CLAIM_CODE] [varchar](17) NULL,
	[CLAIM_TEXT] [text] NULL,
	[PAY_DATE] [smalldatetime] NULL,
	[PAY_TYPE] [varchar](20) NULL,
	[DELIVER_END_DATE] [smalldatetime] NULL,
	[DELIVER_PRICE] [int] NULL,
	[DELIVER_PRICE_FOB] [numeric](9, 4) NULL,
	[EXCHANGE_RATE] [numeric](9, 4) NULL,
	[SHOP_NO] [char](1) NULL,
	[IF_YN] [char](1) NOT NULL,
	[IF_DATE] [smalldatetime] NULL,
	[UPDATE_TYPE] [char](1) NULL,
	[UPDATE_IF_YN] [char](1) NULL,
	[UPDATE_IF_DATE] [smalldatetime] NULL,
	[IF_ERR_YN] [char](1) NULL,
	[IF_ERR_MSG] [varchar](200) NULL,
	[REG_DATE] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_TB_LEADER_ORDER_IF_SEQ] PRIMARY KEY CLUSTERED 
(
	[SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'순번' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'주문번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'ORDER_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'판매타입' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'SALES_TYPE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'주문일자' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'ORDER_DATE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'매장SEQ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'STORE_SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'매장명' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'STORE_NM'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'회원정보구분' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'CST_TYPE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'통합고객번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'CST_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'적립포인트' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'SAVE_POINT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'사용포인트' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'USE_POINT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'고객통합동의여부' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'AGREE_YN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'고객등급코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'CST_GRD_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'등급할인금액' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'GRD_SALE_AMT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'영업할인금액' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'BIZ_SALE_AMT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'쿠폰할인금액' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'COUPON_SALE_AMT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'차액조정금액' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'DIF_ADJ_AMT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'차액조정금액(해외몰)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'DIF_ADJ_AMT_FOB'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'차액조정사유' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'DIF_ADJ_REASON'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'총 판매 수량' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'TOT_QTY'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'소비자가' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'PRICE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'소비자가(해외몰)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'PRICE_FOB'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'판매가' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'SELL_PRICE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'판매가(해외몰)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'SELL_PRICE_FOB'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'결제금액' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'PAY_AMT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'결제금액(해외몰)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'PAY_AMT_FOB'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'옵션가' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'OPT_PRICE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'옵션가(해외몰)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'OPT_PRICE_FOB'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'손실가' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'LOSS_PRICE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'할인률' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'DISCOUNT_RATE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'반품일자' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'REFUND_DATE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'반품사유' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'REFUND_REASON'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'반품가격' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'REFUND_PRICE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'반품손실가' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'REFUND_LOST_PRICE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'가격변경사유' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'PRICE_CHANGE_REASON'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'클레임 타입' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'CLAIM_TYPE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'클레임코드 번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'CLAIM_CODE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'클레임 사유' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'CLAIM_TEXT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'결제일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'PAY_DATE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'결제방법' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'PAY_TYPE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'배송완료일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'DELIVER_END_DATE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'배송비' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'DELIVER_PRICE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'배송비(해외몰)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'DELIVER_PRICE_FOB'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'환율' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'EXCHANGE_RATE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'해외 쇼핑몰 구분 번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'SHOP_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'연동여부' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'IF_YN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'연동일시' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'IF_DATE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'재연동구분' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'UPDATE_TYPE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'재연동여부' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'UPDATE_IF_YN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'재연동일시' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'UPDATE_IF_DATE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'오류여부' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'IF_ERR_YN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'오류메시지' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'IF_ERR_MSG'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'등록일시' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF', @level2type=N'COLUMN',@level2name=N'REG_DATE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'자사몰 주문 인터페이스' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_LEADER_ORDER_IF'
GO


