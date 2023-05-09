-------------------------------------------------------------------------------------------- 
---------------------------------------------���̱׷��̼�-----------------------------------
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
-- ���� ���̱׷��̼�
	--2.1 ������ �Է� TB_MEMBER_ORDER(���������� ������ �̰� �� �����ؾ���.)
		SET IDENTITY_INSERT TB_MEMBER_ORDER ON;
		INSERT INTO TB_MEMBER_ORDER(SEQ, TYPE, MEM_SEQ, STORE_ID, SALES_DATE, PRO_SEQ, QTY, ORIGINAL_PRICE, PRICE, LOST_PRICE, PAY_TYPE, CER_NO, EVENT_STORE_SEQ, BRAND_GIFT_PRICE, PRICE_CHANGE_WHY, REG_DATE, SALES_MEMO, EMP_SEQ, HAND, PURPOSE, CHANGE_01, CHANGE_02, MARGIN, AGE, SEX, NATIONALITY, CST_NO)
		SELECT seq, type, memSeq, storeID, salesDate, proSeq, qty, originalPrice, price, lostPrice, payType, cerNo, eventStoreSeq, brandGiftPrice, priceChangeWhy, regDate, salesMemo, empseq, hand, purpose, change1, change2, margin, age, sex, nationality, '8' + [dbo].[LPAD](memSeq,11,'0') 
		FROM MEMBERORDER
		SET IDENTITY_INSERT TB_MEMBER_ORDER OFF;

	--2.2 ������ �Է� TB_MEMBER_RETURN
		SET IDENTITY_INSERT TB_MEMBER_RETURN ON;
		INSERT INTO TB_MEMBER_RETURN(SEQ, TYPE, STORE_ID, ORDER_SEQ, QTY, RETURN_DATE, WHY, REG_DATE, REAL_PRICE, LOST_PRICE, PRICE_CHANGE_WHY, EMP_SEQ, MARGIN)
		SELECT SEQ, TYPE, STOREID, ORDERSEQ, QTY, RETURNDATE, WHY, REGDATE, REALPRICE, LOSTPRICE, PRICECHANGEWHY, EMPSEQ, MARGIN
		FROM MemberReturn
		SET IDENTITY_INSERT TB_MEMBER_RETURN OFF;
		
	--2.3 ������ �Է� TB_NOMEMBER_ORDER
		SET IDENTITY_INSERT TB_NO_MEMBER_ORDER ON;
		INSERT INTO TB_NO_MEMBER_ORDER(SEQ, STORE_ID, SALES_DATE, PRO_SEQ, QTY, ORIGINAL_PRICE, PRICE, LOST_PRICE, PAY_TYPE, CER_NO, EVENT_STORE_SEQ, BRAND_GIFT_PRICE, REG_DATE, PRICE_CHANGE_WHY, EMP_SEQ, CHANGE_01, CHANGE_02, MARGIN, S_PRICE, AGE, SEX, NATIONALITY)
		SELECT seq, storeID, salesDate, proSeq, qty, originalPrice, price, lostPrice, payType, cerNo, eventStoreSeq, brandGiftPrice, regdate, priceChangeWhy, empseq, change1, change2, margin, sprice, age, sex, nationality
		FROM NoMemberOrder
		SET IDENTITY_INSERT TB_NO_MEMBER_ORDER OFF;
		
	--2.4 ������ �Է� TB_NOMEMBER_RETURN(���������� ������ �̰� �� �����ؾ���.)
		SET IDENTITY_INSERT TB_NO_MEMBER_RETURN ON;
		INSERT INTO TB_NO_MEMBER_RETURN(SEQ, STORE_ID, RETURN_DATE, PRO_SEQ, QTY, PRICE, CER_NO, EVENT_STORE_SEQ, PAY_TYPE, BRAND_GIFT_PRICE, WHY, BUY_DATE, BUY_STORE_ID, REG_DATE, ORIGINAL_PRICE, LOST_PRICE, PRICE_CHANGE_WHY, EMP_SEQ, MARGIN, S_PRICE, O_SEQ)
		SELECT seq, storeID, returnDate, proSeq, qty, price, cerNo, eventStoreSeq, payType, brandGiftPrice, why, buyDate, buyStoreID, regdate, originalPrice, lostPrice, priceChangeWhy, empseq, margin, sprice, oseq
		FROM NoMemberReturn
		SET IDENTITY_INSERT TB_NO_MEMBER_RETURN OFF;

	--2.5 ������ �Է� TB_MALL_ORDER
		SET IDENTITY_INSERT TB_MALL_ORDER ON;
		INSERT INTO TB_MALL_ORDER (SEQ, NO_SEQ, CUST_NAME, CUST_PHONE, ETC, MALL)
		SELECT seq, noseq, custname, custphone, etc, mall
		FROM mallorder
		SET IDENTITY_INSERT TB_MALL_ORDER OFF;

	--2.6 ������ �Է� TB_MALL_RETURN
		SET IDENTITY_INSERT TB_MALL_RETURN ON
		INSERT INTO TB_MALL_RETURN (SEQ, NO_SEQ, CUST_NAME, CUST_PHONE, ETC, MALL)
		SELECT seq, noseq, custname, custphone, etc, mall
		FROM mallreturn
		SET IDENTITY_INSERT TB_MALL_RETURN OFF

		
	--2.7 ������ �Է� TB_MEMBER_ORDER_TRANS
		SET IDENTITY_INSERT TB_MEMBER_ORDER_TRANS ON
		INSERT INTO TB_MEMBER_ORDER_TRANS (SEQ, ORDER_SEQ, TRANS_DATE)
		SELECT seq, orderSeq, transDate
		FROM memberordertrans
		SET IDENTITY_INSERT TB_MEMBER_ORDER_TRANS OFF
	
	--2.7 ������ �Է� TB_SALES_MST
    --ȸ�� ���� ���̱׷��̼ǽ� SALES_TYPE�� 3�ΰ��� �Ѱ� ���� :(SELECT * FROM MemberOrder where type = '3': seq = '426840')

		-- ȸ�� ���� ������ ���̱׷��̼�
		-- 1. TB_MEMBER_ORDER UPDATE ó��
		UPDATE A
		SET    A.SALES_NO = B.SALES_NO,
			   A.SALES_DETAIL_NO = B.SALES_DETAIL_NO,
			   A.DIF_ADJ_AMT = A.LOST_PRICE,
			   A.DIF_ADJ_REASON = CASE WHEN ISNULL(A.PRICE_CHANGE_WHY,'') !='' AND ISNULL(A.CHANGE_01,'') != '' THEN A.PRICE_CHANGE_WHY + '|' 
									   WHEN ISNULL(A.PRICE_CHANGE_WHY,'') !='' AND ISNULL(A.CHANGE_02,'') = '' THEN A.PRICE_CHANGE_WHY
                          			   ELSE '' 
								  END +  ISNULL(CHANGE_01,'') + 
								  CASE WHEN ISNULL(CHANGE_02,'') != '' THEN '('+ CHANGE_02 +')' ELSE '' END,
			   A.DISCOUNT_RATE =CASE 
								  WHEN ISNULL(LOST_PRICE, 0) != 0 AND ISNULL(ORIGINAL_PRICE, 0) != 0
								  THEN (CONVERT(numeric,LOST_PRICE)/ORIGINAL_PRICE)*100
								  WHEN ISNULL(LOST_PRICE,0) = 0
								  THEN 0
								  ELSE 0
								  END,
			   A.NOR_PRICE = P.PRICE
		FROM   TB_MEMBER_ORDER A
			   LEFT OUTER JOIN TB_PRODUCT P 
				 ON A.PRO_SEQ = P.SEQ
			   INNER JOIN (SELECT RN,
								  SEQ,
								  SALES_NO,
								  SALES_DETAIL_NO,
								  TYPE, DATE
						   FROM   (SELECT Row_number() OVER ( ORDER BY seq ASC) rn,
										  seq,
										  'MM' + CONVERT(CHAR(8), date, 112) + dbo.Lpad(Row_number() OVER (partition BY date ORDER BY type, seq ASC), 10, '0' ) SALES_NO,
										  'DD' + CONVERT(CHAR(8), date, 112) + dbo.Lpad(Row_number() OVER (partition BY date ORDER BY type, seq ASC), 10, '0' ) SALES_DETAIL_NO,
										  type, DATE
								   FROM   (SELECT SEQ,
												  SALES_DATE DATE,
												  1          TYPE
										   FROM   TB_MEMBER_ORDER
										   UNION ALL
										   SELECT SEQ,
												  RETURN_DATE DATE,
												  2           TYPE
										   FROM   TB_MEMBER_RETURN
										   UNION ALL
										   SELECT SEQ,
												  SALES_DATE DATE,
												  3          TYPE
										   FROM   TB_NO_MEMBER_ORDER
										   UNION ALL
										   SELECT SEQ,
												  RETURN_DATE DATE,
												  4           TYPE
										   FROM   TB_NO_MEMBER_RETURN
										   ) U) T) B
					   ON A.SEQ = B.SEQ
		WHERE  B.TYPE = '1' -- ȸ�� ���� �����͸� �Է�
		
		-- 2. TB_SALES_DTL INSERT
					INSERT INTO TB_SALES_DTL 
					(SALES_NO, 
					SALES_DETAIL_NO, 
					CST_TYPE, 
					CST_NO,
					SAVE_POINT, 
					USE_POINT, 
					AGREE_YN, 
					CST_GRD_CD, 
					GRD_SALE_AMT, 
					BIZ_SALE_AMT, 
					COUPON_SALE_AMT, 
					DIF_ADJ_AMT, 
					DIF_ADJ_REASON, 
					NOR_PRICE, 
					SELL_PRICE, 
					ACT_SELL_PRICE, 
					LOSS_PRICE, 
					DISCOUNT_RATE, 
					SALES_TYPE, 
					STORE_ID, 
					SALES_DATE, 
					PRO_SEQ, 
					QTY, 
					PAY_TYPE, 
					CER_NO, 
					EVENT_STORE_SEQ, 
					BRAND_GIFT_PRICE,
					EMP_SEQ, 
					MARGIN, 
					REFUND_DATE, 
					REFUND_REASON, 
					REFUND_PRICE, 
					REFUND_LOST_PRICE,
					REFUND_STORE_ID,
					PRICE_CHANGE_REASON, 
					ORG_SALES_NO,
					ORG_SALES_DETAIL_NO,
					RES_DATE,
					REG_DATE)
					SELECT SALES_NO, 
						   SALES_DETAIL_NO, 
						   'M' CST_TYPE,
						   CST_NO,
							'0' SAVE_POINT, 
							'0' USE_POINT, 
							'N' AGREE_YN, 
							NULL CST_GRD_CD, 
							'0' GRD_SALE_AMT, 
							'0' BIZ_SALE_AMT, 
							'0' COUPON_SALE_AMT, 
							A.DIF_ADJ_AMT		DIF_ADJ_AMT, -- AS-IS �սǱݾ� �Է���
							A.DIF_ADJ_REASON	DIF_ADJ_REASON, -- AS-IS �ݾ� ���� ���� �Է���
							A.NOR_PRICE			NOR_PRICE, 
							A.ORIGINAL_PRICE	SELL_PRICE, 
							A.PRICE				ACT_SELL_PRICE, 
							A.LOST_PRICE		LOSS_PRICE, 
							A.DISCOUNT_RATE		DISCOUNT_RATE, 
							A.TYPE			    SALES_TYPE, 
							A.STORE_ID			STORE_ID, 
							A.SALES_DATE	    SALES_DATE, 
							A.PRO_SEQ			PRO_SEQ, 
							A.QTY				QTY, 
							A.PAY_TYPE			PAY_TYPE, 
							A.CER_NO			CER_NO, 
							A.EVENT_STORE_SEQ	EVENT_STORE_SEQ, 
							A.BRAND_GIFT_PRICE	BRAND_GIFT_PRICE, 
							A.EMP_SEQ			EMP_SEQ, 
							A.MARGIN			MARGIN,
							NULL				REFUND_DATE, 
							NULL				REFUND_REASON, 
							NULL				REFUND_PRICE, 
							NULL				REFUND_LOST_PRICE, 
							NULL				REFUND_STORE_ID, 
							NULL				PRICE_CHANGE_REASON, 
							NULL				ORG_SALES_NO, 
							NULL				ORG_SALES_DETAIL_NO,
							B.resDate           RES_DATE,
							REG_DATE            REG_DATE
					FROM TB_MEMBER_ORDER A
					     LEFT OUTER JOIN memResDate B
						 ON A.SEQ = B.orderseq


		-- 3. TB_SALES_MST INSERT
					INSERT INTO TB_SALES_MST
					(SALES_NO, 
					CST_TYPE, 
					CST_NO, 
					SAVE_POINT, 
					USE_POINT, 
					AGREE_YN, 
					CST_GRD_CD, 
					GRD_SALE_AMT, 
					BIZ_SALE_AMT, 
					COUPON_SALE_AMT, 
					DIF_ADJ_AMT, 
					DIF_ADJ_REASON, 
					NOR_PRICE, 
					SELL_PRICE, 
					ACT_SELL_PRICE, 
					LOSS_PRICE, 
					SALES_TYPE, 
					DISCOUNT_RATE, 
					STORE_ID, 
					SALES_DATE, 
					REG_DATE, 
					REFUND_DATE, 
					REFUND_REASON, 
					REFUND_PRICE, 
					REFUND_LOST_PRICE,
					REFUND_STORE_ID,
					PRICE_CHANGE_REASON, 
					ORG_SALES_NO,
					TOT_QTY)
					SELECT 	SALES_NO, 
							CST_TYPE, 
							CST_NO,
							SAVE_POINT, 
							USE_POINT, 
							AGREE_YN, 
							CST_GRD_CD, 
							GRD_SALE_AMT, 
							BIZ_SALE_AMT, 
							COUPON_SALE_AMT, 
							DIF_ADJ_AMT, 
							DIF_ADJ_REASON, 
							NOR_PRICE, 
							SELL_PRICE, 
							ACT_SELL_PRICE, 
							LOSS_PRICE, 
							SALES_TYPE, 
							DISCOUNT_RATE, 
							STORE_ID, 
							SALES_DATE, 
							CASE WHEN SALES_TYPE IN ('1','2') THEN SALES_DATE WHEN SALES_TYPE IN ('3','4') THEN REFUND_DATE ELSE NULL END REG_DATE,
							REFUND_DATE, 
							REFUND_REASON, 
							REFUND_PRICE, 
							REFUND_LOST_PRICE,
							REFUND_STORE_ID,
							PRICE_CHANGE_REASON, 
							ORG_SALES_NO,
							QTY
					FROM TB_SALES_DTL 
					WHERE CST_TYPE = 'M' -- AND SALES_TYPE IN ('1','2')

					
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
			-- ȸ�� ��ǰ ���� ���̱׷��̼�
			-- 1. MemberReturn ���ֹ���ȣ UPDATE
			UPDATE A
			SET A.ORG_SALES_NO = B.SALES_NO,
				A.ORG_SALES_DETAIL_NO = B.SALES_DETAIL_NO
			FROM TB_MEMBER_RETURN A
			INNER JOIN TB_MEMBER_ORDER B 
			ON A.ORDER_SEQ = B.SEQ

			-- 2. TB_MEMBER_RETURN �����ȣ UPDATE
			UPDATE A
			SET    A.SALES_NO = B.SALES_NO,
				   A.SALES_DETAIL_NO = B.SALES_DETAIL_NO,
				   A.CST_NO = O.CST_NO
			FROM   TB_MEMBER_RETURN A
				   LEFT OUTER JOIN TB_MEMBER_ORDER O
					 ON A.ORDER_SEQ = O.SEQ
				   LEFT OUTER JOIN TB_PRODUCT P 
					 ON O.PRO_SEQ = P.SEQ
				   INNER JOIN (SELECT RN,
									  SEQ,
									  SALES_NO,
									  SALES_DETAIL_NO,
									  TYPE, DATE
							   FROM   (SELECT ROW_NUMBER() OVER ( ORDER BY SEQ ASC) RN,
											  SEQ,
											  'MM' + CONVERT(CHAR(8), DATE, 112) + DBO.LPAD(ROW_NUMBER() OVER (PARTITION BY DATE ORDER BY TYPE, SEQ ASC), 10, '0' ) SALES_NO,
											  'DD' + CONVERT(CHAR(8), DATE, 112) + DBO.LPAD(ROW_NUMBER() OVER (PARTITION BY DATE ORDER BY TYPE, SEQ ASC), 10, '0' ) SALES_DETAIL_NO,
											  TYPE, DATE
									   FROM   (SELECT SEQ,
													  SALES_DATE DATE,
													  1          TYPE
											   FROM   TB_MEMBER_ORDER
											   UNION ALL
											   SELECT SEQ,
													  RETURN_DATE DATE,
													  2           TYPE
											   FROM   TB_MEMBER_RETURN
											   UNION ALL
											   SELECT SEQ,
													  SALES_DATE DATE,
													  3          TYPE
											   FROM   TB_NO_MEMBER_ORDER
											   UNION ALL
											   SELECT SEQ,
													  RETURN_DATE DATE,
													  4           TYPE
											   FROM   TB_NO_MEMBER_RETURN
											   ) U) T) B
						   ON A.SEQ = B.SEQ
			WHERE  B.TYPE = '2' -- ȸ�� ��ǰ �����͸� �Է�
			
			--3. TB_SALES_DTL INSERT
						INSERT INTO TB_SALES_DTL 
						(SALES_NO, 
						SALES_DETAIL_NO, 
						CST_TYPE, 
						CST_NO,
						SAVE_POINT, 
						USE_POINT, 
						AGREE_YN, 
						CST_GRD_CD, 
						--GRD_SALE_AMT, 
						--BIZ_SALE_AMT, 
						--COUPON_SALE_AMT, 
						--DIF_ADJ_AMT, 
						--DIF_ADJ_REASON, 
						NOR_PRICE, 
						SELL_PRICE, 
						--ACT_SELL_PRICE, 
						--LOSS_PRICE, 
						--DISCOUNT_RATE, 
						SALES_TYPE, 
						STORE_ID, 
						SALES_DATE, 
						PRO_SEQ, 
						QTY, 
						PAY_TYPE, 
						CER_NO, 
						EVENT_STORE_SEQ, 
						BRAND_GIFT_PRICE,
						EMP_SEQ, 
						MARGIN, 
						REFUND_DATE, 
						REFUND_REASON, 
						REFUND_PRICE, 
						REFUND_LOST_PRICE,
						REFUND_STORE_ID,
						PRICE_CHANGE_REASON, 
						ORG_SALES_NO,
						ORG_SALES_DETAIL_NO,
						REG_DATE)
						SELECT A.SALES_NO, 
							   A.SALES_DETAIL_NO, 
							   'M'						CST_TYPE,
							   A.CST_NO					CST_NO,
								'0'						SAVE_POINT, 
								'0'						USE_POINT, 
								B.AGREE_YN				AGREE_YN, 
								B.CST_GRD_CD			CST_GRD_CD, 
								--'0'						GRD_SALE_AMT, 
								--'0'						BIZ_SALE_AMT, 
								--'0'						COUPON_SALE_AMT, 
								--B.DIF_ADJ_AMT			DIF_ADJ_AMT, -- AS-IS �սǱݾ� �Է���
								--B.DIF_ADJ_REASON		DIF_ADJ_REASON, -- AS-IS �ݾ� ���� ���� �Է���
								B.ORIGINAL_PRICE		NOR_PRICE, 
								B.PRICE					SELL_PRICE, 
								--B.price					ACT_SELL_PRICE, 
								--A.lostPrice				LOSS_PRICE, 
								--A.DISCOUNT_RATE			DISCOUNT_RATE, 
								A.TYPE					SALES_TYPE, -- 1:����, 2:����, 3:��ǰ(��ȸ�� ���� ����)
								B.STORE_ID				STORE_ID, 
								B.SALES_DATE				SALES_DATE, 
								B.PRO_SEQ				PRO_SEQ, 
								A.QTY					QTY, 
								B.PAY_TYPE				PAY_TYPE, 
								B.CER_NO					CER_NO, 
								B.EVENT_STORE_SEQ			EVENT_STORE_SEQ, 
								B.BRAND_GIFT_PRICE		BRAND_GIFT_PRICE, 
								A.EMP_SEQ				EMP_SEQ, 
								A.MARGIN                MARGIN,
								A.RETURN_DATE			REFUND_DATE, 
								A.WHY					REFUND_REASON, 
								A.REAL_PRICE				REFUND_PRICE, 
								A.LOST_PRICE				REFUND_LOST_PRICE, 
								A.STORE_ID				REFUND_STORE_ID, 
								A.PRICE_CHANGE_WHY		PRICE_CHANGE_REASON, 
								A.ORG_SALES_NO			ORG_SALES_NO, 
								A.ORG_SALES_DETAIL_NO	ORG_SALES_DETAIL_NO,
								A.REG_DATE              REG_DATE
						FROM TB_MEMBER_RETURN A
							   LEFT OUTER JOIN TB_MEMBER_ORDER B ON A.ORDER_SEQ = B.SEQ
							   LEFT OUTER JOIN TB_PRODUCT C ON B.SEQ = B.PRO_SEQ
							   -- LEFT OUTER JOIN (SELECT * FROM CODEBOOK WHERE CODE = 'returnType') CA ON A.WHY = CA.value
							   
			-- 4. TB_SALES_MST INSERT
						INSERT INTO TB_SALES_MST
						(SALES_NO, 
						CST_TYPE, 
						CST_NO, 
						SAVE_POINT, 
						USE_POINT, 
						AGREE_YN, 
						CST_GRD_CD, 
						GRD_SALE_AMT, 
						BIZ_SALE_AMT, 
						COUPON_SALE_AMT, 
						DIF_ADJ_AMT, 
						DIF_ADJ_REASON, 
						NOR_PRICE, 
						SELL_PRICE, 
						ACT_SELL_PRICE, 
						LOSS_PRICE, 
						SALES_TYPE, 
						DISCOUNT_RATE, 
						STORE_ID, 
						SALES_DATE, 
						REG_DATE, 
						REFUND_DATE, 
						REFUND_REASON, 
						REFUND_PRICE, 
						REFUND_LOST_PRICE,
						REFUND_STORE_ID,
						PRICE_CHANGE_REASON, 
						ORG_SALES_NO,
						TOT_QTY)
						SELECT 	SALES_NO, 
								CST_TYPE, 
								CST_NO,
								SAVE_POINT, 
								USE_POINT, 
								AGREE_YN, 
								CST_GRD_CD, 
								GRD_SALE_AMT, 
								BIZ_SALE_AMT, 
								COUPON_SALE_AMT, 
								DIF_ADJ_AMT, 
								DIF_ADJ_REASON, 
								NOR_PRICE, 
								SELL_PRICE, 
								ACT_SELL_PRICE, 
								LOSS_PRICE, 
								SALES_TYPE, 
								DISCOUNT_RATE, 
								STORE_ID, 
								SALES_DATE, 
								CASE WHEN SALES_TYPE IN ('1','2') THEN SALES_DATE WHEN SALES_TYPE IN ('3','4') THEN REFUND_DATE ELSE NULL END REG_DATE,
								REFUND_DATE, 
								REFUND_REASON, 
								REFUND_PRICE, 
								REFUND_LOST_PRICE,
								REFUND_STORE_ID,
								PRICE_CHANGE_REASON, 
								ORG_SALES_NO,
								QTY
						FROM TB_SALES_DTL 
						WHERE SALES_NO != 'MM200807170000000443' -- ȸ�� ���� ���̺�(MemberOrder)�� ���ִ� ȯ��(TYPE=3) ������ ����
						AND SALES_TYPE IN ('3','4')

