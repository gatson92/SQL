-- CROSS APPLY, OUTER APPLY ������ ����� ���������� ����� �����մϴ�.
SELECT Column1, FuncResult
FROM TableName
CROSS APPLY (SELECT Func(Column2) AS FuncResult) AS SubQuery;
