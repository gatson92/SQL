-- UNPIVOT 구문을 사용해 열을 행으로 바꾸어 조회합니다.
SELECT Column1, Column2, Column3
FROM
(
  SELECT Column1, [Value1], [Value2], ... ,[ValueN]
  FROM TableName
) AS SourceTable
UNPIVOT
(
  Column2                      -- 열 이름을 지정합니다.
  FOR Column3 IN ([Value1], [Value2], ... ,[ValueN])     -- 열 이름을 지정합니다.
) AS UnpivotTable;
