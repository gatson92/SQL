-- ������ �÷� ���� �ߺ��� �� �߿��� ������ ���� �����Ͽ� �����մϴ�.
WITH CTE AS (
    SELECT Column1, Column2, Column3,
        ROW_NUMBER() OVER(PARTITION BY Column1, Column2, Column3 ORDER BY Column1) AS RN
    FROM TableName
)
DELETE FROM CTE WHERE RN > 1;
