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
-- Creation on:	2016-04-04
-- Work Items:	A2
-- Description:	A2-First SQL Exercise
-- =============================================

CREATE TABLE People
(
	personId INT IDENTITY,
	firstName VARCHAR(100),
	lastName VARCHAR(100),
	DOB DATE,
	Tel VARCHAR(15),
	address VARCHAR(200),
	city VARCHAR(200),
	usState VARCHAR(2),
	zip VARCHAR(13)
)

INSERT INTO People (firstName, lastName, DOB, Tel, address, city, usState, zip)
VALUES ('James', 'Hoxworth', '8/13/83', '202-268-5843', '2534 Passaic Street', 'Washington', 'DC', '20011'), 
('Kathleen', 'Ray', '5/15/1979', '603-625-1961', '2115 Elliott Street', 'Manchester', 'NH', '03101')


SELECT
	*
FROM
	People

UPDATE People
SET zip='20010'
WHERE lastName = 'Hoxworth';

SELECT
	*
FROM
	People
WHERE
	lastName = 'Hoxworth';

DELETE FROM People
WHERE firstName = 'Kathleen' AND lastName = 'Ray';

SELECT
	*
FROM
	People

TRUNCATE TABLE People

SELECT
	*
FROM
	People


DROP TABLE People


Print 'ROLLBACK'ROLLBACK TRANSACTION;
--Print 'COMMIT'COMMIT WORK;
/*

*/