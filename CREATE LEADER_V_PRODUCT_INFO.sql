USE [WOORIM_230215]
GO

/****** Object:  View [dbo].[LEADER_V_PRODUCT_INFO]    Script Date: 2023-02-21 오전 11:24:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[LEADER_V_PRODUCT_INFO] 
AS
SELECT	AA.PRODUCT_SEQ,			-- 상품SEQ
		AA.BRAND_NAME,			-- 브랜드명 
		AA.MODEL_NO,			-- ERP 품번
		AA.MODEL_NM,			-- 자사몰 모델명(이커머스전용 모델명)
		AA.GUBUN,				-- 시계/주얼리 구분
		-- ▼ 고시정보 ▼
		AA.CATEGORY,			-- 공통)   구성(품목)
		AA.METALTYPE,			-- 공통)   소재(시계:밴드, 주얼리:금속)
		AA.MOVEMENT,			-- 시계)   무브먼트
		AA.GALSS,				-- 시계)   유리
		AA.DIAL,				-- 시계)   문자판
		AA.STONESMALLGROUP,		-- 주얼리) 스톤소재
		AA.STONE,				-- 주얼리) 스톤
		CASE WHEN AA.CATEGORY = 'WATCH' 
			 THEN AA.W_WEIGHT
			 ELSE AA.J_WEIGHT	
		 END	AS [WEIGHT],	-- 공통)   중량 
		AA.SIZE,				-- 공통)   사이즈
		AA.REMARK				-- 공통)   주요사양
								
  FROM 							
	(
		SELECT	P.SEQ					AS PRODUCT_SEQ	-- 상품SEQ
			  , B.BRANDNAME				AS BRAND_NAME	-- 브랜드명 
			  , A.MODEL_NO				AS MODEL_NO		-- 모델번호(NEW MODELNO)
			  , A.MODEL_NM				AS MODEL_NM		-- 자사몰 모델명(이커머스전용 모델명)
			  , P.ERP_GRP_MFG			AS GUBUN		-- 시계:1, 주얼리:2
			  -- ▼ 고시정보 ▼
			  , ECD1.CD_SYSDEF			AS CATE_CD		-- 카테고리 코드 
			  , CASE WHEN P.ERP_GRP_MFG = 1				-- 로즈몽시계:129, 로즈몽주얼리:198, 스톤헨지:89
					 THEN 'WATCH'						-- 스톤헨지도 시계상품 있지만 무!적!권 주얼리로 취급한다고 함..
			         ELSE ECD1.NM_SYSDEF					
				 END					AS CATEGORY		-- 1. 구성

			  , CASE WHEN P.ERP_GRP_MFG = 1 THEN ECD3.NM_SYSDEF	-- 시계  : 소재(밴드)
					 ELSE S.METALTYPE							-- 주얼리: 금속
				 END AS METALTYPE						-- 2. 소재
			  , P.MOVEMENT				AS MOVEMENT		-- 3. 시계)무브먼트
			  , ECD2.NM_SYSDEF			AS GALSS		-- 4. 시계)유리
			  , CB.[NAME]				AS DIAL			-- 5. 시계)문자판

			  , S.STONESMALLGROUP						-- 6. 스톤소재
			  , S.STONE									-- 7. 스톤
			  , P.jungae									AS W_WEIGHT	-- 시계중량
			  , ISNULL(PJD.TAGMETALWEIGHT, S.METALWEIGHT)	AS J_WEIGHT -- 주얼리 택중량
			  , CASE WHEN P.ERP_GRP_MFG = 1 THEN CASESIZE -- 시계  : 케이스 사이즈
			         ELSE S.SIZE						 -- 주얼리: 사이즈
				 END AS SIZE							-- 9. 사이즈

			  ,	CASE WHEN P.ERP_GRP_MFG = 1 THEN P.ETCNOTE					-- 시계:기타
					 WHEN ECD1.CD_SYSDEF IN ('209','204','211') THEN S.ETC	-- 209:Piercing,204:Couple ring,211:WATCH
	 				 WHEN ECD1.CD_SYSDEF = '205' THEN BIGO					-- 205:Earrings
				ELSE ''
				 END AS 'REMARK'						-- 10. 주요사양
		  FROM LEADER_PRODUCT_IF A  
		 INNER JOIN WOORIM.dbo.PRODUCT				P	ON A.MODEL_NO = P.ERP_CD_ITEM
		 INNER JOIN BRANDNAME						B	ON P.BRANDSEQ = B.SEQ
		 INNER JOIN TB_OWNMALL_BRAND_STORE_MAPPING	BSM ON BSM.BRAND_SEQ = B.SEQ  
		  LEFT JOIN WOORIM.dbo.STYLEBOOK			S	ON S.PROSEQ = P.SEQ
		  LEFT JOIN PRODUCT_JEWELRY_DTL				PJD ON P.SEQ = PJD.PROSEQ
		  LEFT JOIN WOORIM.dbo.CODEBOOK				CB	ON P.DIAL = CB.VALUE AND CB.CODE = 'WATCHDIAL'
		  LEFT JOIN WOORIM.dbo.PRODUCT_DTL			PD	ON P.SEQ = PD.PROSEQ		  
		  LEFT JOIN WOORIM.dbo.ERP_CODE_DTL			ECD1 ON ECD1.CD_SYSDEF = P.ERP_CLS_L AND ECD1.CD_FIELD = 'MA_B000030'
		  LEFT JOIN WOORIM.dbo.ERP_CODE_DTL			ECD2 ON PD.CD_USERDEF9 = ECD2.CD_SYSDEF AND ECD2.CD_FIELD = 'MA_B000089'
		  LEFT JOIN WOORIM.dbo.ERP_CODE_DTL			ECD3 ON P.MATERIAL = ECD3.CD_SYSDEF AND ECD3.CD_FIELD = 'MA_B000122'
		 WHERE 1=1
		   AND P.ACTIVE = 'A'
		   AND B.ACTIVE = '1'
		   --AND ISNULL(S.OPTIONYN,'N') = 'Y'
	) AA
GO

