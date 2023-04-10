USE WOORIM_230215;
GO

SELECT 
    [Transaction ID], 
    Operation, 
    Context, 
    AllocUnitName
FROM fn_dblog(NULL,NULL)
WHERE 1=1
  AND AllocUnitName LIKE 'dbo.YourTableName'
  AND Operation = 'LOP_DELETE_ROWS' 
  AND Context IN ('LCX_MARK_AS_GHOST', 'LCX_HEAP') 



SELECT 
    [RowLog Contents 0]
FROM fn_dblog(NULL,NULL)
WHERE 
    [Transaction ID] = 'YourTransactionID' 
    AND AllocUnitName = 'dbo.YourTableName'
    AND Operation = 'LOP_DELETE_ROWS';
