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
-- Creation on:	2016-04-1
-- Work Items:	New Table
-- Description:	making a new table
-- =============================================
CREATE TABLE nerds
(
	personId INT IDENTITY,
	name VARCHAR(100)
)

--SET IDENTITY_INSERT nerds ON;
INSERT INTO nerds (name)
VALUES ('Tim'), ('Tim'), ('Tim'), ('Tim'), ('Tim')

INSERT INTO MyFriends (firstName, isDead)
VALUES ('The Dentise', 0), ('The Elephant', 0), ('Vlad', 0), ('The Kamisar', 1), ('Bane', 0);

INSERT INTO MyFamily (firstName, isDead)
VALUES ('Dallas', 0), ('Chains', 0), ('Wolf', 0), ('Huston', 0), ('Hoxton', 0), ('Jacket', 1);


SELECT
	*
FROM
	nerds
SELECT
	*
FROM
	dbo.MyFriends

SELECT
	*
FROM
	dbo.MyFamily

CREATE TABLE BiggerNerds
(
	name VARCHAR(100)
)


Print 'ROLLBACK'ROLLBACK TRANSACTION;
--Print 'COMMIT'COMMIT WORK;
/*

*/