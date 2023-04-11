
EXECUTE ERP_LINK.NEOE.dbo.sp_executesql
   N'SELECT A.TABLE_NAME
	         ,	A.COLUMN_NAME
	         ,	A.DATA_TYPE
	         ,	ISNULL(CAST(A.Character_Maximum_Length as VARCHAR), CAST(A.Numeric_Precision as VARCHAR) + '','' + CAST(A.Numeric_Scale as VARCHAR)) Column_Length,A.Column_Default
	         ,	CASE WHEN A.Is_Nullable = ''YES'' THEN ''Y'' ELSE ''N'' END Is_Nullable
	         ,	A.COLLATION_NAME
	         ,	''----------'' 
	         ,	*  
	   FROM INFORMATION_SCHEMA.COLUMNS A
      WHERE 1=1
	    AND A.TABLE_NAME = ''MA_CODEDTL''
	  ORDER BY A.COLUMN_NAME
   '


