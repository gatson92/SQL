USE [WOORIM_230215]
GO

/****** Object:  View [dbo].[LEADER_V_OPTION]    Script Date: 2023-02-15 오전 11:29:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[LEADER_V_OPTION] 
AS

SELECT	AA.PRODUCT_SEQ,			-- 상품SEQ
		AA.BRAND_NAME,			-- 브랜드명 
		AA.MODEL_NO,			-- 모델번호2(NEW MODELNO)
		AA.MODEL_NM,			-- 자사몰 모델명(이커머스전용 모델명)
		AA.CATEGORY,			-- 카테고리(N:목걸이/A:발찌/B:팔찌/C:커플링/E:귀걸이/H:머리장식/J:주얼리ACC/L:연장체인/M:모바일ACC/O:브로찌/P:팬던트/R:반지)
		AA.OPTIONYN,			-- 옵션여부
		AA.MINSIZE,				-- 최소 사이즈
		AA.MAXSIZE,				-- 최대 사이즈
		AA.UNIT,				-- 단위
		AA.UNITPRICE,			-- 옵션 가격
		AA.READYMADESIZE,		-- 기성 사이즈(반지사이즈, 길이)
		AA.ENGRAVE,				-- 안각인 사용 여부(Y/N)
		AA.ENGRAVEOUT,			-- 겉각인 여부(Y/N)
		AA.READYMADECOLOR,		-- 기성색상
		AA.YG,					-- 옐로우 골드(1:가능,0:불가)
		AA.RG,					-- 로즈 골드 
		AA.WG,					-- 화이트 골드
		AA.WGX,					-- 화이트 무광 골드
		AA.CB,					-- MIX 색상
		AA.READYMADESTONE		-- 탄생석 기성 스톤														
  FROM 							
	(
		SELECT	S.PROSEQ				AS PRODUCT_SEQ			-- 상품SEQ
			  , B.BRANDNAME				AS BRAND_NAME			-- 브랜드명 
			  , P.ERP_CD_ITEM			AS MODEL_NO				-- 모델번호2(NEW MODELNO)
			  , A.MODELNO				AS MODEL_NM				-- 자사몰 모델명(이커머스전용 모델명)
			  , CASE WHEN LEN(P.ERP_CD_ITEM) = 18 AND CHARINDEX('-', P.ERP_CD_ITEM) > 0 
					 THEN LEFT(RIGHT(P.ERP_CD_ITEM, CHARINDEX('-', REVERSE(P.ERP_CD_ITEM))-1),1) 
				 END					AS CATEGORY			-- 카테고리 
			  , ISNULL(S.OPTIONYN,'N')	AS OPTIONYN			-- 옵션여부
			  -- ■ 사이즈 
			  , CEILING(S.MINSIZE)		AS MINSIZE			-- 최소 사이즈
			  , FLOOR (S.MAXSIZE)		AS MAXSIZE			-- 최대 사이즈
			  , S.UNIT										-- 단위
			  , ISNULL(S.UNITPRICE,0)	AS UNITPRICE		-- 옵션 가격
			  , S.READYMADESIZE								-- 기성 사이즈(반지사이즈, 길이)
			  -- ■ 각인
			  , ISNULL(S.ENGRAVE,'N')	AS ENGRAVE			-- 안각인 사용 여부(Y/N)
			  , S.ENGRAVEOUT								-- 겉각인 여부(Y/N)
			  --, S.ENGRAVEPRICE							-- 안각인 비용(10,000으로 동일하여 공통코드에서 가져오기로 함)
			  --, S.ENGRAVEOUTPRICE							-- 겉각인 비용(10,000으로 동일하여 공통코드에서 가져오기로 함)
			  -- ■ 색상
			  , CASE WHEN SUBSTRING(P.ERP_CD_ITEM,14,1) = 'R' THEN 'RG'
					 WHEN SUBSTRING(P.ERP_CD_ITEM,14,1) = 'Y' THEN 'YG'
					 WHEN SUBSTRING(P.ERP_CD_ITEM,14,1) = 'W' THEN 'WG'
					 WHEN SUBSTRING(P.ERP_CD_ITEM,14,1) = 'X' THEN 'WGX'
					 WHEN SUBSTRING(P.ERP_CD_ITEM,14,1) = 'C' THEN 'CB' 
				END						AS READYMADECOLOR	-- 기성색상
			  , S.YG										-- 옐로우 골드
			  , S.RG										-- 로즈 골드 
			  , S.WG										-- 화이트 골드
			  , S.WGX										-- 화이트 무광 골드
			  , S.CB										-- MIX 색상
			  , CC.COM_NM				AS READYMADESTONE	-- 기성 스톤

		FROM (	   
				SELECT MODELNO, FULLMODELNO, 1 AS QTY, SEQ, 'P' AS GUBUN
				FROM ECOMMERCEPRODUCT
				WHERE OWN_YN = 'Y'
				UNION ALL
				SELECT MODELNO, FULLMODELNO, SQTY AS QTY, SEQ, 'S' AS GUBUN
				FROM ECOMMERCESETPRODUCT
				WHERE OWN_YN = 'Y'
			) A  
		  INNER JOIN WOORIM.dbo.PRODUCT	P WITH(NOLOCK) ON A.FULLMODELNO = P.ERP_CD_ITEM
		  INNER JOIN BRANDNAME			B WITH(NOLOCK)ON P.BRANDSEQ = B.SEQ
		  INNER JOIN TB_OWNMALL_BRAND_STORE_MAPPING BSM ON BSM.BRAND_SEQ = B.SEQ  
		   LEFT JOIN WOORIM.dbo.STYLEBOOK S WITH(NOLOCK) ON S.PROSEQ = P.SEQ
		   LEFT JOIN TB_COM_CODE CC ON CC.GRP_CD = 'OWN_OPT_STONE' AND CC.COM_CD = S.READYMADESTONE

		 WHERE 1=1
		   AND P.ACTIVE = 'A'
		   --AND B.ACTIVE = '1'
		   AND ISNULL(S.OPTIONYN,'N') = 'Y'

	) AA

GO


