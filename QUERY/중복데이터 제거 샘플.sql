-- 지정한 컬럼 값이 중복된 행 중에서 삭제할 행을 선택하여 삭제합니다.
WITH CTE AS (
    SELECT Column1, Column2, Column3,
        ROW_NUMBER() OVER(PARTITION BY Column1, Column2, Column3 ORDER BY Column1) AS RN
    FROM TableName
)
DELETE FROM CTE WHERE RN > 1;
