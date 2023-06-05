USE [WOORIM_221201]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[LSH_ERROR_LOG_INSERT]
	@LOC		VARCHAR(100) = '',	-- 오류 발생 위치
	@MSG		VARCHAR(MAX) = '',	-- 오류메시지
	@TRACE		VARCHAR(MAX) = '',	-- 오류 TRACE
	@NOTE		VARCHAR(500) = '',	-- 메모내용
	@LOGIN_ID	VARCHAR(10),	-- 로그인 사번
	@LOGIN_IP	VARCHAR(20)		-- 로그인 IP
 AS
/******************************************************************************
** File: LSH_ERROR_LOG_INSERT.SQL
** Name: [LSH_ERROR_LOG_INSERT]
**
** Desc: 오류 로그 기록
**
** EXEC dbo.[LSH_ERROR_LOG_INSERT] ''
** This template can be customized: 
**
** Return values:
**
** Called by: 
**
** Parameters:
** Input Output
** ---------- -----------
**
** Auth: 이상현
** Date: 2023.01.02
*******************************************************************************
** Change History
*******************************************************************************
** Date:		Author:	Description:
** ---------	------	-------------------------------------------
*******************************************************************************/
SET NOCOUNT ON;

BEGIN

	
	INSERT INTO ERROR_LOG
		(
			CALLED_LOC,
			ER_MSG,
			STACK_TRACE,
			NOTE,
			RGTID,
			RGTIP,
			RGTDT
		)
	VALUES
		(
			@LOC,
			@MSG,
			@TRACE,
			@NOTE,
			@LOGIN_ID,
			@LOGIN_IP,
			GETDATE()
		)



END



