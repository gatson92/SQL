-- CTE ������ ����� �����͸� ������ �� �ִ� �ӽ� ���̺�� ����ϴ�.
WITH CTEName AS (
  SELECT Column1, Column2, ...
  FROM TableName
)
SELECT Column1, Column2, ...
FROM CTEName
WHERE Condition;
