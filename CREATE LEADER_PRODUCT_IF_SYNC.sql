USE WOORIM_230215
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[LEADER_PRODUCT_IF_SYNC]
AS
/******************************************************************************
** File:
** Name: LEADER_PRODUCT_IF_SYNC
**
** Desc: 자사몰 마스터정보 동기화 
**
** TARGET 테이블 : LEADER_PRODUCT_IF
**
** EXEC dbo.LEADER_PRODUCT_IF_SYNC
**
** This template can be customized:
**
** Called by: 
**
** Parameters:
** Input Output
** ---------- -----------
**
** Auth: 이상현
** Date: 2023.05.25
*******************************************************************************
** Change History
*******************************************************************************
** Date:		Author:	Description:
** ---------	------	-----------------
*******************************************************************************/
SET NOCOUNT ON

-- MERGE건 확인
DECLARE @MERGEOUTPUT TABLE
(
	ACTIONTYPE VARCHAR(10),
    CHANGEDID INT
)
DECLARE @CHANGED		CHAR(1) 
	SET @CHANGED = 'N'

-- 배치이력 관리
DECLARE @PROC_NM		VARCHAR(100),
		@CONTENT		VARCHAR(2000),
		@START_DATE		DATETIME,
		@SUCC_YN		CHAR(1),
		@DESC			VARCHAR(2000)

 SELECT @PROC_NM	= 'LEADER_PRODUCT_IF_SYNC',
		@CONTENT	= '자사몰 마스터정보 동기화',
		@START_DATE = GETDATE(),
		@SUCC_YN	= 'N'

-- 오류 관리 
DECLARE @RGT_ID			VARCHAR(10),
		@ERROR_PROC		VARCHAR(100) = '',
		@ERROR_MSG		VARCHAR(MAX) = '',
		@ERROR_TRACE	VARCHAR(MAX) = ''

	SET @RGT_ID		= 'BATCH'


