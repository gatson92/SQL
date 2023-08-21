-- PIVOT ������ ����� �����͸� ��� ���� �ٲپ� ��ȸ�մϴ�.
SELECT Column1, [Value1], [Value2], ... ,[ValueN]
FROM
(
  SELECT Column1, Column2, Column3
  FROM TableName
) AS SourceTable
PIVOT
(
  MIN(Column2)             -- ���� �Լ��� �����մϴ�.
  FOR Column3 IN ([Value1], [Value2], ... ,[ValueN])     -- �� �̸��� �����մϴ�.
) AS PivotTable;
