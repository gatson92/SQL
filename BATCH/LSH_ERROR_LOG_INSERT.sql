USE [WOORIM_221201]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[LSH_ERROR_LOG_INSERT]
	@LOC		VARCHAR(100) = '',	-- ���� �߻� ��ġ
	@MSG		VARCHAR(MAX) = '',	-- �����޽���
	@TRACE		VARCHAR(MAX) = '',	-- ���� TRACE
	@NOTE		VARCHAR(500) = '',	-- �޸𳻿�
	@LOGIN_ID	VARCHAR(10),	-- �α��� ���
	@LOGIN_IP	VARCHAR(20)		-- �α��� IP
 AS
/******************************************************************************
** File: LSH_ERROR_LOG_INSERT.SQL
** Name: [LSH_ERROR_LOG_INSERT]
**
** Desc: ���� �α� ���
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
** Auth: �̻���
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



