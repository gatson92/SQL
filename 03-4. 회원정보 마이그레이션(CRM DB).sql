-------------------------------------------------------------------------------------------- 
---------------------------------------------마이그레이션-----------------------------------
--------------------------------------------------------------------------------------------
	-- CRM DB에서 실행
	-- 1.1 회원 데이터 마이그레이션 
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
		
	-- 1.2. CRM 회원번호 부여
		UPDATE TB_MEMBER SET CST_NO = '8' + [dbo].[LPAD](SEQ,11,'0') 

		
	-- 1.3 테스트를 위한 CRM 회원 1차 마이그레이션 >> CRM에서 마이그레이션 데이터 줌 최종 실행할 예정
		UPDATE A 
		SET CST_NO = '8' + [dbo].[LPAD](A.SEQ,11,'0'),
		    AGREE_YN = 'N',
		    AUTH_YN = 'N',
		    JOIN_MTHD_CD = CASE B.TYPE_02 WHEN '모자익' THEN 'SH' WHEN '갤러리' THEN 'GO' END,
		    JOIN_DD = CONVERT(VARCHAR(8),A.REG_DATE, 112),
		    SEX_CD = CASE A.GENDER WHEN '여성' THEN 'F' WHEN '남성' THEN 'M' END,
		    SOLA_LUNA_CD = CASE A.BIRTH_TYPE WHEN '양력' THEN 'S'  WHEN '음력' THEN 'L' END
		FROM TB_MEMBER A
			   INNER JOIN TB_STORE B
			 ON A.STORE_ID = B.STORE_ID
			 
	-- 1.4 생년월일 오류 데이터 DATE 양식에 맞도록 수정 
	UPDATE TB_MEMBER 
	SET BIRTH_DATE = CONVERT(DATE, REPLACE(BIRTH_DATE, '-', ''), 120)
	WHERE ISDATE(BIRTH_DATE) = 0 AND BIRTH_DATE IS NOT NULL

	-- 회원 I/F TABLE 신회원만 UPDATE(구회원까지하면 너무 오래걸림)
	UPDATE IF_CRM_TO_MIS_CST_INFO
	SET T_STATUS_CD = 'W',
	    T_CMPL_DT = NULL
	WHERE LEFT(CST_NO,1) = '9'
	
	-- CRM 신번호 I/F
	EXEC MIS_CST_INFO_SYNC_IF '', ''
	
	-- CRM 휴대폰번호로 UPDATE(암호화데이터)
	UPDATE A
	SET A.MOBILE_NO = B.MOBILE_NO
	FROM TB_MEMBER A 
	     INNER JOIN wrcrm.dbo.TBCR_1000 B 
		   ON A.CST_NO = B.CST_NO