-- CROSS APPLY, OUTER APPLY 구문을 사용해 서브쿼리의 결과를 조인합니다.
SELECT Column1, FuncResult
FROM TableName
CROSS APPLY (SELECT Func(Column2) AS FuncResult) AS SubQuery;
