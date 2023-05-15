USE [WOORIM_230215]
GO

/****** Object:  View [dbo].[LEADER_V_PRODUCT_INFO]    Script Date: 2023-02-21 ���� 11:24:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[LEADER_V_PRODUCT_INFO] 
AS
SELECT	AA.PRODUCT_SEQ,			-- ��ǰSEQ
		AA.BRAND_NAME,			-- �귣��� 
		AA.MODEL_NO,			-- ERP ǰ��
		AA.MODEL_NM,			-- �ڻ�� �𵨸�(��Ŀ�ӽ����� �𵨸�)
		AA.GUBUN,				-- �ð�/�־� ����
		-- �� ������� ��
		AA.CATEGORY,			-- ����)   ����(ǰ��)
		AA.METALTYPE,			-- ����)   ����(�ð�:���, �־�:�ݼ�)
		AA.MOVEMENT,			-- �ð�)   �����Ʈ
		AA.GALSS,				-- �ð�)   ����
		AA.DIAL,				-- �ð�)   ������
		AA.STONESMALLGROUP,		-- �־�) �������
		AA.STONE,				-- �־�) ����
		CASE WHEN AA.CATEGORY = 'WATCH' 
			 THEN AA.W_WEIGHT
			 ELSE AA.J_WEIGHT	
		 END	AS [WEIGHT],	-- ����)   �߷� 
		AA.SIZE,				-- ����)   ������
		AA.REMARK				-- ����)   �ֿ���
								
  FROM 							
	(
		SELECT	P.SEQ					AS PRODUCT_SEQ	-- ��ǰSEQ
			  , B.BRANDNAME				AS BRAND_NAME	-- �귣��� 
			  , A.MODEL_NO				AS MODEL_NO		-- �𵨹�ȣ(NEW MODELNO)
			  , A.MODEL_NM				AS MODEL_NM		-- �ڻ�� �𵨸�(��Ŀ�ӽ����� �𵨸�)
			  , P.ERP_GRP_MFG			AS GUBUN		-- �ð�:1, �־�:2
			  -- �� ������� ��
			  , ECD1.CD_SYSDEF			AS CATE_CD		-- ī�װ� �ڵ� 
			  , CASE WHEN P.ERP_GRP_MFG = 1				-- ������ð�:129, ������־�:198, ��������:89
					 THEN 'WATCH'						-- ���������� �ð��ǰ ������ ��!��!�� �־󸮷� ����Ѵٰ� ��..
			         ELSE ECD1.NM_SYSDEF					
				 END					AS CATEGORY		-- 1. ����

			  , CASE WHEN P.ERP_GRP_MFG = 1 THEN ECD3.NM_SYSDEF	-- �ð�  : ����(���)
					 ELSE S.METALTYPE							-- �־�: �ݼ�
				 END AS METALTYPE						-- 2. ����
			  , P.MOVEMENT				AS MOVEMENT		-- 3. �ð�)�����Ʈ
			  , ECD2.NM_SYSDEF			AS GALSS		-- 4. �ð�)����
			  , CB.[NAME]				AS DIAL			-- 5. �ð�)������

			  , S.STONESMALLGROUP						-- 6. �������
			  , S.STONE									-- 7. ����
			  , P.jungae									AS W_WEIGHT	-- �ð��߷�
			  , ISNULL(PJD.TAGMETALWEIGHT, S.METALWEIGHT)	AS J_WEIGHT -- �־� ���߷�
			  , CASE WHEN P.ERP_GRP_MFG = 1 THEN CASESIZE -- �ð�  : ���̽� ������
			         ELSE S.SIZE						 -- �־�: ������
				 END AS SIZE							-- 9. ������

			  ,	CASE WHEN P.ERP_GRP_MFG = 1 THEN P.ETCNOTE					-- �ð�:��Ÿ
					 WHEN ECD1.CD_SYSDEF IN ('209','204','211') THEN S.ETC	-- 209:Piercing,204:Couple ring,211:WATCH
	 				 WHEN ECD1.CD_SYSDEF = '205' THEN BIGO					-- 205:Earrings
				ELSE ''
				 END AS 'REMARK'						-- 10. �ֿ���
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

