-- XML 데이터를 조회하기 위한 코드입니다.
SELECT XMLCol.value('(Column1)[1]', 'VARCHAR(100)') AS Column1,
       XMLCol.value('(Column2)[1]', 'INT') AS Column2,
       XMLCol.value('(Column3)[1]', 'DATETIME') AS Column3
FROM TableName
CROSS APPLY XMLCol.nodes('/RootNode/Row') AS XMLNodes(XMLCol);
