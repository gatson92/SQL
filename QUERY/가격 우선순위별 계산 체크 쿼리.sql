

--2 * 온라인 // 3 * 매대 // 4 * 품목
SELECT PROSEQ,  
	   COALESCE ( MAX(CASE WHEN ISEVENT = 2 AND PRICE <> 0 THEN PRICE END),		-- 1. 온라인행사
				  MAX(CASE WHEN ISEVENT = 4 AND PRICE <> 0 THEN PRICE END),		-- 2. 품목행사가				  
				  0																-- 4. 영원한건 절대없어
				) AS FINAL_PRICE
  FROM PRODUCTEVENTPRICE
 WHERE ACTIVE = 'A'
 GROUP BY PROSEQ;
