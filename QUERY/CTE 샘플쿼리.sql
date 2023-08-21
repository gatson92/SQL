-- CTE 구문을 사용해 데이터를 재사용할 수 있는 임시 테이블로 만듭니다.
WITH CTEName AS (
  SELECT Column1, Column2, ...
  FROM TableName
)
SELECT Column1, Column2, ...
FROM CTEName
WHERE Condition;
