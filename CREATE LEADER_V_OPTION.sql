USE [WOORIM_230215]
GO

/****** Object:  View [dbo].[LEADER_V_OPTION]    Script Date: 2023-02-15 ���� 11:29:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[LEADER_V_OPTION] 
AS

SELECT	AA.PRODUCT_SEQ,			-- ��ǰSEQ
		AA.BRAND_NAME,			-- �귣��� 
		AA.MODEL_NO,			-- �𵨹�ȣ2(NEW MODELNO)
		AA.MODEL_NM,			-- �ڻ�� �𵨸�(��Ŀ�ӽ����� �𵨸�)
		AA.CATEGORY,			-- ī�װ�(N:�����/A:����/B:����/C:Ŀ�ø�/E:�Ͱ���/H:�Ӹ����/J:�־�ACC/L:����ü��/M:�����ACC/O:�����/P:�Ҵ�Ʈ/R:����)
		AA.OPTIONYN,			-- �ɼǿ���
		AA.MINSIZE,				-- �ּ� ������
		AA.MAXSIZE,				-- �ִ� ������
		AA.UNIT,				-- ����
		AA.UNITPRICE,			-- �ɼ� ����
		AA.READYMADESIZE,		-- �⼺ ������(����������, ����)
		AA.ENGRAVE,				-- �Ȱ��� ��� ����(Y/N)
		AA.ENGRAVEOUT,			-- �Ѱ��� ����(Y/N)
		AA.READYMADECOLOR,		-- �⼺����
		AA.YG,					-- ���ο� ���(1:����,0:�Ұ�)
		AA.RG,					-- ���� ��� 
		AA.WG,					-- ȭ��Ʈ ���
		AA.WGX,					-- ȭ��Ʈ ���� ���
		AA.CB,					-- MIX ����
		AA.READYMADESTONE		-- ź���� �⼺ ����														
  FROM 							
	(
		SELECT	S.PROSEQ				AS PRODUCT_SEQ			-- ��ǰSEQ
			  , B.BRANDNAME				AS BRAND_NAME			-- �귣��� 
			  , P.ERP_CD_ITEM			AS MODEL_NO				-- �𵨹�ȣ2(NEW MODELNO)
			  , A.MODELNO				AS MODEL_NM				-- �ڻ�� �𵨸�(��Ŀ�ӽ����� �𵨸�)
			  , CASE WHEN LEN(P.ERP_CD_ITEM) = 18 AND CHARINDEX('-', P.ERP_CD_ITEM) > 0 
					 THEN LEFT(RIGHT(P.ERP_CD_ITEM, CHARINDEX('-', REVERSE(P.ERP_CD_ITEM))-1),1) 
				 END					AS CATEGORY			-- ī�װ� 
			  , ISNULL(S.OPTIONYN,'N')	AS OPTIONYN			-- �ɼǿ���
			  -- �� ������ 
			  , CEILING(S.MINSIZE)		AS MINSIZE			-- �ּ� ������
			  , FLOOR (S.MAXSIZE)		AS MAXSIZE			-- �ִ� ������
			  , S.UNIT										-- ����
			  , ISNULL(S.UNITPRICE,0)	AS UNITPRICE		-- �ɼ� ����
			  , S.READYMADESIZE								-- �⼺ ������(����������, ����)
			  -- �� ����
			  , ISNULL(S.ENGRAVE,'N')	AS ENGRAVE			-- �Ȱ��� ��� ����(Y/N)
			  , S.ENGRAVEOUT								-- �Ѱ��� ����(Y/N)
			  --, S.ENGRAVEPRICE							-- �Ȱ��� ���(10,000���� �����Ͽ� �����ڵ忡�� ��������� ��)
			  --, S.ENGRAVEOUTPRICE							-- �Ѱ��� ���(10,000���� �����Ͽ� �����ڵ忡�� ��������� ��)
			  -- �� ����
			  , CASE WHEN SUBSTRING(P.ERP_CD_ITEM,14,1) = 'R' THEN 'RG'
					 WHEN SUBSTRING(P.ERP_CD_ITEM,14,1) = 'Y' THEN 'YG'
					 WHEN SUBSTRING(P.ERP_CD_ITEM,14,1) = 'W' THEN 'WG'
					 WHEN SUBSTRING(P.ERP_CD_ITEM,14,1) = 'X' THEN 'WGX'
					 WHEN SUBSTRING(P.ERP_CD_ITEM,14,1) = 'C' THEN 'CB' 
				END						AS READYMADECOLOR	-- �⼺����
			  , S.YG										-- ���ο� ���
			  , S.RG										-- ���� ��� 
			  , S.WG										-- ȭ��Ʈ ���
			  , S.WGX										-- ȭ��Ʈ ���� ���
			  , S.CB										-- MIX ����
			  , CC.COM_NM				AS READYMADESTONE	-- �⼺ ����

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