--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
			-- ��ȸ�� ���� ���̱׷��̼�
			-- 1. TB_NO_MEMBER_ORDER UPDATE ó��
			UPDATE A
			SET    A.SALES_NO = B.SALES_NO,
				   A.SALES_DETAIL_NO = B.SALES_DETAIL_NO,
				   A.DIF_ADJ_AMT = LOST_PRICE,
				   A.DIF_ADJ_REASON = CASE WHEN ISNULL(PRICE_CHANGE_WHY,'') !='' AND ISNULL(CHANGE_01,'') != '' THEN PRICE_CHANGE_WHY + '|' 
										   WHEN ISNULL(PRICE_CHANGE_WHY,'') !='' AND ISNULL(CHANGE_01,'') = '' THEN PRICE_CHANGE_WHY
                          				   ELSE '' 
									  END +  ISNULL(CHANGE_01,'') + 
									  CASE WHEN ISNULL(CHANGE_02,'') != '' THEN '('+ CHANGE_02 +')' ELSE '' END,
				   A.DISCOUNT_RATE =CASE 
									  WHEN ISNULL(LOST_PRICE,0) != 0 AND ISNULL(ORIGINAL_PRICE,0) != 0
									  THEN (CONVERT(NUMERIC,LOST_PRICE)/ORIGINAL_PRICE)*100
									  WHEN ISNULL(LOST_PRICE,0) = 0
									  THEN 0
									  ELSE 0
									  END,
				   A.NOR_PRICE = P.PRICE
			FROM   TB_NO_MEMBER_ORDER A
				   LEFT OUTER JOIN TB_PRODUCT P 
					 ON A.PRO_SEQ = P.SEQ
				   INNER JOIN (SELECT RN,
									  SEQ,
									  SALES_NO,
									  SALES_DETAIL_NO,
									  TYPE, DATE
							   FROM   (SELECT ROW_NUMBER() OVER ( ORDER BY SEQ ASC) RN,
											  SEQ,
											  'MM' + CONVERT(CHAR(8), DATE, 112) + DBO.LPAD(ROW_NUMBER() OVER (PARTITION BY DATE ORDER BY TYPE, SEQ ASC), 10, '0' ) SALES_NO,
											  'DD' + CONVERT(CHAR(8), DATE, 112) + DBO.LPAD(ROW_NUMBER() OVER (PARTITION BY DATE ORDER BY TYPE, SEQ ASC), 10, '0' ) SALES_DETAIL_NO,
											  type, DATE
									   FROM   (SELECT SEQ,
													  SALES_DATE DATE,
													  1          TYPE
											   FROM   TB_MEMBER_ORDER
											   UNION ALL
											   SELECT SEQ,
													  RETURN_DATE DATE,
													  2           TYPE
											   FROM   TB_MEMBER_RETURN
											   UNION ALL
											   SELECT SEQ,
													  SALES_DATE DATE,
													  3          TYPE
											   FROM   TB_NO_MEMBER_ORDER
											   UNION ALL
											   SELECT SEQ,
													  RETURN_DATE DATE,
													  4           TYPE
											   FROM   TB_NO_MEMBER_RETURN
											   ) U) T) B
						   ON A.SEQ = B.SEQ
			WHERE  B.TYPE = '3' -- ��ȸ�� ���� �����͸� �Է�

			--2. TB_SALES_DTL INSERT(��ȸ�� ���� �� ��ȸ�� �¶��� ���)
						INSERT INTO TB_SALES_DTL 
						(SALES_NO, 
						SALES_DETAIL_NO, 
						CST_TYPE, 
						CST_NO,
						SAVE_POINT, 
						USE_POINT, 
						AGREE_YN, 
						CST_GRD_CD, 
						GRD_SALE_AMT, 
						BIZ_SALE_AMT, 
						COUPON_SALE_AMT, 
						DIF_ADJ_AMT, 
						DIF_ADJ_REASON, 
						NOR_PRICE, 
						SELL_PRICE, 
						ACT_SELL_PRICE, 
						LOSS_PRICE, 
						DISCOUNT_RATE, 
						SALES_TYPE, 
						STORE_ID, 
						SALES_DATE, 
						PRO_SEQ, 
						QTY, 
						PAY_TYPE, 
						CER_NO, 
						EVENT_STORE_SEQ, 
						BRAND_GIFT_PRICE,
						EMP_SEQ, 
						MARGIN,
						REFUND_DATE, 
						REFUND_REASON, 
						REFUND_PRICE, 
						PRICE_CHANGE_REASON, 
						ORG_SALES_NO,
						ORG_SALES_DETAIL_NO,
						REG_DATE)
						SELECT SALES_NO, 
							   SALES_DETAIL_NO,
							   CASE WHEN ISNULL(C.SEQ,'') = '' THEN 'N' WHEN ISNULL(C.SEQ,'') != '' THEN 'O' ELSE '?' END CST_TYPE,
								NULL CST_NO,
				  				'0' SAVE_POINT, 
				  				'0' USE_POINT, 
				  				NULL AGREE_YN, 
				  				NULL CST_GRD_CD, 
								'0' GRD_SALE_AMT, 
								'0' BIZ_SALE_AMT, 
								'0' COUPON_SALE_AMT, 
								A.DIF_ADJ_AMT		DIF_ADJ_AMT, -- AS-IS �սǱݾ� �Է���
								A.DIF_ADJ_REASON	DIF_ADJ_REASON, -- AS-IS �ݾ� ���� ���� �Է���
								A.NOR_PRICE			NOR_PRICE, 
								A.ORIGINAL_PRICE	SELL_PRICE, 
								A.PRICE				ACT_SELL_PRICE, 
								A.LOST_PRICE		LOSS_PRICE, 
								A.DISCOUNT_RATE		DISCOUNT_RATE, 
								'1'					SALES_TYPE, -- (�ڵ�) SALESTYPE
								A.STORE_ID			STORE_ID, 
								A.SALES_DATE		SALES_DATE, 
								A.PRO_SEQ			PRO_SEQ, 
								A.QTY				QTY, 
								A.PAY_TYPE			PAY_TYPE, 
								A.CER_NO			CER_NO, 
								A.EVENT_STORE_SEQ	EVENT_STORE_SEQ, 
								A.BRAND_GIFT_PRICE	BRAND_GIFT_PRICE, 
								A.EMP_SEQ			EMP_SEQ, 
								A.MARGIN			MARGIN,
								NULL				REFUND_DATE, 
								NULL				REFUND_REASON, 
								NULL				REFUND_PRICE, 
								NULL				PRICE_CHANGE_REASON, 
								NULL				ORG_SALES_NO, 
								NULL				ORG_SALES_DETAIL_NO,
								A.REG_DATE          REG_DATE
						FROM TB_NO_MEMBER_ORDER A
							   LEFT OUTER JOIN TB_PRODUCT B
								 ON A.PRO_SEQ = B.SEQ
							   LEFT OUTER JOIN TB_MALL_ORDER C
								 ON A.SEQ = C.NO_SEQ

			--3. TB_SALES_MST INSERT
						INSERT INTO TB_SALES_MST
						(SALES_NO, 
						CST_TYPE, 
						CST_NO, 
						SAVE_POINT, 
						USE_POINT, 
						AGREE_YN, 
						CST_GRD_CD, 
						GRD_SALE_AMT, 
						BIZ_SALE_AMT, 
						COUPON_SALE_AMT, 
						DIF_ADJ_AMT, 
						DIF_ADJ_REASON, 
						NOR_PRICE, 
						SELL_PRICE, 
						ACT_SELL_PRICE, 
						LOSS_PRICE, 
						SALES_TYPE, 
						DISCOUNT_RATE, 
						STORE_ID, 
						SALES_DATE, 
						REG_DATE, 
						REFUND_DATE, 
						REFUND_REASON, 
						REFUND_PRICE, 
						REFUND_LOST_PRICE,
						REFUND_STORE_ID,
						PRICE_CHANGE_REASON, 
						ORG_SALES_NO,
						TOT_QTY)
						SELECT 	SALES_NO, 
								CST_TYPE, 
								CST_NO,
								SAVE_POINT, 
								USE_POINT, 
								AGREE_YN, 
								CST_GRD_CD, 
								GRD_SALE_AMT, 
								BIZ_SALE_AMT, 
								COUPON_SALE_AMT, 
								DIF_ADJ_AMT, 
								DIF_ADJ_REASON, 
								NOR_PRICE, 
								SELL_PRICE, 
								ACT_SELL_PRICE, 
								LOSS_PRICE, 
								SALES_TYPE, 
								DISCOUNT_RATE, 
								STORE_ID, 
								SALES_DATE, 
								CASE WHEN SALES_TYPE IN ('1','2') THEN SALES_DATE WHEN SALES_TYPE IN ('3','4') THEN REFUND_DATE ELSE NULL END REG_DATE,
								REFUND_DATE, 
								REFUND_REASON, 
								REFUND_PRICE, 
								REFUND_LOST_PRICE,
								REFUND_STORE_ID,
								PRICE_CHANGE_REASON, 
								ORG_SALES_NO,
								QTY
						FROM TB_SALES_DTL 
						WHERE SALES_NO != 'MM200807170000000443' -- ȸ�� ���� ���̺� ������ 
						AND CST_TYPE IN ('O','N')
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
			-- ��ȸ�� ��ǰ ������ ���̱׷��̼�
			--1. TB_NO_MEMBER_RETURN UPDATE ó��
			UPDATE A
			SET    A.SALES_NO = B.SALES_NO,
				   A.SALES_DETAIL_NO = B.SALES_DETAIL_NO,
				   A.NOR_PRICE = P.PRICE
			FROM   TB_NO_MEMBER_RETURN A
				   LEFT OUTER JOIN TB_PRODUCT P 
					 ON A.PRO_SEQ = P.SEQ
				   INNER JOIN (SELECT RN,
									  SEQ,
									  SALES_NO,
									  SALES_DETAIL_NO,
									  TYPE, DATE
							   FROM   (SELECT ROW_NUMBER() OVER ( ORDER BY SEQ ASC) RN,
											  SEQ,
											  'MM' + CONVERT(CHAR(8), DATE, 112) + DBO.LPAD(ROW_NUMBER() OVER (PARTITION BY DATE ORDER BY TYPE, SEQ ASC), 10, '0' ) SALES_NO,
											  'DD' + CONVERT(CHAR(8), DATE, 112) + DBO.LPAD(ROW_NUMBER() OVER (PARTITION BY DATE ORDER BY TYPE, SEQ ASC), 10, '0' ) SALES_DETAIL_NO,
											  TYPE, DATE
									   FROM   (SELECT SEQ,
													  SALES_DATE DATE,
													  1          TYPE
											   FROM   TB_MEMBER_ORDER
											   UNION ALL
											   SELECT SEQ,
													  RETURN_DATE DATE,
													  2           TYPE
											   FROM   TB_MEMBER_RETURN
											   UNION ALL
											   SELECT SEQ,
													  SALES_DATE DATE,
													  3          TYPE
											   FROM   TB_NO_MEMBER_ORDER
											   UNION ALL
											   SELECT SEQ,
													  RETURN_DATE DATE,
													  4           TYPE
											   FROM   TB_NO_MEMBER_RETURN
											   ) U) T) B
						   ON A.SEQ = B.SEQ
			WHERE  B.TYPE = '4' -- ��ȸ�� ��ǰ �����͸� �Է�

			--2. TB_SALES_DTL INSERT(��ȸ�� ��ǰ �� ��ȸ�� �¶��� ��ǰ ���)
						INSERT INTO TB_SALES_DTL 
						(SALES_NO, 
						SALES_DETAIL_NO, 
						CST_TYPE, 
						CST_NO,
						SAVE_POINT, 
						USE_POINT, 
						AGREE_YN, 
						CST_GRD_CD, 
						GRD_SALE_AMT, 
						BIZ_SALE_AMT, 
						COUPON_SALE_AMT, 
						DIF_ADJ_AMT, 
						DIF_ADJ_REASON, 
						NOR_PRICE, 
						SELL_PRICE, 
						ACT_SELL_PRICE, 
						LOSS_PRICE, 
						DISCOUNT_RATE, 
						SALES_TYPE, 
						STORE_ID, 
						SALES_DATE, 
						PRO_SEQ, 
						QTY, 
						PAY_TYPE, 
						CER_NO, 
						EVENT_STORE_SEQ, 
						BRAND_GIFT_PRICE,
						EMP_SEQ, 
						MARGIN,
						REFUND_DATE, 
						REFUND_REASON, 
						REFUND_PRICE, 
						REFUND_LOST_PRICE, 
						REFUND_STORE_ID, 
						PRICE_CHANGE_REASON, 
						ORG_SALES_NO,
						ORG_SALES_DETAIL_NO,
						REG_DATE)
						SELECT SALES_NO, 
							   SALES_DETAIL_NO, 
							   CASE WHEN ISNULL(C.SEQ,'') = '' THEN 'N' WHEN ISNULL(C.SEQ,'') != '' THEN 'O' ELSE '?' END CST_TYPE,
							   NULL CST_NO,
								'0' SAVE_POINT, 
								'0' USE_POINT, 
								NULL AGREE_YN, 
								NULL CST_GRD_CD, 
								'0' GRD_SALE_AMT, 
								'0' BIZ_SALE_AMT, 
								'0' COUPON_SALE_AMT, 
								NULL					DIF_ADJ_AMT, -- AS-IS �սǱݾ� �Է���
								NULL					DIF_ADJ_REASON, -- AS-IS �ݾ� ���� ���� �Է���
								B.price					NOR_PRICE, 
								A.original_Price		SELL_PRICE, 
								0						ACT_SELL_PRICE, 
								0						LOSS_PRICE, 
								NULL					DISCOUNT_RATE, 
								'3'						SALES_TYPE, -- 1:����, 2:����(��ȸ�� ���� ����), 3: ȯ��, 4: ���
								A.BUY_STORE_ID			STORE_ID, 
								A.BUY_DATE				SALES_DATE, 
								A.PRO_SEQ				PRO_SEQ, 
								A.QTY					QTY, 
								A.PAY_TYPE				PAY_TYPE, 
								A.CER_NO				CER_NO, 
								A.EVENT_STORE_SEQ		EVENT_STORE_SEQ, 
								A.BRAND_GIFT_PRICE		BRAND_GIFT_PRICE, 
								A.EMP_SEQ				EMP_SEQ, 
								A.MARGIN				MARGIN,
								A.RETURN_DATE			REFUND_DATE, 
								A.WHY					REFUND_REASON, 
								A.PRICE					REFUND_PRICE, 
								ISNULL(A.LOST_PRICE, 0)	REFUND_LOST_PRICE,
								A.STORE_ID				REFUND_STORE_ID,
								A.PRICE_CHANGE_WHY		PRICE_CHANGE_REASON, 
								NULL					ORG_SALES_NO, 
								NULL					ORG_SALES_DETAIL_NO,
								A.REG_DATE              REG_DATE
						FROM TB_NO_MEMBER_RETURN A
							   LEFT OUTER JOIN TB_PRODUCT B
								 ON A.PRO_SEQ = B.SEQ
							   LEFT OUTER JOIN TB_MALL_RETURN C
								 ON A.SEQ = C.NO_SEQ

			--3. TB_SALES_MST INSERT
						INSERT INTO TB_SALES_MST
						(SALES_NO, 
						CST_TYPE, 
						CST_NO, 
						SAVE_POINT, 
						USE_POINT, 
						AGREE_YN, 
						CST_GRD_CD, 
						GRD_SALE_AMT, 
						BIZ_SALE_AMT, 
						COUPON_SALE_AMT, 
						DIF_ADJ_AMT, 
						DIF_ADJ_REASON, 
						NOR_PRICE, 
						SELL_PRICE, 
						ACT_SELL_PRICE, 
						LOSS_PRICE, 
						SALES_TYPE, 
						DISCOUNT_RATE, 
						STORE_ID, 
						SALES_DATE, 
						REG_DATE, 
						REFUND_DATE, 
						REFUND_REASON, 
						REFUND_PRICE, 
						REFUND_LOST_PRICE,
						REFUND_STORE_ID,
						PRICE_CHANGE_REASON, 
						ORG_SALES_NO,
						TOT_QTY)
						SELECT 	SALES_NO, 
								CST_TYPE, 
								CST_NO,
								SAVE_POINT, 
								USE_POINT, 
								AGREE_YN, 
								CST_GRD_CD, 
								GRD_SALE_AMT, 
								BIZ_SALE_AMT, 
								COUPON_SALE_AMT, 
								DIF_ADJ_AMT, 
								DIF_ADJ_REASON, 
								NOR_PRICE, 
								SELL_PRICE, 
								ACT_SELL_PRICE, 
								LOSS_PRICE, 
								SALES_TYPE, 
								DISCOUNT_RATE, 
								STORE_ID, 
								SALES_DATE, 
								CASE WHEN SALES_TYPE IN ('1','2') THEN SALES_DATE WHEN SALES_TYPE IN ('3','4') THEN REFUND_DATE ELSE NULL END REG_DATE,
								REFUND_DATE, 
								REFUND_REASON, 
								REFUND_PRICE, 
								REFUND_LOST_PRICE,
								REFUND_STORE_ID,
								PRICE_CHANGE_REASON, 
								ORG_SALES_NO,
								QTY
						FROM TB_SALES_DTL 
						WHERE CST_TYPE IN ('O','N')
						and SALES_TYPE = '3'

