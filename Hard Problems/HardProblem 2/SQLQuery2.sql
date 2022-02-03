--USE sandbox

SET ANSI_NULL_DFLT_ON ON /*new columns accept NULL by default*/;
SET ANSI_NULLS ON	/*controls ISO standard for NULL interpretation*/;
SET ANSI_PADDING ON  /*adds trailing zeroes and blank spaces for CHAR and binary*/;
SET ANSI_WARNINGS ON	/*(with ARITHABORT) controls how various operations related to exceptions are handled (divide by zero)*/;
SET ARITHABORT ON	/*(with ANSI_WARNINGS) controls how various operations related to exceptions are handled (divide by zero)*/;
SET CONCAT_NULL_YIELDS_NULL ON	/*concatenating a null value with a string yields a NULL*/;
SET QUOTED_IDENTIFIER ON	/*allows you to use double quotes to imply object names*/;
SET XACT_ABORT ON	/*I make batch-transactions less insane*/;

BEGIN TRANSACTION;
	/*
		A single unit of work that, if successful and ended with an implicit or an explicit COMMIT statement,
		 makes all data modifications made during the transaction a permanent part of the database.
		 If unsuccessful or ended with an implicit or an explicit ROLLBACK statement then all data modifications
		 made during the transaction will be erased.
			--MSDN: Transaction Statements
			--https://msdn.microsoft.com/en-us/library/ms174377.aspx
	*/
PRINT CONCAT(SYSDATETIMEOFFSET(), ' - ', DB_NAME());

-- =============================================
-- Author:		AshDaad
-- Creation on:	yyyy-MM-dd
-- Work Items:	Assignment#?
-- Description:	Comment
-- =============================================

--CREATE TABLE Data (
--  id INT NOT NULL,
--  user_id INT NOT NULL
--);

--INSERT INTO Data (id, user_id) VALUES
--(1, 1),
--(2, 1),
--(3, 1),
--(4, 1),
--(5, 1),
--(6, 0),
--(7, 1),
--(8, 1),
--(9, 0),
--(10, 1);


--CREATE TABLE Users (
--  id INT NOT NULL
--);

--INSERT INTO Users (id) VALUES
--(0),
--(1);

--SELECT
--	*
--FROM
--	Data

--SELECT 
--	DBO.Users.id, 
--	CONCAT(Data.id ORDER BY Data.user_id) AS rowList 
--FROM 
--	DBO.Users 
--	LEFT JOIN DBO.Data 
--	ON dbo.Users.id = dbo.Data.user_id 
--GROUP BY 
--	DBO.Users.id







Print 'ROLLBACK'ROLLBACK TRANSACTION;
--Print 'COMMIT'COMMIT WORK;
/*

*/