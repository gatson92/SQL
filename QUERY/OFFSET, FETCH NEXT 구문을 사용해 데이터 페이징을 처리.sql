-- OFFSET, FETCH NEXT 구문을 사용해 데이터 페이징을 처리합니다.
SELECT Column1, Column2, ...
FROM TableName
ORDER BY Column1
OFFSET 10 ROWS
FETCH NEXT 20 ROWS ONLY;