-- �Ǹ� �� �߰� ���� ��� ������Ʈ 
MERGE INTO TB_SALES_DTL A
  USING (SELECT ISNULL(B.SALES_DETAIL_NO, ISNULL(C.SALES_DETAIL_NO, ISNULL(D.SALES_DETAIL_NO, E.SALES_DETAIL_NO))) SALES_DETAIL_NO,
            CASE 
               WHEN B.SALES_DETAIL_NO IS NOT NULL THEN 'MMO' -- MEMBER_ORDER
               WHEN C.SALES_DETAIL_NO IS NOT NULL THEN 'MMR' -- MEMDER_RETURN
               WHEN D.SALES_DETAIL_NO IS NOT NULL THEN 'NMO' -- NO_MEMBER_ORDER
               WHEN E.SALES_DETAIL_NO IS NOT NULL THEN 'NMR' -- NO_MEMBER_RETURN
            END ORIGIN_DATA_TYPE,
            CASE 
               WHEN B.SALES_DETAIL_NO IS NOT NULL THEN B.SEQ -- MEMBER_ORDER
               WHEN C.SALES_DETAIL_NO IS NOT NULL THEN C.SEQ -- MEMDER_RETURN
               WHEN D.SALES_DETAIL_NO IS NOT NULL THEN D.SEQ -- NO_MEMBER_ORDER
               WHEN E.SALES_DETAIL_NO IS NOT NULL THEN E.SEQ -- NO_MEMBER_RETURN
            END ORIGIN_DATA_SEQ,
            ISNULL(F.TRANS_DATE, A.SALES_DATE) TRANS_DATE
       FROM TB_SALES_DTL A
         LEFT JOIN TB_MEMBER_ORDER B ON A.SALES_DETAIL_NO = B.SALES_DETAIL_NO
         LEFT JOIN TB_MEMBER_RETURN C ON A.SALES_DETAIL_NO = C.SALES_DETAIL_NO
         LEFT JOIN TB_NO_MEMBER_ORDER D ON A.SALES_DETAIL_NO = D.SALES_DETAIL_NO
         LEFT JOIN TB_NO_MEMBER_RETURN E ON A.SALES_DETAIL_NO = E.SALES_DETAIL_NO
         LEFT JOIN TB_MEMBER_ORDER_TRANS F ON B.SEQ = F.ORDER_SEQ) B
   ON A.SALES_DETAIL_NO = B.SALES_DETAIL_NO
  WHEN MATCHED THEN
    UPDATE SET
     A.ORIGIN_DATA_TYPE = B.ORIGIN_DATA_TYPE,
     A.ORIGIN_DATA_SEQ = B.ORIGIN_DATA_SEQ,
     A.TRANS_DATE = B.TRANS_DATE;
     



