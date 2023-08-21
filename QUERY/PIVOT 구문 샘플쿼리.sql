-- PIVOT 구문을 사용해 데이터를 행과 열을 바꾸어 조회합니다.
SELECT Column1, [Value1], [Value2], ... ,[ValueN]
FROM
(
  SELECT Column1, Column2, Column3
  FROM TableName
) AS SourceTable
PIVOT
(
  MIN(Column2)             -- 집계 함수를 지정합니다.
  FOR Column3 IN ([Value1], [Value2], ... ,[ValueN])     -- 열 이름을 지정합니다.
) AS PivotTable;
