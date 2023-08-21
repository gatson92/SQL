-- UNPIVOT ������ ����� ���� ������ �ٲپ� ��ȸ�մϴ�.
SELECT Column1, Column2, Column3
FROM
(
  SELECT Column1, [Value1], [Value2], ... ,[ValueN]
  FROM TableName
) AS SourceTable
UNPIVOT
(
  Column2                      -- �� �̸��� �����մϴ�.
  FOR Column3 IN ([Value1], [Value2], ... ,[ValueN])     -- �� �̸��� �����մϴ�.
) AS UnpivotTable;