--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
-- ���̱׷��̼� ���� �� ������� �Է�
ALTER TABLE [dbo].[TB_MEMBER_ORDER]  WITH NOCHECK ADD  CONSTRAINT [TB_MEMBER_ORDER_MOQTY_CHECK] CHECK  (([QTY]>(0)))
GO
ALTER TABLE [dbo].[TB_MEMBER_ORDER] CHECK CONSTRAINT [TB_MEMBER_ORDER_MOQTY_CHECK]
GO
ALTER TABLE [dbo].[TB_MEMBER_ORDER]  WITH NOCHECK ADD  CONSTRAINT [TB_MEMBER_ORDER_NOQTY_CHECK] CHECK  (([QTY]>(0)))
GO
ALTER TABLE [dbo].[TB_MEMBER_ORDER] CHECK CONSTRAINT [TB_MEMBER_ORDER_NOQTY_CHECK]
GO
ALTER TABLE [dbo].[TB_MEMBER_RETURN]  WITH NOCHECK ADD  CONSTRAINT [TB_MEMBER_RETURN_MRQTY_CHECK] CHECK  (([QTY]>(0)))
GO
ALTER TABLE [dbo].[TB_MEMBER_RETURN] CHECK CONSTRAINT [TB_MEMBER_RETURN_MRQTY_CHECK]
GO
ALTER TABLE [dbo].[TB_NO_MEMBER_RETURN]  WITH NOCHECK ADD  CONSTRAINT [TB_NO_MEMBER_RETURN_QTY_CHECK] CHECK  (([QTY]>(0)))
GO
ALTER TABLE [dbo].[TB_NO_MEMBER_RETURN] CHECK CONSTRAINT [TB_NO_MEMBER_RETURN_QTY_CHECK]
GO
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
		-- ȸ�� �޸�
		SET IDENTITY_INSERT TB_MEMBER_MEMO ON
		INSERT INTO TB_MEMBER_MEMO
			  (SEQ, MEM_SEQ, STORE_ID, MEMO_DATE, MEMO, REG_DATE)
		SELECT seq, MemSeq, StoreId, MemoDate, memo, regdate
		FROM MemberMemo
		SET IDENTITY_INSERT TB_MEMBER_MEMO OFF
		
