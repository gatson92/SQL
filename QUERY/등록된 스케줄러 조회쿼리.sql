SELECT
	A.job_id, A.name, A.enabled , description, A.date_created, A.date_modified , 
	D.step_id, D.step_name, D.subsystem, D.command 
FROM msdb.dbo.sysjobs A 
	INNER JOIN msdb.dbo.sysjobschedules B ON A.job_id = B.job_id 
	INNER JOIN msdb.dbo.sysschedules C ON B.schedule_id = C.schedule_id 
	INNER JOIN msdb.dbo.sysjobsteps D ON A.job_id = D.job_id 
ORDER BY A.name
