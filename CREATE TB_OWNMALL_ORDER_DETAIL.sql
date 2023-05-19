USE [WOORIM_230215]
GO

/****** Object:  Table [dbo].[TB_OWNMALL_ORDER_DETAIL]    Script Date: 2023-02-15 ���� 11:20:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_OWNMALL_ORDER_DETAIL](
	[SEQ] [int] IDENTITY(1,1) NOT NULL,
	[ORDER_NO] [varchar](100) NOT NULL,
	[SALES_TYPE] [tinyint] NOT NULL,
	[ORDER_SEQ] [int] NOT NULL,
	[ORDER_IF_SEQ] [int] NOT NULL,
	[ORDER_DETAIL_IF_SEQ] [int] NOT NULL,
	[REFUND_ORDER_IF_SEQ] [int] NULL,
	[REFUND_ORDER_DETAIL_IF_SEQ] [int] NULL,
	[REFUND_YN] [char](1) NULL,
	[ORDER_DATE] [smalldatetime] NOT NULL,
	[STORE_SEQ] [int] NOT NULL,
	[STORE_NM] [varchar](50) NULL,
	[CST_TYPE] [char](1) NULL,
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
	[NOR_PRICE] [int] NULL,
	[UNIT_PRICE] [int] NULL,
	[QTY] [int] NULL,
	[PRICE] [int] NULL,
	[PRICE_FOB] [numeric](9, 4) NULL,
	[EVENT_STORE_SEQ] [int] NULL,
	[SELL_PRICE] [int] NULL,
	[SELL_PRICE_FOB] [numeric](9, 4) NULL,
	[PAY_AMT] [int] NULL,
	[PAY_AMT_FOB] [numeric](9, 4) NULL,
	[LOSS_PRICE] [int] NULL,
	[DISCOUNT_RATE] [numeric](18, 0) NULL,
	[BRAND_SEQ] [int] NULL,
	[BRAND_NM] [varchar](30) NULL,
	[OWNMALL_PRODUCT_SEQ] [int] NULL,
	[OWNMALL_MODEL_NO] [varchar](200) NULL,
	[OWNMALL_MODEL_NAME] [varchar](200) NULL,
	[PRODUCT_SEQ] [int] NULL,
	[OPT_CD] [char](1) NULL,
	[OPT_NM] [varchar](100) NULL,
	[OPT_PRICE] [int] NULL,
	[OPT_PRICE_FOB] [numeric](9, 4) NULL,
	[BUYER_NM] [varchar](100) NULL,
	[BUYER_MOBILE_NUM] [varchar](100) NULL,
	[RECEIVER_NM] [varchar](100) NULL,
	[RECEIVER_MOBILE_NUM] [varchar](100) NULL,
	[POST_NUM] [varchar](10) NULL,
	[ADDRESS] [varchar](200) NULL,
	[DELIVER_MSG] [varchar](200) NULL,
	[ORD_DESC] [varchar](100) NULL,
	[REFUND_DATE] [smalldatetime] NULL,
	[REFUND_REASON] [tinyint] NULL,
	[REFUND_PRICE] [int] NULL,
	[REFUND_LOST_PRICE] [int] NULL,
	[PRICE_CHANGE_REASON] [varchar](200) NULL,
	[CLAIM_TYPE] [varchar](200) NULL,
	[CLAIM_CODE] [varchar](17) NULL,
	[CLAIM_TEXT] [text] NULL,
	[SALES_NO] [varchar](20) NULL,
	[SALES_DETAIL_NO] [varchar](20) NULL,
	[REFUND_SALES_NO] [varchar](20) NULL,
	[REFUND_SALES_DETAIL_NO] [varchar](20) NULL,
	[PAY_DATE] [smalldatetime] NULL,
	[PAY_TYPE] [varchar](20) NULL,
	[DELIVER_END_DATE] [smalldatetime] NULL,
	[DELIVER_PRICE] [int] NULL,
	[DELIVER_PRICE_FOB] [numeric](9, 4) NULL,
	[EXCHANGE_RATE] [numeric](9, 4) NULL,
	[SHOP_NO] [char](1) NULL,
	[ECOM_ORDER_SEQ] [int] NULL,
	[REG_DATE] [smalldatetime] NOT NULL,
	[MOD_DATE] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_TB_OWNMALL_ORDER_DETAIL_SEQ] PRIMARY KEY CLUSTERED 
(
	[SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ֹ���ȣ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'ORDER_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ǹ�Ÿ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'SALES_TYPE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ֹ���ȣ�� ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'ORDER_SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ֹ� IF ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'ORDER_IF_SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ֹ��� IF ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'ORDER_DETAIL_IF_SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ǰ �ֹ� IF ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'REFUND_ORDER_IF_SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ǰ �ֹ��� IF ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'REFUND_ORDER_DETAIL_IF_SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ǰ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'REFUND_YN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ֹ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'ORDER_DATE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����SEQ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'STORE_SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'STORE_NM'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ȸ����������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'CST_TYPE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���հ�����ȣ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'CST_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������Ʈ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'SAVE_POINT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������Ʈ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'USE_POINT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������յ��ǿ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'AGREE_YN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������ڵ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'CST_GRD_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������αݾ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'GRD_SALE_AMT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������αݾ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'BIZ_SALE_AMT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������αݾ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'COUPON_SALE_AMT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���������ݾ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'DIF_ADJ_AMT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���������ݾ�(�ؿܸ�)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'DIF_ADJ_AMT_FOB'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'DIF_ADJ_REASON'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Һ��ڴܰ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'NOR_PRICE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ǸŴܰ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'UNIT_PRICE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'QTY'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Һ��ڰ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'PRICE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Һ��ڰ�(�ؿܸ�)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'PRICE_FOB'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���θ����ȣ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'EVENT_STORE_SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ǸŰ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'SELL_PRICE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ǸŰ�(�ؿܸ�)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'SELL_PRICE_FOB'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ݾ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'PAY_AMT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ݾ�(�ؿܸ�)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'PAY_AMT_FOB'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�սǰ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'LOSS_PRICE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���η�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'DISCOUNT_RATE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�귣�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'BRAND_SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�귣���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'BRAND_NM'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ڻ�� ��ǰ ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'OWNMALL_PRODUCT_SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ڻ�� MODEL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'OWNMALL_MODEL_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ڻ�� MODEL ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'OWNMALL_MODEL_NAME'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ǰ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'PRODUCT_SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�⼺/�ֹ�����/���ּ��� ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'OPT_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ɼ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'OPT_NM'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ɼǰ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'OPT_PRICE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ɼǰ�(�ؿܸ�)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'OPT_PRICE_FOB'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'BUYER_NM'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ ����ó' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'BUYER_MOBILE_NUM'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'RECEIVER_NM'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ ����ó' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'RECEIVER_MOBILE_NUM'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ȣ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'POST_NUM'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ּ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'ADDRESS'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��۸޼���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'DELIVER_MSG'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'ORD_DESC'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ǰ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'REFUND_DATE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ǰ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'REFUND_REASON'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ǰ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'REFUND_PRICE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ǰ�սǰ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'REFUND_LOST_PRICE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ݺ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'PRICE_CHANGE_REASON'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ŭ���� Ÿ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'CLAIM_TYPE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ŭ�����ڵ� ��ȣ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'CLAIM_CODE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ŭ���� ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'CLAIM_TEXT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ȣ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'SALES_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����󼼹�ȣ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'SALES_DETAIL_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ǰ�����ȣ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'REFUND_SALES_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ǰ����󼼹�ȣ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'REFUND_SALES_DETAIL_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'PAY_DATE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'PAY_TYPE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ۿϷ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'DELIVER_END_DATE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ۺ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'DELIVER_PRICE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ۺ�(�ؿܸ�)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'DELIVER_PRICE_FOB'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ȯ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'EXCHANGE_RATE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ؿ� ���θ� ���� ��ȣ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'SHOP_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ECOM�ֹ���ȣ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'ECOM_ORDER_SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����Ͻ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'REG_DATE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����Ͻ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL', @level2type=N'COLUMN',@level2name=N'MOD_DATE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ڻ�� �ֹ� ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_OWNMALL_ORDER_DETAIL'
GO