--------------------------------------------------------------------------------------------


------------------------------------------------------- EDI ���� ���� -------------------------------------------------------
CREATE TABLE [dbo].[TB_EDI_SALES](
	[SEQ] [int] IDENTITY(1,1) NOT NULL,
	[STORE_SEQ] [int] NULL,
	[MARGIN] [int] NULL,
	[SALES_DATE] [datetime] NULL,
	[EDI_PRICE] [numeric](17, 4) NULL,
	[NOTE] [nvarchar](400) NULL,
	[REG_USER] [nvarchar](50) NULL,
	[REG_DATE] [datetime] NULL,
 CONSTRAINT [PK_TB_EDI_SALES] PRIMARY KEY CLUSTERED 
(
	[SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET IDENTITY_INSERT TB_EDI_SALES ON;
INSERT INTO TB_EDI_SALES (SEQ, STORE_SEQ, MARGIN, SALES_DATE, EDI_PRICE, NOTE, REG_USER, REG_DATE)
SELECT A.seq		SEQ,			-- PK
	   S.SEQ		STORE_SEQ,		-- �ŷ�ó SEQ
	   A.margin		MARGIN,			-- ���� KEY
	   A.edidate	SALES_DATE,		-- EDI ��������
	   A.edi		EDI_PRICE,		-- EDI �ݾ�
	   A.note		NOTE,			-- ��� 
	   A.storeid	REG_USER,		-- ��ϸ���ID
	   A.regdate	REG_DATE		-- �������
FROM EdiMargin A 
	 LEFT JOIN TB_STORE S ON A.storeid = S.STORE_ID
WHERE 1=1 
SET IDENTITY_INSERT TB_EDI_SALES OFF;

