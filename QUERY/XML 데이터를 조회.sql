-- XML �����͸� ��ȸ�ϱ� ���� �ڵ��Դϴ�.
SELECT XMLCol.value('(Column1)[1]', 'VARCHAR(100)') AS Column1,
       XMLCol.value('(Column2)[1]', 'INT') AS Column2,
       XMLCol.value('(Column3)[1]', 'DATETIME') AS Column3
FROM TableName
CROSS APPLY XMLCol.nodes('/RootNode/Row') AS XMLNodes(XMLCol);