BEGIN TRY
	-- ■ 1. 단품 정보 SYNC
	BEGIN 
		BEGIN TRY
			BEGIN TRAN 

				MERGE LEADER_PRODUCT_IF AS A
					USING	( 
								SELECT	P.ERP_CD_ITEM	AS MODEL_NO, 
										P.ERP_NM_ITEM	AS MODEL_NM, 
										P.SEQ			AS PRO_SEQ, 
										P.BRANDSEQ		AS BRAND_SEQ, 
										OBSM.STORE_SEQ	AS STORE_SEQ, 
										P.ERP_GRP_MFG	AS ITEM, 
										P.PRICE 		AS PRICE,
										EP.OWNYN		AS USE_YN
										--, P.SELL_PRICE
								  FROM ECOMMERCEPRODUCT					EP	 WITH(NOLOCK)
								 INNER JOIN WOORIM.dbo.PRODUCT			P	 WITH(NOLOCK)	ON P.SEQ = EP.PROSEQ
								  LEFT JOIN OWNMALL_BRAND_STORE_MAPPING OBSM WITH(NOLOCK)	ON P.BRANDSEQ = OBSM.BRAND_SEQ								
								
							)  AS B
					ON (A.PRO_SEQ = B.PRO_SEQ AND A.SET_GUBUN = 'P')
				
					-- ##1. 조인된 경우 (일치하는 경우) [UPDATE] 문 수행
					WHEN MATCHED	
							 AND ISNULL(A.MODEL_NO,'')		<> ISNULL(B.MODEL_NO,'')
							  OR ISNULL(A.MODEL_NM,'')		<> ISNULL(B.MODEL_NM,'')
							  OR ISNULL(A.BRAND_SEQ,'')		<> ISNULL(B.BRAND_SEQ,'')
							  OR ISNULL(A.STORE_SEQ,'')		<> ISNULL(B.STORE_SEQ,'')
							  OR ISNULL(A.ITEM,'')			<> ISNULL(B.ITEM,'')
							  OR ISNULL(A.PRICE,'')			<> ISNULL(B.PRICE,'')
							  OR ISNULL(A.SELL_PRICE,'')	<> ISNULL(B.PRICE,'')
							  OR ISNULL(A.USE_YN,'')		<> ISNULL(B.USE_YN,'')
					THEN UPDATE 
							SET	MODEL_NO    = B.MODEL_NO,
								MODEL_NM    = B.MODEL_NM,
								BRAND_SEQ   = B.BRAND_SEQ,
								STORE_SEQ   = B.STORE_SEQ,
								ITEM        = B.ITEM,
								PRICE       = B.PRICE,
								SELL_PRICE  = B.PRICE,
								USE_YN		= B.USE_YN,
								CHG_YN		= 'Y',
								CHG_DATE	= GETDATE()

					-- ##2. 조인되지 않은 경우 (일치하지 않는 경우) [INSERT] 문 수행
					WHEN NOT MATCHED BY TARGET -- NEW DATA INSERT 
					THEN INSERT (	
									SET_GUBUN, MODEL_NO, MODEL_NM, PRO_SEQ, BRAND_SEQ, STORE_SEQ,
									ITEM, PRICE, SELL_PRICE, USE_YN, REG_DATE
								)
	
						 VALUES (	
									'P', MODEL_NO, MODEL_NM, PRO_SEQ, BRAND_SEQ, STORE_SEQ,
									ITEM, PRICE, PRICE, B.USE_YN, GETDATE()
								)


					-- ##3. 조인되지 않은 경우 (일치하지 않는 경우) [DELETE] 문 수행
					WHEN NOT MATCHED BY SOURCE AND A.SET_GUBUN = 'P'
					THEN DELETE
					--THEN UPDATE 
					--		SET	USE_YN		= 'X',
					--			CHG_YN		= 'Y',
					--			CHG_DATE	= GETDATE()
					

				OUTPUT 
					$ACTION AS ACTIONTYPE,
					CASE WHEN $action = 'INSERT' THEN INSERTED.PRO_SEQ
						 WHEN $action = 'UPDATE' THEN INSERTED.PRO_SEQ
						 WHEN $action = 'DELETE' THEN DELETED.PRO_SEQ
					 END AS ChangedID
					INTO @MergeOutput;

				IF(@@ROWCOUNT > 0) SET @CHANGED = 'Y'

			COMMIT TRAN

			PRINT '단품 동기화 완료'

		END TRY
		BEGIN CATCH
			
			ROLLBACK TRAN
	
			SELECT	@ERROR_PROC = ERROR_PROCEDURE(),
					@ERROR_MSG	= ERROR_MESSAGE(),
					@ERROR_TRACE = (ERROR_NUMBER()+' '+ERROR_STATE()+' '+ERROR_LINE())
			EXEC LSH_ERROR_LOG_INSERT @ERROR_PROC, @ERROR_MSG, @ERROR_TRACE,'',@RGT_ID, @RGT_ID	

			PRINT '[1] ERROR : ' + @ERROR_MSG

		END CATCH; 

		-- 변경된 상품 확인
		IF(@CHANGED = 'Y')
			BEGIN 
				WITH CTE_ACTIONCOUNTS AS 
				(
					SELECT ACTIONTYPE,
						   CONVERT(VARCHAR(10), ISNULL(COUNT(*), 0)) AS ACTIONCOUNT
					  FROM @MERGEOUTPUT
					 GROUP BY ACTIONTYPE
				)
				SELECT @DESC =
						MAX(CASE WHEN ACTIONTYPE = 'INSERT' THEN 'C ' + ACTIONCOUNT + '건 ' ELSE '' END) +
						MAX(CASE WHEN ACTIONTYPE = 'UPDATE' THEN 'U ' + ACTIONCOUNT + '건 ' ELSE '' END) +
						MAX(CASE WHEN ACTIONTYPE = 'DELETE' THEN 'D ' + ACTIONCOUNT + '건 ' ELSE '' END) 
				  FROM CTE_ACTIONCOUNTS;

				WITH ACTIONTYPECOUNTS AS
				(
					SELECT ACTIONTYPE, STRING_AGG(CAST(CHANGEDID AS VARCHAR(MAX)), ',') WITHIN GROUP (ORDER BY CHANGEDID ASC) AS CHANGEDIDS
					  FROM @MERGEOUTPUT
					 GROUP BY ACTIONTYPE
				)
				SELECT @DESC = @DESC  +'상세 : '+ CONCAT
							(
								'   C ( ', COALESCE((SELECT MAX(CHANGEDIDS) FROM ACTIONTYPECOUNTS WHERE ACTIONTYPE = 'INSERT'), '') + ' )',
								' / U ( ', COALESCE((SELECT MAX(CHANGEDIDS) FROM ACTIONTYPECOUNTS WHERE ACTIONTYPE = 'UPDATE'), '') + ' )',
								' / D ( ', COALESCE((SELECT MAX(CHANGEDIDS) FROM ACTIONTYPECOUNTS WHERE ACTIONTYPE = 'DELETE'), '') + ' )'
							) 
				  FROM ACTIONTYPECOUNTS;

				SET @CHANGED = 'N'

				DELETE FROM @MERGEOUTPUT
			END

	END

	-- ■ 2. 세트 정보 SYNC
	BEGIN 
		BEGIN TRY
			BEGIN TRAN 

				MERGE LEADER_PRODUCT_IF AS A
					USING	( 
								SELECT	P.ERP_CD_ITEM	AS MODEL_NO, 
										EP.MODELNO		AS MODEL_NM, 
										P.SEQ			AS PRO_SEQ, 
										P.BRANDSEQ		AS BRAND_SEQ, 
										OBSM.STORE_SEQ	AS STORE_SEQ, 
										P.ERP_GRP_MFG	AS ITEM, 
										P.PRICE 		AS PRICE,
										EP.OWNYN		AS USE_YN
										--, P.SELL_PRICE
								  FROM ECOMMERCESETPRODUCT				EP	 WITH(NOLOCK)
								 INNER JOIN WOORIM.DBO.PRODUCT			P	 WITH(NOLOCK)	ON P.SEQ = EP.PROSEQ
								  LEFT JOIN OWNMALL_BRAND_STORE_MAPPING OBSM WITH(NOLOCK)	ON P.BRANDSEQ = OBSM.BRAND_SEQ								
								
							)  AS B
					ON (A.PRO_SEQ = B.PRO_SEQ AND A.MODEL_NO = B.MODEL_NO AND A.MODEL_NM = B.MODEL_NM AND A.SET_GUBUN = 'S')
				
					-- ##1. 조인된 경우 (일치하는 경우) [UPDATE] 문 수행
					WHEN MATCHED	
							 AND ISNULL(A.BRAND_SEQ,'')		<> ISNULL(B.BRAND_SEQ,'')
							  OR ISNULL(A.STORE_SEQ,'')		<> ISNULL(B.STORE_SEQ,'')
							  OR ISNULL(A.ITEM,'')			<> ISNULL(B.ITEM,'')
							  OR ISNULL(A.PRICE,'')			<> ISNULL(B.PRICE,'')
							  OR ISNULL(A.SELL_PRICE,'')	<> ISNULL(B.PRICE,'')
							  OR ISNULL(A.USE_YN,'')		<> ISNULL(B.USE_YN,'')
					THEN UPDATE 
							SET	BRAND_SEQ   = B.BRAND_SEQ,
								STORE_SEQ   = B.STORE_SEQ,
								ITEM        = B.ITEM,
								PRICE       = B.PRICE,
								SELL_PRICE  = B.PRICE,
								USE_YN		= B.USE_YN,
								CHG_YN		= 'Y',
								CHG_DATE	= GETDATE()


					-- ##2. 조인되지 않은 경우 (일치하지 않는 경우) [INSERT] 문 수행
					WHEN NOT MATCHED BY TARGET -- NEW DATA INSERT 
					THEN INSERT (	
									SET_GUBUN, MODEL_NO, MODEL_NM, PRO_SEQ, BRAND_SEQ, STORE_SEQ,
									ITEM, PRICE, SELL_PRICE, USE_YN, REG_DATE
								)
	
						 VALUES (	
									'S', MODEL_NO, MODEL_NM, PRO_SEQ, BRAND_SEQ, STORE_SEQ,
									ITEM, PRICE, PRICE, 'Y', GETDATE()
								)


					-- ##3. 조인되지 않은 경우 (일치하지 않는 경우) [DELETE] 문 수행
					WHEN NOT MATCHED BY SOURCE AND A.SET_GUBUN = 'S'
					THEN UPDATE 
							SET	USE_YN		= 'X',
								CHG_YN		= 'Y',
								CHG_DATE	= GETDATE()
			
				OUTPUT 
					$ACTION AS ACTIONTYPE,
					CASE WHEN $action = 'INSERT' THEN INSERTED.PRO_SEQ
						 WHEN $action = 'UPDATE' THEN INSERTED.PRO_SEQ
						 WHEN $action = 'DELETE' THEN DELETED.PRO_SEQ
					 END AS ChangedID
					INTO @MergeOutput;

				IF(@@ROWCOUNT > 0) SET @CHANGED = 'Y'

			COMMIT TRAN

			PRINT 'SET 동기화 완료'

			SET @SUCC_YN = 'Y'

			-- 변경된 상품 확인
			IF(@CHANGED = 'Y')
				BEGIN 
					WITH CTE_ACTIONCOUNTS AS 
					(
						SELECT ACTIONTYPE,
								CONVERT(VARCHAR(10), ISNULL(COUNT(*), 0)) AS ACTIONCOUNT
							FROM @MERGEOUTPUT
							GROUP BY ACTIONTYPE
					)
					SELECT @DESC = @DESC + '/ SET : ' +
							MAX(CASE WHEN ACTIONTYPE = 'INSERT' THEN 'C ' + ACTIONCOUNT + '건 ' ELSE '' END) +
							MAX(CASE WHEN ACTIONTYPE = 'UPDATE' THEN 'U ' + ACTIONCOUNT + '건 ' ELSE '' END) +
							MAX(CASE WHEN ACTIONTYPE = 'DELETE' THEN 'D ' + ACTIONCOUNT + '건 ' ELSE '' END) 
						FROM CTE_ACTIONCOUNTS;

					WITH ACTIONTYPECOUNTS AS
					(
						SELECT ACTIONTYPE, STRING_AGG(CAST(CHANGEDID AS VARCHAR(MAX)), ',') WITHIN GROUP (ORDER BY CHANGEDID ASC) AS CHANGEDIDS
							FROM @MERGEOUTPUT
							GROUP BY ACTIONTYPE
					)
					SELECT @DESC = @DESC  +'상세 : '+ CONCAT
								(
									'   C ( ', COALESCE((SELECT MAX(CHANGEDIDS) FROM ACTIONTYPECOUNTS WHERE ACTIONTYPE = 'INSERT'), '') + ' )',
									' / U ( ', COALESCE((SELECT MAX(CHANGEDIDS) FROM ACTIONTYPECOUNTS WHERE ACTIONTYPE = 'UPDATE'), '') + ' )',
									' / D ( ', COALESCE((SELECT MAX(CHANGEDIDS) FROM ACTIONTYPECOUNTS WHERE ACTIONTYPE = 'DELETE'), '') + ' )'
								) 
						FROM ACTIONTYPECOUNTS;

					SET @CHANGED = 'N'

					DELETE FROM @MERGEOUTPUT
				END

		END TRY
		BEGIN CATCH
			
			ROLLBACK TRAN
	
			SELECT	@ERROR_PROC = ERROR_PROCEDURE(),
					@ERROR_MSG	= ERROR_MESSAGE(),
					@ERROR_TRACE = (ERROR_NUMBER()+' '+ERROR_STATE()+' '+ERROR_LINE())
			EXEC LSH_ERROR_LOG_INSERT @ERROR_PROC, @ERROR_MSG, @ERROR_TRACE,'',@RGT_ID, @RGT_ID	

			PRINT '[1] ERROR : ' + @ERROR_MSG

		END CATCH 
	END

END TRY
BEGIN CATCH

			SELECT	@ERROR_PROC = ERROR_PROCEDURE(),
					@ERROR_MSG	= ERROR_MESSAGE(),
					@ERROR_TRACE = (ERROR_NUMBER()+' '+ERROR_STATE()+' '+ERROR_LINE())
			EXEC LSH_ERROR_LOG_INSERT @ERROR_PROC, @ERROR_MSG, @ERROR_TRACE,'',@RGT_ID, @RGT_ID			

			PRINT '[2] ERROR : ' + @ERROR_MSG

END CATCH

-- BATCH 이력 남기기 
EXEC WOORIM_230215.dbo.BATCH_HIS_INSERT @PROC_NM, @CONTENT, @START_DATE, @SUCC_YN, @ERROR_MSG, @DESC