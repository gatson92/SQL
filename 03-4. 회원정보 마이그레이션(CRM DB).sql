-------------------------------------------------------------------------------------------- 
---------------------------------------------���̱׷��̼�-----------------------------------
--------------------------------------------------------------------------------------------
	-- CRM DB���� ����
	-- 1.1 ȸ�� ������ ���̱׷��̼� 
		DECLARE @TBL_NAME VARCHAR(100);
		DECLARE @QUERY NVARCHAR(MAX);
		SET @TBL_NAME = 'TB_MEMBER_' + CONVERT(VARCHAR(8),GETDATE(),112);
		
		-- CREATE BACK UP TBL 
		SET @QUERY = 'SELECT * INTO ' + @TBL_NAME + ' FROM TB_MEMBER';
		EXEC  (@QUERY);
		
		DELETE FROM TB_MEMBER;
		SET IDENTITY_INSERT TB_MEMBER ON;
		INSERT INTO TB_MEMBER(SEQ, MEM_NAME, STORE_ID, GRADE, ADDRESS1, ADDRESS2, ZIP_CODE, TEL0,TEL1,TEL2, MOBILE0,MOBILE1,MOBILE2, BIRTH_DATE, BIRTH_TYPE, MARRY_DATE,IS_MARRY, EMAIL, JOB, OFFICE_ADDRESS1, OFFICE_ADDRESS2, OFFICE_ZIP_CODE, OFFICE_TEL0, OFFICE_TEL1, OFFICE_TEL2, DM, ACTIVE, REG_DATE, MEM_ID, GENDER, AGE, FROM_OLD, OLD_ID )
		SELECT seq, Memname, Storeid, Grade, address1, address2, zipcode, tel0, tel1, tel2, mobile0, mobile1, mobile2, BirthDate, BirthType, MarryDate, IsMarry, Email, Job, officeaddress1, officeaddress2, officezipcode, officetel0, officetel1, officetel2, dm, active, regdate, memid, gender, age, fromOld, oldID 
		FROM MISSERVER.WOORIM_220901.dbo.Member;
		SET IDENTITY_INSERT TB_MEMBER OFF;
		
	-- 1.2. CRM ȸ����ȣ �ο�
		UPDATE TB_MEMBER SET CST_NO = '8' + [dbo].[LPAD](SEQ,11,'0') 

		
	-- 1.3 �׽�Ʈ�� ���� CRM ȸ�� 1�� ���̱׷��̼� >> CRM���� ���̱׷��̼� ������ �� ���� ������ ����
		UPDATE A 
		SET CST_NO = '8' + [dbo].[LPAD](A.SEQ,11,'0'),
		    AGREE_YN = 'N',
		    AUTH_YN = 'N',
		    JOIN_MTHD_CD = CASE B.TYPE_02 WHEN '������' THEN 'SH' WHEN '������' THEN 'GO' END,
		    JOIN_DD = CONVERT(VARCHAR(8),A.REG_DATE, 112),
		    SEX_CD = CASE A.GENDER WHEN '����' THEN 'F' WHEN '����' THEN 'M' END,
		    SOLA_LUNA_CD = CASE A.BIRTH_TYPE WHEN '���' THEN 'S'  WHEN '����' THEN 'L' END
		FROM TB_MEMBER A
			   INNER JOIN TB_STORE B
			 ON A.STORE_ID = B.STORE_ID
			 
	-- 1.4 ������� ���� ������ DATE ��Ŀ� �µ��� ���� 
	UPDATE TB_MEMBER 
	SET BIRTH_DATE = CONVERT(DATE, REPLACE(BIRTH_DATE, '-', ''), 120)
	WHERE ISDATE(BIRTH_DATE) = 0 AND BIRTH_DATE IS NOT NULL

	-- ȸ�� I/F TABLE ��ȸ���� UPDATE(��ȸ�������ϸ� �ʹ� �����ɸ�)
	UPDATE IF_CRM_TO_MIS_CST_INFO
	SET T_STATUS_CD = 'W',
	    T_CMPL_DT = NULL
	WHERE LEFT(CST_NO,1) = '9'
	
	-- CRM �Ź�ȣ I/F
	EXEC MIS_CST_INFO_SYNC_IF '', ''
	
	-- CRM �޴�����ȣ�� UPDATE(��ȣȭ������)
	UPDATE A
	SET A.MOBILE_NO = B.MOBILE_NO
	FROM TB_MEMBER A 
	     INNER JOIN wrcrm.dbo.TBCR_1000 B 
		   ON A.CST_NO = B.CST_NO