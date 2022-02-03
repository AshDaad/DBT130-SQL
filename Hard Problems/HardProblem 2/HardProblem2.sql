USE TSQL2012

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
-- Creation on:	2016-04-14
-- Work Items:	Hard problem 2
-- Description:	Doing it for the rollback because
-- justin case attorney at law.
-- =============================================
--SELECT * FROM 
--HR.Employees
--	LEFT JOIN
--		HR.Employees AS Manager
--		ON Manager.empid = HR.Employees.mgrid


SELECT
	CONCAT(ISNULL(HR.Employees.titleofcourtesy, ' '), ' ',
	 ISNULL(HR.Employees.firstname, ' '), ' ',
	 ISNULL(HR.Employees.lastname + ', ', ' '), ' ',
	  ISNULL(HR.Employees.title, ' ')) AS All_Employee
FROM
	HR.Employees


SELECT
	CONCAT(ISNULL(HR.Employees.titleofcourtesy, ' '), ' ',
	 ISNULL(HR.Employees.firstname, ' '), ' ',
	 ISNULL(HR.Employees.lastname + ', ', ' '), ' ',
	  ISNULL(HR.Employees.title, ' ')) AS TitleOfCourtesy_Filter
FROM
	HR.Employees
EXCEPT
SELECT
	CONCAT(ISNULL(HR.Employees.titleofcourtesy, ' '), ' ', 
	ISNULL(HR.Employees.firstname, ' '), ' ',
	 ISNULL(HR.Employees.lastname + ', ', ' '), ' ',
	  ISNULL(HR.Employees.title, ' ')) AS TitleOfCourtesy_Filter
FROM
	HR.Employees
WHERE
	Employees.titleofcourtesy = 'Mr.'




--SELECT
--	CONCAT(ISNULL(HR.Employees.titleofcourtesy, ' '), ' ', ISNULL(HR.Employees.firstname, ' '), ' ', ISNULL(HR.Employees.lastname + ', ', ' '), ' ', ISNULL(HR.Employees.title, ' ')) AS Employee,
--	CONCAT(ISNULL(Manager.titleofcourtesy, ' '), ' ', ISNULL(Manager.firstname, ' '), ' ', ISNULL(Manager.lastname + ', ', ' '), ' ', ISNULL(Manager.title, ' ')) AS Managers
--FROM
--	HR.Employees
--	LEFT JOIN
--		HR.Employees AS Manager
--		ON Manager.empid = HR.Employees.mgrid


--SELECT
--	CONCAT(ISNULL(HR.Employees.titleofcourtesy, ' '), ' ', ISNULL(HR.Employees.firstname, ' '), ' ', ISNULL(HR.Employees.lastname + ', ', ' '), ' ', ISNULL(HR.Employees.title, ' ')) AS Employee,
--	CONCAT(ISNULL(Manager.titleofcourtesy, ' '), ' ', ISNULL(Manager.firstname, ' '), ' ', ISNULL(Manager.lastname + ', ', ' '), ' ', ISNULL(Manager.title, ' ')) AS Managers
--FROM
--	HR.Employees
--	LEFT JOIN
--		HR.Employees AS Manager
--		ON Manager.empid = HR.Employees.mgrid
--EXCEPT
--SELECT
--	CONCAT(ISNULL(HR.Employees.titleofcourtesy, ' '), ' ', ISNULL(HR.Employees.firstname, ' '), ' ', ISNULL(HR.Employees.lastname + ', ', ' '), ' ', ISNULL(HR.Employees.title, ' ')) AS Employee,
--	CONCAT(ISNULL(Manager.titleofcourtesy, ' '), ' ', ISNULL(Manager.firstname, ' '), ' ', ISNULL(Manager.lastname + ', ', ' '), ' ', ISNULL(Manager.title, ' ')) AS Managers
--FROM
--	HR.Employees
--	LEFT JOIN
--		HR.Employees AS Manager
--		ON Manager.empid = HR.Employees.mgrid
--WHERE
--	Manager.mgrid IS NOT NULL
--	OR Employees.empid IS NULL

			

Print 'ROLLBACK'ROLLBACK TRANSACTION;
--Print 'COMMIT'COMMIT WORK;
/*

*/