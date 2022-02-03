/*****************************************************

			Assignment 2

			INSTRUCTIONS

1.  Do all your work in your sandboxDatabase and the TSQL2012 database.

2.  Complete all queries and answers in this file, with each query 
	directly below its question.  Your queries should not be commented out.  Do not delete
	the question text or renumber the questions.  All questions require SQL
	responses unless marked with "English".

3.  Do not paste the query results into this file, unless specifically requested
	in the question.

4.  Submit this file with your answers in Canvas by the deadline as a .sql file.

6.  For clarity: "List" means Select (* unless otherwise specified).

7.  All responses are to be SQL queries unless the question specifies ENGLISH.

8.  There is no need for Group by or Having clauses in any response.

For full credit, there must be no syntax errors in this file.

Plain English answers should be commented out, like these instructions
or the questions themselves.

*****************************************************/
/* 1.1
Create a database named as a concatination of your first name and 'Sandbox' (Pascal Case) eg. RobertSandbox
*/
CREATE DATABASE AshSandbox
--Command(s) completed successfully.
--2016-04-04 17:29:00.3229513 -06:00 - TSQL2012


/* 2.1
Switch to your sandbox database.
*/
USE AshSandbox;
GO
--Command(s) completed successfully.
--2016-04-04 17:34:00.5673892 -06:00 - TSQL2012



/* 3.1
Add a table called People to the database with the following
columns: personId, first name, last name, date of birth, phone number,
and all the fields necessary for a full US address.  Use 
data types for each field that match and will be able to contain
data for people living in the US.

-- Hint: personId should be an IDENTITY column (primary key etc.) 
*/
CREATE TABLE People
(
	personId INT IDENTITY,
	firstName VARCHAR(100) NOT NULL,
	lastName VARCHAR(100) NOT NULL,
	DOB DATETIME NOT NULL,
	Tel VARCHAR(15),
	address VARCHAR(200) NOT NULL,
	city VARCHAR(200) NOT NULL,
	usState VARCHAR(2) NOT NULL,
	zip VARCHAR(13) NOT NULL
)



/* 3.2
Add two people to the People table, populating all columns
for each person.
*/
INSERT INTO People (firstName, lastName, DOB, Tel, address, city, usState, zip)
VALUES ('James', 'Hoxworth', 8/13/1983, '202-268-5843', '2534 Passaic Street', 'Washington', 'DC', '20011'), 
('Kathleen', 'Ray', 5/15/1979, '603-625-1961', '2115 Elliott Street', 'Manchester', 'NH', '03101')


/* 3.3
Return all the people in the People table.
*/
SELECT
	*
FROM
	People



/* 3.4
Assume you made a mistake on the zip code for one of the 
people.  Fix the mistake with an update.
*/
UPDATE People
SET zip='20010'
WHERE lastName = 'Hoxworth';


/* 3.5
Make sure your update worked by returning the row
for just that person.
*/
SELECT
	*
FROM
	People
WHERE
	lastName = 'Hoxworth';


/* 3.6
Delete the row you didn't update.
*/
DELETE FROM People
WHERE firstName = 'Kathleen' AND lastName = 'Ray';


/* 3.7
Make sure the row you updated is still there with 
a select.
*/
SELECT
	*
FROM
	People


/* 3.8
Delete all the remaining rows (there should be just one) in the 
Person table.
*/
TRUNCATE TABLE People


/* 4.1 ENGLISH
What happens when you run a select on the Person table, which
is now empty?  What is returned?  ("Nothing" is really correct.  
Something _is_ returned)
*/

--No data is returned but the colums are still returned


/* 4.2
Remove the People table from the DBT130 database.
*/
DROP TABLE People


/* 4.3 ENGLISH
Now try selecting from a table that doesn't exist.  What
is returned?  (Again, "nothing" isn't correct)
*/

--An error telling me the the table people is an invalid object name

/* 5.0 SQL + ENGLISH
Use the LoadTSQL2012.sql script from the Files section on the LMS to load the TSQL2012 database.
Tell me 3 things that this script is doing.
*/
IF DB_ID('TSQL2012') IS NOT NULL DROP DATABASE TSQL2012;
--If there is already a database names 'TSQL2012' it drops it.

CREATE DATABASE TSQL2012;
GO

USE TSQL2012;
GO
--Then it creates the database and switches to it.

CREATE TABLE Production.Categories
(
  categoryid   INT           NOT NULL IDENTITY,
  categoryname NVARCHAR(15)  NOT NULL,
  description  NVARCHAR(200) NOT NULL,
  CONSTRAINT PK_Categories PRIMARY KEY(categoryid)
);
--then it creates tables for the companies departsments and fills their columns


/* 5.1
Change contexts to the TSQL2012 database.
*/


/* 6.1
Return all the Employees who live in London.
*/
SELECT
	* 
FROM
	HR.Employees
WHERE
	city='London'



/* 6.2
Add an Employee to the employees table. (Read the next question
before starting this one... they're related)
*/

INSERT INTO HR.Employees(lastname, firstname, title, titleofcourtesy, birthdate, hiredate, address, city, region, postalcode, country, phone, mgrid)
VALUES('Porter','William', 'Sales Representative', 'Mr.','4/13/1964','4/13/1992','1058 Diane Street','Newbury Park','CA','91320','USA','805-447-5364','5')




/* 6.3 ENGLISH
List here any headaches, problems, or specific hoops you had
to jump through to be able to add a new employee.
*/

/*
No headqches or problems, it was actually very simple I just did the "INSERT INTO" command and 
when ever I run the "SELECT * FROM HR.Employees I can see my person.
*/


/* 7.1 ENGLISH
What are at least two ways you can discover the table definition,
meaning the data types, key fields, and whether fields allow
nulls or not.
*/

/*
One way I did was I made a new Database Diagram, leaded up all the tables, changed the tables view to
standared and clicked one the ones I wanted to know.
Another way I found is that in the object explorer you can click on the table folder in the database, go to the table you want click columns 
and it displays the variables.
*/





/* 8.1 ENGLISH
What are the advantages and disadvantages of requiring a field
in a table to be "Not Null"?
*/

--Because if you are regestering for an account you will need to imput a name so that prevents 
--required info from not being collected.