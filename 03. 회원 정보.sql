-- 고객 정보(MIS 생성)
CREATE TABLE [dbo].[TB_MEMBER](
	[SEQ] [int] NOT NULL,
	[MEM_NAME] [varchar](100) NULL,
	[CST_NO] [varchar](13) NULL,
 CONSTRAINT [PK_TB_MEMBER] PRIMARY KEY CLUSTERED 
(
	[SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'일련번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER', @level2type=N'COLUMN',@level2name=N'SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'회원명' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER', @level2type=N'COLUMN',@level2name=N'MEM_NAME'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'통합고객번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER', @level2type=N'COLUMN',@level2name=N'CST_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'회원정보' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER'
GO

-- 고객 브랜드별 정보
/****** Object:  Table [dbo].[TB_CST_BRAND]    Script Date: 2021-11-04 오후 6:55:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_CST_BRAND](
	[CST_NO] [varchar](13) NOT NULL,
	[BRAND_CD] [varchar](10) NOT NULL,
	[CST_GRD_CD] [varchar](2) NULL,
	[GRD_CHNG_DD] [varchar](8) NULL,
	[IMPT_CST_CD] [varchar](2) NULL,
	[MNGM_SHOP_CD] [varchar](5) NULL,
 CONSTRAINT [PK_TB_CST_BRAND] PRIMARY KEY CLUSTERED 
(
	[CST_NO] DESC,
	[BRAND_CD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'통합고객번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_BRAND', @level2type=N'COLUMN',@level2name=N'CST_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CST_BRAND.CST_NO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_BRAND', @level2type=N'COLUMN',@level2name=N'CST_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'브랜드코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_BRAND', @level2type=N'COLUMN',@level2name=N'BRAND_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'고객등급코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_BRAND', @level2type=N'COLUMN',@level2name=N'CST_GRD_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'등급변경일자' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_BRAND', @level2type=N'COLUMN',@level2name=N'GRD_CHNG_DD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'중요고객코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_BRAND', @level2type=N'COLUMN',@level2name=N'IMPT_CST_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'관리매장코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_BRAND', @level2type=N'COLUMN',@level2name=N'MNGM_SHOP_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CST_BRAND.PK_TB_CST_BRAND' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_BRAND', @level2type=N'CONSTRAINT',@level2name=N'PK_TB_CST_BRAND'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'고객 브랜드별 정보' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_BRAND'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CST_BRAND' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_BRAND'
GO


-- 정보수정요청
/****** Object:  Table [dbo].[TB_CST_UPDT_RQST]    Script Date: 2021-11-04 오후 6:57:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_CST_UPDT_RQST](
	[RQST_SEQ] [int] IDENTITY(1,1) NOT NULL,
	[CST_NO] [varchar](13) NOT NULL,
	[RQST_SHOP] [varchar](5) NOT NULL,
	[RQST_DT] [varchar](14) NOT NULL,
	[RQST_MEMO] [varchar](1000) NULL,
 CONSTRAINT [PK_TB_CST_UPDT_RQST] PRIMARY KEY CLUSTERED 
(
	[RQST_SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'요청 일련번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_UPDT_RQST', @level2type=N'COLUMN',@level2name=N'RQST_SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'통합고객번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_UPDT_RQST', @level2type=N'COLUMN',@level2name=N'CST_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'요청매장' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_UPDT_RQST', @level2type=N'COLUMN',@level2name=N'RQST_SHOP'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'요청일시' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_UPDT_RQST', @level2type=N'COLUMN',@level2name=N'RQST_DT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'요청메모' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_UPDT_RQST', @level2type=N'COLUMN',@level2name=N'RQST_MEMO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CST_UPDT_RQST.PK_TB_CST_UPDT_RQST' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_UPDT_RQST', @level2type=N'CONSTRAINT',@level2name=N'PK_TB_CST_UPDT_RQST'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'고객정보수정요청' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_UPDT_RQST'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CST_UPDT_RQST' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_UPDT_RQST'
GO



-- 중복처리요청
/****** Object:  Table [dbo].[TB_CST_DUPL_RQST]    Script Date: 2021-11-04 오후 6:58:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_CST_DUPL_RQST](
	[RQST_SEQ] [int] NOT NULL,
	[MAIN_CST_NO] [varchar](13) NOT NULL,
	[DEL_CST_NO] [varchar](13) NOT NULL,
	[RQST_SHOP] [varchar](5) NULL,
	[RQST_DT] [varchar](14) NULL,
	[RQST_MEMO] [varchar](1000) NULL,
	[UPDT_DATE] [varchar](14) NULL,
	[UPDT_USER] [varchar](20) NULL,
	[RQST_TYPE] [char](1) NULL,
 CONSTRAINT [PK_TB_CST_DUPL_RQST] PRIMARY KEY CLUSTERED 
(
	[RQST_SEQ] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'요청일련번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DUPL_RQST', @level2type=N'COLUMN',@level2name=N'RQST_SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'주고객번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DUPL_RQST', @level2type=N'COLUMN',@level2name=N'MAIN_CST_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'삭제고객번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DUPL_RQST', @level2type=N'COLUMN',@level2name=N'DEL_CST_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'요청매장' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DUPL_RQST', @level2type=N'COLUMN',@level2name=N'RQST_SHOP'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'요청일시' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DUPL_RQST', @level2type=N'COLUMN',@level2name=N'RQST_DT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'요청메모' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DUPL_RQST', @level2type=N'COLUMN',@level2name=N'RQST_MEMO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'중복처리 구분' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DUPL_RQST', @level2type=N'COLUMN',@level2name=N'RQST_TYPE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CST_DUPL_RQST.PK_TB_CST_DUPL_RQST' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DUPL_RQST', @level2type=N'CONSTRAINT',@level2name=N'PK_TB_CST_DUPL_RQST'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'중복처리요청' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DUPL_RQST'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CST_DUPL_RQST' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DUPL_RQST'
GO


-- 탈퇴 요청
/****** Object:  Table [dbo].[TB_CST_DEL_RQST]    Script Date: 2021-11-04 오후 6:58:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_CST_DEL_RQST](
	[RQST_SEQ] [int] IDENTITY(1,1) NOT NULL,
	[CST_NO] [varchar](13) NOT NULL,
	[DEL_RQST_DVN] [varchar](1) NOT NULL,
	[RQST_SHOP] [varchar](5) NOT NULL,
	[RQST_DT] [varchar](14) NOT NULL,
	[RQST_MEMO] [varchar](1000) NULL,
 CONSTRAINT [PK_TB_CST_DEL_RQST] PRIMARY KEY CLUSTERED 
(
	[RQST_SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'요청 일련번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DEL_RQST', @level2type=N'COLUMN',@level2name=N'RQST_SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'통합고객번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DEL_RQST', @level2type=N'COLUMN',@level2name=N'CST_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'탈퇴요청구분' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DEL_RQST', @level2type=N'COLUMN',@level2name=N'DEL_RQST_DVN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'요청매장' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DEL_RQST', @level2type=N'COLUMN',@level2name=N'RQST_SHOP'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'요청일시' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DEL_RQST', @level2type=N'COLUMN',@level2name=N'RQST_DT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'요청메모' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DEL_RQST', @level2type=N'COLUMN',@level2name=N'RQST_MEMO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CST_DEL_RQST.PK_TB_CST_DEL_RQST' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DEL_RQST', @level2type=N'CONSTRAINT',@level2name=N'PK_TB_CST_DEL_RQST'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'고객정보수정요청' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DEL_RQST'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CST_DEL_RQST' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DEL_RQST'
GO



-- 고객 휴면 복구
/****** Object:  Table [dbo].[TB_CST_DRMT_RSTR]    Script Date: 2021-11-04 오후 6:59:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_CST_DRMT_RSTR](
	[CST_RETURN_SEQ] [int] IDENTITY(1,1) NOT NULL,
	[CST_NO] [varchar](13) NOT NULL,
	[REG_DATE] [datetime] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TB_CST_DRMT_RSTR] ADD  DEFAULT (getdate()) FOR [REG_DATE]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'고객휴면복구순번' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DRMT_RSTR', @level2type=N'COLUMN',@level2name=N'CST_RETURN_SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'통합고객번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DRMT_RSTR', @level2type=N'COLUMN',@level2name=N'CST_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'등록일시' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DRMT_RSTR', @level2type=N'COLUMN',@level2name=N'REG_DATE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'고객휴면복구' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DRMT_RSTR'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CST_DRMT_RSTR' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_DRMT_RSTR'
GO


-- 쿠폰 마스터 정보
/****** Object:  Table [dbo].[TB_CPN_MST]    Script Date: 2021-11-04 오후 7:00:18 ******/
CREATE TABLE [dbo].[TB_CPN_MST](
	[COUPON_ID] [varchar](10) NOT NULL,
	[COUPON_NM] [varchar](200) NOT NULL,
	[COUPON_TYPE_CD] [char](2) NOT NULL,
	[COUPON_DVN_CD] [char](2) NOT NULL,
	[RAND_NO] [varchar](5) NULL,
	[NCST_USABLE_YN] [varchar](1) NULL,
	[COUPON_AMT] [float] NULL,
	[MIN_BUY_AMT] [numeric](38, 0) NULL,
	[MAX_BUY_AMT] [numeric](38, 0) NULL,
	[MAX_SALE_AMT] [numeric](38, 0) NULL,
	[MIN_BUY_CNT] [numeric](38, 0) NULL,
	[AGE] [numeric](38, 0) NULL,
	[IMPT_CST_CD] [varchar](2) NULL,
	[USABLE_CHNL] [varchar](100) NULL,
	[COUPON_USE_RANG] [varchar](2) NULL,
	[RWD_COUPON_YN] [varchar](1) NULL,
	[DUPL_COUPON_YN] [varchar](1) NULL,
	[USE_YN] [varchar](1) NULL,
	[EXPR_OPT] [char](2) NULL,
	[EXPR_VAL] [numeric](10, 0) NULL,
	[EXPR_STRT_DD] [varchar](8) NULL,
	[EXPR_END_DD] [varchar](8) NULL,
	[TRGT_SHOP_TYPE_CD] [varchar](1) NULL,
	[TRGT_PROD_TYPE_CD] [varchar](1) NULL,
	[TRGT_ITEM_TYPE_CD] [varchar](1) NULL,
	[TRGT_PROD_BRAND_TYPE_CD] [varchar](1) NULL,
	[COUPON_DESCRPT] [varchar](3000) NULL,
	[STRT_AGE] [numeric](18, 0) NULL,
	[END_AGE] [numeric](18, 0) NULL,
	[COUPON_CHNL_CD] [char](2) NULL,
 CONSTRAINT [PK_TB_CPN_MST] PRIMARY KEY CLUSTERED 
(
	[COUPON_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'쿠폰ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'COUPON_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CPN_MST.COUPON_ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'COUPON_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'쿠폰명' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'COUPON_NM'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CPN_MST.COUPON_NM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'COUPON_NM'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'쿠폰유형' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'COUPON_TYPE_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CPN_MST.COUPON_TYPE_CD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'COUPON_TYPE_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'쿠폰구분' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'COUPON_DVN_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CPN_MST.COUPON_DVN_CD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'COUPON_DVN_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'난수번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'RAND_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'비회원사용가능여부' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'NCST_USABLE_YN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'쿠폰금액' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'COUPON_AMT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CPN_MST.COUPON_AMT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'COUPON_AMT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'최소구매금액' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'MIN_BUY_AMT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CPN_MST.MIN_BUY_AMT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'MIN_BUY_AMT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'최대구매금액' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'MAX_BUY_AMT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'최대할인금액' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'MAX_SALE_AMT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CPN_MST.MAX_SALE_AMT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'MAX_SALE_AMT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'최소구매수량' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'MIN_BUY_CNT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'나이' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'AGE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'우수고객코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'IMPT_CST_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'사용가능채널' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'USABLE_CHNL'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CPN_MST.USABLE_CHNL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'USABLE_CHNL'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'쿠폰사용범위' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'COUPON_USE_RANG'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'보상형쿠폰여부' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'RWD_COUPON_YN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'중복쿠폰여부' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'DUPL_COUPON_YN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CPN_MST.DUPL_COUPON_YN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'DUPL_COUPON_YN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'사용여부' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'USE_YN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CPN_MST.USE_YN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'USE_YN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'유효기간옵션' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'EXPR_OPT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CPN_MST.EXPR_OPT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'EXPR_OPT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'유효기간값' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'EXPR_VAL'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CPN_MST.EXPR_VAL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'EXPR_VAL'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'유효기간시작일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'EXPR_STRT_DD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CPN_MST.EXPR_STRT_DD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'EXPR_STRT_DD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'유효기간종료일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'EXPR_END_DD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CPN_MST.EXPR_END_DD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'EXPR_END_DD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'대상매장유형' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'TRGT_SHOP_TYPE_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CPN_MST.TRGT_SHOP_TYPE_CD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'TRGT_SHOP_TYPE_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'대상상품유형' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'TRGT_PROD_TYPE_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CPN_MST.TRGT_PROD_TYPE_CD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'TRGT_PROD_TYPE_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'대상품목유형' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'TRGT_ITEM_TYPE_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CPN_MST.TRGT_ITEM_TYPE_CD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'TRGT_ITEM_TYPE_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'대상상품브랜드유형' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'TRGT_PROD_BRAND_TYPE_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'쿠폰설명' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'COUPON_DESCRPT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CPN_MST.COUPON_DESCRPT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'COUPON_DESCRPT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'쿠폰채널' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST', @level2type=N'COLUMN',@level2name=N'COUPON_CHNL_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'쿠폰 마스터 정보' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CPN_MST' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_MST'
GO



-- 쿠폰 사은품 정보
/****** Object:  Table [dbo].[TB_CPN_GIFT]    Script Date: 2021-11-04 오후 7:00:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_CPN_GIFT](
	[COUPON_ID] [varchar](10) NOT NULL,
	[PROD_CD] [varchar](80) NOT NULL,
 CONSTRAINT [PK_TB_CPN_GIFT] PRIMARY KEY CLUSTERED 
(
	[COUPON_ID] ASC,
	[PROD_CD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'쿠폰ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_GIFT', @level2type=N'COLUMN',@level2name=N'COUPON_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CPN_GIFT.COUPON_ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_GIFT', @level2type=N'COLUMN',@level2name=N'COUPON_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'상품코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_GIFT', @level2type=N'COLUMN',@level2name=N'PROD_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CPN_GIFT.PROD_CD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_GIFT', @level2type=N'COLUMN',@level2name=N'PROD_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'쿠폰 사은품 정보' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_GIFT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CPN_GIFT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_GIFT'
GO


-- 쿠폰 제약조건 정보
/****** Object:  Table [dbo].[TB_CPN_CNST]    Script Date: 2021-11-04 오후 7:01:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_CPN_CNST](
	[COUPON_ID] [varchar](10) NOT NULL,
	[TRGT_TYPE_CD] [varchar](2) NOT NULL,
	[TRGT_VAL] [varchar](120) NOT NULL,
 CONSTRAINT [PK_TB_CPN_CNST] PRIMARY KEY CLUSTERED 
(
	[COUPON_ID] ASC,
	[TRGT_TYPE_CD] ASC,
	[TRGT_VAL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'쿠폰ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_CNST', @level2type=N'COLUMN',@level2name=N'COUPON_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CPN_CNST.COUPON_ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_CNST', @level2type=N'COLUMN',@level2name=N'COUPON_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'대상유형' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_CNST', @level2type=N'COLUMN',@level2name=N'TRGT_TYPE_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CPN_CNST.TRGT_TYPE_CD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_CNST', @level2type=N'COLUMN',@level2name=N'TRGT_TYPE_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'대상값' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_CNST', @level2type=N'COLUMN',@level2name=N'TRGT_VAL'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CPN_CNST.TRGT_VAL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_CNST', @level2type=N'COLUMN',@level2name=N'TRGT_VAL'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'쿠폰 사은품 정보' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_CNST'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CPN_CNST' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CPN_CNST'
GO



-- 고객 쿠폰 정보
/****** Object:  Table [dbo].[TB_CST_CPN]    Script Date: 2021-11-04 오후 7:01:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_CST_CPN](
	[COUPON_SEQ_NO] [varchar](30) NOT NULL,
	[COUPON_ID] [varchar](10) NOT NULL,
	[COUPON_ISSUE_DD] [varchar](8) NOT NULL,
	[RAND_NO] [varchar](10) NULL,
	[CST_NO] [varchar](13) NULL,
	[CMPG_NO] [varchar](14) NULL,
	[EXPR_STRT_DD] [varchar](8) NULL,
	[EXPR_END_DD] [varchar](8) NULL,
	[COUPON_STAT_CD] [char](2) NULL,
	[STAT_CHNG_DT] [varchar](14) NULL,
	[USE_CHNL_CD] [char](2) NULL,
	[EVENT_NM] [varchar](300) NULL,
	[EVENT_NO] [varchar](20) NULL,
 CONSTRAINT [PK_TB_CST_CPN] PRIMARY KEY CLUSTERED 
(
	[COUPON_SEQ_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'쿠폰발행번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_CPN', @level2type=N'COLUMN',@level2name=N'COUPON_SEQ_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'쿠폰ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_CPN', @level2type=N'COLUMN',@level2name=N'COUPON_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'쿠폰발행일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_CPN', @level2type=N'COLUMN',@level2name=N'COUPON_ISSUE_DD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'난수번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_CPN', @level2type=N'COLUMN',@level2name=N'RAND_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'통합고객번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_CPN', @level2type=N'COLUMN',@level2name=N'CST_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'캠페인번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_CPN', @level2type=N'COLUMN',@level2name=N'CMPG_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'유효기간시작일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_CPN', @level2type=N'COLUMN',@level2name=N'EXPR_STRT_DD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'유효기간종료일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_CPN', @level2type=N'COLUMN',@level2name=N'EXPR_END_DD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'쿠폰상태' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_CPN', @level2type=N'COLUMN',@level2name=N'COUPON_STAT_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'상태변경일시' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_CPN', @level2type=N'COLUMN',@level2name=N'STAT_CHNG_DT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'쿠폰사용채널코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_CPN', @level2type=N'COLUMN',@level2name=N'USE_CHNL_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'이벤트명' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_CPN', @level2type=N'COLUMN',@level2name=N'EVENT_NM'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'이벤트번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_CPN', @level2type=N'COLUMN',@level2name=N'EVENT_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'고객 쿠폰 정보' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_CPN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CST_CPN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_CPN'
GO


-- 고객 포인트 정보
/****** Object:  Table [dbo].[TB_CST_POINT]    Script Date: 2021-11-04 오후 7:02:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_CST_POINT](
	[CST_NO] [varchar](13) NOT NULL,
	[CST_POINT] [numeric](10, 0) NOT NULL,
	[CST_EARN_POINT] [numeric](10, 0) NULL,
 CONSTRAINT [PK_TB_CST_POINT] PRIMARY KEY CLUSTERED 
(
	[CST_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'통합고객번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_POINT', @level2type=N'COLUMN',@level2name=N'CST_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'발생_포인트' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_POINT', @level2type=N'COLUMN',@level2name=N'CST_POINT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'고객 포인트 정보' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_POINT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CST_POINT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_POINT'
GO


-- 고객 포인트 정보
/****** Object:  Table [dbo].[TB_CST_POINT_HIST]    Script Date: 2021-11-04 오후 7:03:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_CST_POINT_HIST](
	[POINT_SEQNO] [int] NOT NULL,
	[CST_NO] [varchar](13) NOT NULL,
	[POINT_DVN] [varchar](2) NOT NULL,
	[OCCR_CHNL_CD] [varchar](14) NOT NULL,
	[OCCR_SHOP_CD] [varchar](14) NULL,
	[OCCR_DT] [varchar](14) NOT NULL,
	[OCCR_POINT] [numeric](10, 0) NOT NULL,
	[REMK] [varchar](2000) NULL,
	[REL_CMPG_NO] [varchar](14) NULL,
	[REL_SALES_NO] [varchar](20) NULL,
 CONSTRAINT [PK_TB_CST_POINT_HIST] PRIMARY KEY CLUSTERED 
(
	[POINT_SEQNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'통합고객번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_POINT_HIST', @level2type=N'COLUMN',@level2name=N'CST_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'포인트_구분' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_POINT_HIST', @level2type=N'COLUMN',@level2name=N'POINT_DVN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'발생_채널_코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_POINT_HIST', @level2type=N'COLUMN',@level2name=N'OCCR_CHNL_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'발생_매장_코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_POINT_HIST', @level2type=N'COLUMN',@level2name=N'OCCR_SHOP_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'발생_일시' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_POINT_HIST', @level2type=N'COLUMN',@level2name=N'OCCR_DT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'발생_포인트' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_POINT_HIST', @level2type=N'COLUMN',@level2name=N'OCCR_POINT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'비고' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_POINT_HIST', @level2type=N'COLUMN',@level2name=N'REMK'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'관련_캠페인_번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_POINT_HIST', @level2type=N'COLUMN',@level2name=N'REL_CMPG_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'관련_매출_번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_POINT_HIST', @level2type=N'COLUMN',@level2name=N'REL_SALES_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'고객 포인트 정보' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_POINT_HIST'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_CST_POINT_HIST' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_CST_POINT_HIST'
GO


-- 회원 메모
/****** Object:  Table [dbo].[TB_MEMBER_MEMO]    Script Date: 2021-11-05 오후 4:56:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_MEMBER_MEMO](
	[SEQ] [int] IDENTITY(1,1) NOT NULL,
	[MEM_SEQ] [int] NOT NULL,
	[STORE_ID] [char](3) NOT NULL,
	[MEMO_DATE] [smalldatetime] NOT NULL,
	[MEMO] [nvarchar](100) NULL,
	[REG_DATE] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_TB_MEMBER_MEMO] PRIMARY KEY CLUSTERED 
(
	[SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TB_MEMBER_MEMO] ADD  CONSTRAINT [DF_MemberMemo_RegDate]  DEFAULT (getdate()) FOR [REG_DATE]
GO


-- 링크 발송 이력
/****** Object:  Table [dbo].[TB_JOIN_LINK_SEND_HISTORY]    Script Date: 2021-11-10 오후 3:57:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_JOIN_LINK_SEND_HISTORY](
	[SEQ] [numeric](10, 0) IDENTITY(1,1) NOT NULL,
	[SHOP_CD] [varchar](5) NOT NULL,
	[MOBILE_NO] [varchar](20) NOT NULL,
	[BRAND_CD] [varchar](10) NOT NULL,
	[R_VAL] [varchar](1) NULL,
	[REG_DATE] [date] NOT NULL,
 CONSTRAINT [PK_TB_JOIN_LINK_SEND_HISTORY] PRIMARY KEY CLUSTERED 
(
	[SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'순번' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_JOIN_LINK_SEND_HISTORY', @level2type=N'COLUMN',@level2name=N'SEQ'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'매장코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_JOIN_LINK_SEND_HISTORY', @level2type=N'COLUMN',@level2name=N'SHOP_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'휴대전화번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_JOIN_LINK_SEND_HISTORY', @level2type=N'COLUMN',@level2name=N'MOBILE_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'브랜드코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_JOIN_LINK_SEND_HISTORY', @level2type=N'COLUMN',@level2name=N'BRAND_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'결과값' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_JOIN_LINK_SEND_HISTORY', @level2type=N'COLUMN',@level2name=N'R_VAL'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'등록일시' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_JOIN_LINK_SEND_HISTORY', @level2type=N'COLUMN',@level2name=N'REG_DATE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_JOIN_LINK_SEND_HISTORY' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_JOIN_LINK_SEND_HISTORY'
GO