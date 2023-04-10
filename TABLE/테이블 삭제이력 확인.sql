SELECT 
    A.LoginName, 
    A.StartTime, 
    A.ServerName, 
    A.ObjectName,
	A.HostName,
	A.*
FROM fn_trace_gettable(CONVERT(VARCHAR(150), (SELECT TOP 1 value  FROM sys.fn_trace_getinfo(NULL)  WHERE property = 2)), DEFAULT) A
WHERE A.EventClass = 47 
  AND A.EventSubClass = 1 
  AND A.ObjectType = 8277 
ORDER BY A.StartTime DESC;
