-- 고객 정보(CRM 생성)
/****** Object:  Table [dbo].[TB_MEMBER]    Script Date: 2022-09-06 오전 10:34:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_MEMBER](
	[SEQ] [int] IDENTITY(1,1) NOT NULL,
	[MEM_NAME] [varchar](100) NULL,
	[STORE_ID] [char](3) NOT NULL,
	[GRADE] [tinyint] NULL,
	[ADDRESS1] [varchar](200) NULL,
	[ADDRESS2] [varchar](200) NULL,
	[ZIP_CODE] [varchar](7) NULL,
	[TEL0] [varchar](3) NULL,
	[TEL1] [varchar](4) NULL,
	[TEL2] [varchar](4) NULL,
	[MOBILE0] [varchar](3) NULL,
	[MOBILE1] [varchar](4) NULL,
	[MOBILE2] [varchar](4) NULL,
	[BIRTH_DATE] [varchar](10) NULL,
	[BIRTH_TYPE] [varchar](4) NULL,
	[MARRY_DATE] [varchar](10) NULL,
	[IS_MARRY] [varchar](4) NULL,
	[EMAIL] [varchar](152) NULL,
	[JOB] [tinyint] NULL,
	[OFFICE_ADDRESS1] [varchar](200) NULL,
	[OFFICE_ADDRESS2] [varchar](200) NULL,
	[OFFICE_ZIP_CODE] [varchar](7) NULL,
	[OFFICE_TEL0] [varchar](3) NULL,
	[OFFICE_TEL1] [varchar](4) NULL,
	[OFFICE_TEL2] [varchar](4) NULL,
	[DM] [char](3) NULL,
	[ACTIVE] [char](1) NULL,
	[REG_DATE] [smalldatetime] NOT NULL,
	[MEM_ID] [int] NULL,
	[GENDER] [varchar](10) NULL,
	[AGE] [tinyint] NULL,
	[FROM_OLD] [varchar](10) NULL,
	[OLD_ID] [int] NULL,
	[CST_NO] [varchar](13) NULL,
	[AGREE_YN] [char](1) NULL,
	[AUTH_YN] [varchar](1) NULL,
	[JOIN_MTHD_CD] [varchar](2) NULL,
	[JOIN_BRAND_CD] [varchar](10) NULL,
	[JOIN_DD] [varchar](8) NULL,
	[MNGM_BRAND_CD] [varchar](10) NULL,
	[DUPL_INFO_YN] [varchar](1) NULL,
	[CST_NK_NM] [varchar](100) NULL,
	[SEX_CD] [char](1) NULL,
	[MOBILE_NO] [varchar](100) NULL,
	[SOLA_LUNA_CD] [char](1) NULL,
	[FRNR_TYPE_CD] [char](1) NULL,
	[CST_DVN] [varchar](2) NULL,
	[CST_MEMO] [varchar](1000) NULL,
	[DRMT_YN] [char](1) NULL,
	[DEL_YN] [char](1) NULL,
 CONSTRAINT [PK_TB_MEMBER_D1] PRIMARY KEY CLUSTERED 
(
	[SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TB_MEMBER] ADD  CONSTRAINT [DF_TB_MEMBER_ACTIVE_D1]  DEFAULT ('A') FOR [ACTIVE]
GO

ALTER TABLE [dbo].[TB_MEMBER] ADD  CONSTRAINT [DF_TB_MEMBER_REGDATE_D1]  DEFAULT (getdate()) FOR [REG_DATE]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'가입매장코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER', @level2type=N'COLUMN',@level2name=N'STORE_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'휴대전화끝네자리' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER', @level2type=N'COLUMN',@level2name=N'MOBILE2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'통합고객번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER', @level2type=N'COLUMN',@level2name=N'CST_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'고객통합동의여부' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER', @level2type=N'COLUMN',@level2name=N'AGREE_YN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'인증여부' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER', @level2type=N'COLUMN',@level2name=N'AUTH_YN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'가입경로코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER', @level2type=N'COLUMN',@level2name=N'JOIN_MTHD_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'가입브랜드코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER', @level2type=N'COLUMN',@level2name=N'JOIN_BRAND_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'가입일자' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER', @level2type=N'COLUMN',@level2name=N'JOIN_DD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'관리브랜드코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER', @level2type=N'COLUMN',@level2name=N'MNGM_BRAND_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'중복정보여부' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER', @level2type=N'COLUMN',@level2name=N'DUPL_INFO_YN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'고객닉네임' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER', @level2type=N'COLUMN',@level2name=N'CST_NK_NM'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'성별코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER', @level2type=N'COLUMN',@level2name=N'SEX_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'휴대전화번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER', @level2type=N'COLUMN',@level2name=N'MOBILE_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'양음구분' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER', @level2type=N'COLUMN',@level2name=N'SOLA_LUNA_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'내외국인유형코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER', @level2type=N'COLUMN',@level2name=N'FRNR_TYPE_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'고객구분' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER', @level2type=N'COLUMN',@level2name=N'CST_DVN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'고객메모' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER', @level2type=N'COLUMN',@level2name=N'CST_MEMO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'휴면여부' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER', @level2type=N'COLUMN',@level2name=N'DRMT_YN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'탈퇴여부' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER', @level2type=N'COLUMN',@level2name=N'DEL_YN'
GO

-- 휴면 고객(CRM 생성)
/****** Object:  Table [dbo].[TB_MEMBER_REST]    Script Date: 2022-09-06 오전 10:34:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_MEMBER_REST](
	[CST_NO] [varchar](13) NOT NULL,
	[AGREE_YN] [char](1) NULL,
	[AUTH_YN] [varchar](1) NULL,
	[JOIN_MTHD_CD] [varchar](2) NULL,
	[JOIN_BRAND_CD] [varchar](10) NULL,
	[JOIN_DD] [varchar](8) NULL,
	[JOIN_SHOP_CD] [varchar](5) NULL,
	[MNGM_BRAND_CD] [varchar](10) NULL,
	[DUPL_INFO_YN] [varchar](1) NULL,
	[CST_NM] [varchar](100) NULL,
	[CST_NK_NM] [varchar](100) NULL,
	[SEX_CD] [char](1) NULL,
	[BRTH_DT] [varchar](10) NULL,
	[SOLA_LUNA_CD] [char](1) NULL,
	[MOBILE_NO] [varchar](100) NULL,
	[MOBILE_4END_NO] [varchar](6) NULL,
	[POST_NO] [varchar](7) NULL,
	[ADDR1] [varchar](200) NULL,
	[ADDR2] [varchar](200) NULL,
	[FRNR_TYPE_CD] [char](1) NULL,
	[CST_DVN] [varchar](2) NULL,
	[CST_MEMO] [varchar](1000) NULL,
	[DRMT_YN] [char](1) NULL,
	[DEL_YN] [char](1) NULL,
	[SEQ] [int] NULL,
 CONSTRAINT [PK_TB_MEMBER_REST] PRIMARY KEY CLUSTERED 
(
	[CST_NO] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TB_MEMBER_REST] ADD  CONSTRAINT [DF_TB_MEMBER_R_AGREE__01299DCE]  DEFAULT ('N') FOR [AGREE_YN]
GO

ALTER TABLE [dbo].[TB_MEMBER_REST] ADD  CONSTRAINT [DF_TB_MEMBER_R_DUPL___021DC207]  DEFAULT ('N') FOR [DUPL_INFO_YN]
GO

ALTER TABLE [dbo].[TB_MEMBER_REST] ADD  CONSTRAINT [DF_TB_MEMBER_R_SOLA___0311E640]  DEFAULT ('S') FOR [SOLA_LUNA_CD]
GO

ALTER TABLE [dbo].[TB_MEMBER_REST] ADD  CONSTRAINT [DF_TB_MEMBER_R_DRMT___04060A79]  DEFAULT ('N') FOR [DRMT_YN]
GO

ALTER TABLE [dbo].[TB_MEMBER_REST] ADD  CONSTRAINT [DF_TB_MEMBER_R_DEL_Y__04FA2EB2]  DEFAULT ('N') FOR [DEL_YN]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'통합고객번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'CST_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_MEMBER_REST.CST_NO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'CST_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'고객통합동의여부' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'AGREE_YN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_MEMBER_REST.AGREE_YN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'AGREE_YN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'인증여부' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'AUTH_YN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'가입경로코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'JOIN_MTHD_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_MEMBER_REST.JOIN_MTHD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'JOIN_MTHD_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'가입브랜드코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'JOIN_BRAND_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'가입일자' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'JOIN_DD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_MEMBER_REST.JOIN_DD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'JOIN_DD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'가입매장코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'JOIN_SHOP_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_MEMBER_REST.HP_JOIN_YN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'JOIN_SHOP_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'관리브랜드코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'MNGM_BRAND_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_MEMBER_REST.PAY_JOIN_YN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'MNGM_BRAND_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'중복정보여부' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'DUPL_INFO_YN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'고객명' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'CST_NM'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_MEMBER_REST.CST_NM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'CST_NM'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'성별코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'SEX_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_MEMBER_REST.SEX_CD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'SEX_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'생년월일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'BRTH_DT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_MEMBER_REST.BRTH_DT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'BRTH_DT'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'양음구분' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'SOLA_LUNA_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_MEMBER_REST.SOLA_LUNA_CD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'SOLA_LUNA_CD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'휴대전화번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'MOBILE_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_MEMBER_REST.MOBILE_NO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'MOBILE_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'휴대전화끝네자리' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'MOBILE_4END_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_MEMBER_REST.MOBILE_4END_NO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'MOBILE_4END_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'우편번호' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'POST_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_MEMBER_REST.POST_NO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'POST_NO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'주소1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'ADDR1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_MEMBER_REST.ADDR1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'ADDR1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'주소2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'ADDR2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_MEMBER_REST.ADDR2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'ADDR2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'고객구분' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'CST_DVN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'고객메모' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'CST_MEMO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_MEMBER_REST.CST_MEMO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'CST_MEMO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'휴면여부' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'DRMT_YN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_MEMBER_REST.DRMT_YN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'DRMT_YN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'탈퇴여부' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'DEL_YN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_MEMBER_REST.DEL_YN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'COLUMN',@level2name=N'DEL_YN'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_MEMBER_REST.PK_TB_MEMBER_REST' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST', @level2type=N'CONSTRAINT',@level2name=N'PK_TB_MEMBER_REST'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'고객 정보' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'WRCRM.TB_MEMBER_REST' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TB_MEMBER_REST'
GO