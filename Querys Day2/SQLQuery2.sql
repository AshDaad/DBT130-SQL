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

CREATE TABLE dbo.MyFamily
(
	firstName VARCHAR(100) NOT NULL,

);
CREATE TABLE dbo.MyFriends
(
	firstName VARCHAR(100) NOT NULL,
	isDead BIT

);
INSERT INTO MyFriends
(
firstName,
isDead
)
VALUES
('BFF', 1)

--CREATE SCHEMA DBA;

SELECT
	*
FROM
	MyFamily

SELECT
	firstName anAlias, 
	isDead anotherAlias
FROM
	MyFriends


--ALTER TABLE MyFamily
--ADD isDead BIT



Print 'ROLLBACK'ROLLBACK TRANSACTION;
--Print 'COMMIT'COMMIT WORK;
/*
2016-04-01 17:57:26.9672777 -06:00 - sandbox

(1 row(s) affected)

(0 row(s) affected)

(1 row(s) affected)
COMMIT
*/