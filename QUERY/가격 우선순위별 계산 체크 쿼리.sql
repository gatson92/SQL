

--2 * �¶��� // 3 * �Ŵ� // 4 * ǰ��
SELECT PROSEQ,  
	   COALESCE ( MAX(CASE WHEN ISEVENT = 2 AND PRICE <> 0 THEN PRICE END),		-- 1. �¶������
				  MAX(CASE WHEN ISEVENT = 4 AND PRICE <> 0 THEN PRICE END),		-- 2. ǰ����簡				  
				  0																-- 4. �����Ѱ� �������
				) AS FINAL_PRICE
  FROM PRODUCTEVENTPRICE
 WHERE ACTIVE = 'A'
 GROUP BY PROSEQ;
