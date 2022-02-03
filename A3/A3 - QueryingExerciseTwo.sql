/*****************************************************

			INSTRUCTIONS

1.  Use your transaction-snippet from Assignment 1 to wrap the SQL used to satisfy the questions below.
	Answers should include the internal code used, as well as the MsgLog output.
	(see Question 0 for example) 

2.  Do not paste the query results into this file, unless specifically requested
	in the question. When doing so, you can "Generate Results to Text (keyboard shortcut Ctrl + T, instead of the normal Grid output Ctrl + D)

4.  Submit this file with your answers in Canvas by the deadline as a .sql file.

5.	If you end up finding some foreign syntax that you've never seen before, RESEARCH IT! eg. N'Strings, CROSS APPLY, SET IDENTITY_INSERT etc.
	I'm going to ask you to explain what the syntax you use / copy is doing, and why you chose to use it.
	Explanations like, "It was the first script I found on Stack-overflow" will earn a verbal thrashing,
	while habitual, researchless-code copying will result in much stronger consequence: accademic misconduct.

Plain English answers should be commented out, like these instructions
or the questions themselves.

*****************************************************/

/* Example Question 0.0
	What tables exist in the TSQL2012 Database?
*/
	USE TSQL2012
	SELECT
		*
	FROM
		INFORMATION_SCHEMA.TABLES
	--WHERE
	--	TABLES.TABLE_TYPE LIKE '%table%' --comment this filter out to see the VIEWs
	/*
	2016-04-05 23:29:24.9426019 -06:00 - TSQL2012

	(12 row(s) affected)
	ROLLBACK
	*/
/*
1.1 Using AND/OR logic (no "in" syntax), list all the orders that were shipped to 
Utah, Idaho, and Wyoming.  Use an appropriate order.
*/

SELECT
	*
FROM
	Sales.Orders
WHERE
	Sales.Orders.shipregion = 'UT'
	OR Sales.Orders.shipregion = 'ID'
	OR Sales.Orders.shipregion = 'WY'

/*
2016-04-07 11:05:40.2278031 -06:00 - TSQL2012

(40 row(s) affected)
ROLLBACK
*/

/*
1.2 Using AND/OR logic (no "in" syntax), list all the orders placed in 2008 
 that were shipped to Utah, Idaho, and Wyoming.  Use an appropriate order.
*/

SELECT
	*
FROM
	Sales.Orders
WHERE 
	YEAR(orderdate)= '2008' 
	AND (Sales.Orders.shipregion = 'UT' 
		OR  Sales.Orders.shipregion = 'ID'
		OR  Sales.Orders.shipregion = 'WY'
	)
/*
2016-04-07 15:09:09.0578375 -06:00 - TSQL2012

(13 row(s) affected)
ROLLBACK
*/

/*
1.3 Using the "in" syntax, list all the orders placed in 2008 that were shipped 
 to Utah, Idaho, and Wyoming.
*/

SELECT
	*
FROM
	Sales.Orders
WHERE 
	YEAR(orderdate)= '2008'	
	AND
	 Sales.Orders.shipregion IN
	(
		'UT',
		'ID',
		'WY'
	)
/*
2016-04-07 16:17:40.2829832 -06:00 - TSQL2012

(13 row(s) affected)
ROLLBACK
*/


/* 1.4
ENGLISH: Walk me through how to figure out how many rows the 1.5 query should return
without writing or running 1.5.
Hint, look at the entire orders table and your response to 1.1.
*/

/*
By counting them, that's how I did it...I don't know how else
*/


/*
1.5 List all the orders except those shipped to Utah, Idaho, and Wyoming.

(Think: Does your row count match what you anticipated in 1.4?  If not, why?
Make sure your query and its output are correct)
*/

SELECT
	--COUNT(Sales.Orders.shipregion) AS thisWasTheCountRemember,
	--Sales.Orders.shipregion 
	*
FROM
	Sales.Orders
WHERE 
	YEAR(orderdate)= '2008' 
	AND
	Sales.Orders.shipregion 
	 IN
	(
	NULL,	  
	'DF',	  
	'MT',	  
	'CA',	  	  
	'Isle of Wight',	  
	'AK',	  
	'Nueva Esparta',	  
	'Québec',	  
	'Essex',	  
	'Lara',	  
	'BC',
	'Táchira',		  
	'NM',	  
	'Co. Cork',	  
	'WA',	  
	'OR',	  	  
	'RJ',	  
	'SP'				 	  
	)
--GROUP BY
--	Sales.Orders.shipregion
--ORDER BY
--	COUNT(Sales.Orders.shipregion)

Print 'ROLLBACK'ROLLBACK TRANSACTION;
--Print 'COMMIT'COMMIT WORK;
/*
2016-04-07 18:24:53.2303086 -06:00 - TSQL2012

(91 row(s) affected)
ROLLBACK

*/


/*
2.1 ENGLISH: If every current employee sold one order to every current customer, 
 how many orders would result?  Show your math and explain.
*/
SELECT
	COUNT(*)
FROM
	Sales.Customers

	

Print 'ROLLBACK'ROLLBACK TRANSACTION;
--Print 'COMMIT'COMMIT WORK;
/*

2016-04-07 18:38:39.8662966 -06:00 - TSQL2012

(1 row(s) affected)
ROLLBACK

*/

/*
I got 91
*/


/*
2.2 Write the query that returns all the possible combinations of employees and customers.
*/
SELECT
	Sales.Orders.empid,
	Sales.Orders.custid
	--*
FROM
	Sales.Orders
/*
2016-04-07 20:50:47.8878082 -06:00 - TSQL2012

(830 row(s) affected)
ROLLBACK
*/

/*
3.1 List all the orders placed by the employee with the last name of King.  No hardcoding 
 of King's empId in your query.  Specifying 'King' is ok.  (No subqueries!)
*/

SELECT
	Sales.Orders.empid, Sales.Orders.orderid
FROM
	Sales.Orders
	INNER JOIN HR.Employees
		ON Sales.Orders.empid = HR.Employees.empid
WHERE
	HR.Employees.lastname LIKE '%King%'

/*
2016-04-07 21:12:46.5416397 -06:00 - TSQL2012
(72 row(s) affected)
ROLLBACK
*/



/*
4.1 Using orders, customers, and employees tables, select the Order Id, the Order Date, 
the customer company name and the employee last name for each order
*/

SELECT
	Sales.Orders.orderid, 
	Sales.Orders.orderdate, 
	Sales.Customers.companyname,
	HR.Employees.lastname
FROM
	Sales.Orders
	LEFT OUTER JOIN HR.Employees
		ON Sales.Orders.empid = HR.Employees.empid
	RIGHT OUTER JOIN Sales.Customers
		ON Sales.Orders.custid = Sales.Customers.custid

/*
2016-04-07 21:27:26.9339455 -06:00 - TSQL2012

(832 row(s) affected)
ROLLBACK

*/

/*
5.1 List the customers who have not placed orders.
*/
SELECT
	Sales.Orders.orderid, 
	Sales.Orders.orderdate, 
	Sales.Customers.companyname,
	HR.Employees.lastname
FROM
	Sales.Orders
	LEFT OUTER JOIN HR.Employees
		ON Sales.Orders.empid = HR.Employees.empid
	RIGHT OUTER JOIN Sales.Customers
		ON Sales.Orders.custid = Sales.Customers.custid
WHERE
	Sales.Orders.orderid IS NULL

/*
2016-04-07 21:33:43.8696861 -06:00 - TSQL2012
orderid     orderdate               companyname                              lastname
----------- ----------------------- ---------------------------------------- --------------------
NULL        NULL                    Customer DTDMN                           NULL
NULL        NULL                    Customer WVAXS                           NULL

(2 row(s) affected)

ROLLBACK
*/

/*
5.2 List the employees who didn't place any sales in the first week of January
(1/1 to 1/7 inclusive) in 2008.
*/
SELECT
  HR.Employees.firstname,
  YEAR(orderdate) AS Jan08,
  COUNT(DISTINCT custid) AS Sales
FROM 
	Sales.Orders
	RIGHT OUTER JOIN HR.Employees
		ON Sales.Orders.empid = HR.Employees.empid
WHERE
	(orderdate BETWEEN '2008-01-01' AND '2008-01-07')
	AND
	custid IS NULL
GROUP BY 
	firstname, 
	YEAR(orderdate)

/*
2016-04-07 22:51:10.3770221 -06:00 - TSQL2012

(0 row(s) affected)
ROLLBACK
*/

/*
6.1 List each supplier who has at least one discontinued product.  Do not repeat suppliers
 in the results.
*/

SELECT
	Suppliers.companyname,
	Products.discontinued
FROM
	Production.Products
	RIGHT OUTER JOIN
		Production.Suppliers
		ON
			Suppliers.supplierid = Products.supplierid
WHERE
	Products.discontinued >= 1
GROUP BY
	Products.discontinued,
	Suppliers.companyname

/*
2016-04-07 23:15:00.0143199 -06:00 - TSQL2012
companyname                              discontinued
---------------------------------------- ------------
Supplier CIYNM                           1
Supplier GQRCV                           1
Supplier JNNES                           1
Supplier QOVFD                           1
Supplier SVIYA                           1
Supplier UNAHG                           1
Supplier VHQZD                           1

(7 row(s) affected)

ROLLBACK
*/


/*
7.1 List the employee name, employee title, manager name, and manager title for each employee.  Use 
 clear column aliases for your results, and do not exclude any employees in your list.
*/
SELECT
	CONCAT(HR.Employees.titleofcourtesy,' ',HR.Employees.firstname,' ',HR.Employees.lastname, ', ', HR.Employees.title) AS Employee,
	CONCAT(Manager.titleofcourtesy,' ',Manager.firstname,' ',Manager.lastname, ', ', Manager.title) AS Managers
FROM
	HR.Employees
	LEFT JOIN
		HR.Employees AS Manager
		ON 
			Manager.empid = HR.Employees.mgrid 

/*
2016-04-08 08:22:06.1875172 -06:00 - TSQL2012
Employee                                                                                  Managers
----------------------------------------------------------------------------------------- -----------------------------------------------------------------------------------------
Ms. Sara Davis, CEO                                                                         , 
Dr. Don Funk, Vice President, Sales                                                       Ms. Sara Davis, CEO
Ms. Judy Lew, Sales Manager                                                               Dr. Don Funk, Vice President, Sales
Mrs. Yael Peled, Sales Representative                                                     Ms. Judy Lew, Sales Manager
Mr. Sven Buck, Sales Manager                                                              Dr. Don Funk, Vice President, Sales
Mr. Paul Suurs, Sales Representative                                                      Mr. Sven Buck, Sales Manager
Mr. Russell King, Sales Representative                                                    Mr. Sven Buck, Sales Manager
Ms. Maria Cameron, Sales Representative                                                   Ms. Judy Lew, Sales Manager
Ms. Zoya Dolgopyatova, Sales Representative                                               Mr. Sven Buck, Sales Manager
Mr. William Porter, Sales Representative                                                  Mr. Sven Buck, Sales Manager

(10 row(s) affected)

ROLLBACK
*/


/*
8.1 List the product name and price history for Product Id 42 in chronological order.
 "Price history" represents how the price of a product has changed over time.
*/
SELECT
	Production.Products.productname,
	Production.Products.unitprice,
	YEAR(orderdate) AS History,
	COUNT(DISTINCT custid) AS Sales
FROM 
	Production.Products
	RIGHT OUTER JOIN Sales.OrderDetails
		ON Production.Products.productid = Sales.OrderDetails.productid
	Left OUTER JOIN Sales.Orders
		ON Sales.OrderDetails.orderid = Sales.Orders.orderid
WHERE
	(orderdate BETWEEN '2006' AND '2009')
	AND
	Production.Products.productid = 42
GROUP BY 
	productname,
	Products.unitprice, 
	YEAR(orderdate)

/*
2016-04-08 08:48:26.4805439 -06:00 - TSQL2012
productname                              unitprice             History     Sales
---------------------------------------- --------------------- ----------- -----------
Product RJVNM                            14.00                 2006        5
Product RJVNM                            14.00                 2007        13
Product RJVNM                            14.00                 2008        7

(3 row(s) affected)

ROLLBACK
*/

/* 9.1
List the suppliers and customers who live in the same city.
*/
SELECT
	Production.Suppliers.companyname,
	Production.Suppliers.city,
	Sales.Customers.companyname
FROM 
	Production.Suppliers
	RIGHT OUTER JOIN Sales.Customers
		ON Production.Suppliers.city = Sales.Customers.city
WHERE
	Production.Suppliers.city = Sales.Customers.city

/*
2016-04-08 10:03:00.3685684 -06:00 - TSQL2012
companyname                              city            companyname
---------------------------------------- --------------- ----------------------------------------
Supplier SWRXU                           London          Customer HFBZG
Supplier SWRXU                           London          Customer UBHAU
Supplier SWRXU                           London          Customer GYBBY
Supplier SWRXU                           London          Customer RFNQC
Supplier SWRXU                           London          Customer GCJSG
Supplier SWRXU                           London          Customer AHPOP
Supplier UNAHG                           Sao Paulo       Customer JUWXK
Supplier UNAHG                           Sao Paulo       Customer KIDPX
Supplier UNAHG                           Sao Paulo       Customer WFIZJ
Supplier UNAHG                           Sao Paulo       Customer YQQWW
Supplier ZPYVS                           Berlin          Customer NRZBB
Supplier LVJUA                           Paris           Customer WVAXS
Supplier LVJUA                           Paris           Customer YSHXL
Supplier ERVYZ                           Montréal        Customer PVDZC

(14 row(s) affected)

ROLLBACK
*/



/* 9.2
ENGLISH (SQL if necessary): Does the order of tables (A Join B vs B Join A) change the result
when writing an inner join?
*/
/*
 No, it seems to give the same, if not very similar results either way for just a basic inner join
*/
SELECT
	Production.Suppliers.companyname,
	Production.Suppliers.city,
	Sales.Customers.companyname
FROM 
	Production.Suppliers
	JOIN Sales.Customers
		ON Production.Suppliers.city = Sales.Customers.city
WHERE
	Production.Suppliers.city = Sales.Customers.city

SELECT
	Production.Suppliers.companyname,
	Production.Suppliers.city,
	Sales.Customers.companyname
FROM 
	Sales.Customers
	JOIN Production.Suppliers
		ON Sales.Customers.city = Production.Suppliers.city
WHERE
	Production.Suppliers.city = Sales.Customers.city

/*
2016-04-08 10:08:35.2812928 -06:00 - TSQL2012
companyname                              city            companyname
---------------------------------------- --------------- ----------------------------------------
Supplier SWRXU                           London          Customer HFBZG
Supplier SWRXU                           London          Customer UBHAU
Supplier SWRXU                           London          Customer GYBBY
Supplier SWRXU                           London          Customer RFNQC
Supplier SWRXU                           London          Customer GCJSG
Supplier SWRXU                           London          Customer AHPOP
Supplier UNAHG                           Sao Paulo       Customer JUWXK
Supplier UNAHG                           Sao Paulo       Customer KIDPX
Supplier UNAHG                           Sao Paulo       Customer WFIZJ
Supplier UNAHG                           Sao Paulo       Customer YQQWW
Supplier ZPYVS                           Berlin          Customer NRZBB
Supplier LVJUA                           Paris           Customer WVAXS
Supplier LVJUA                           Paris           Customer YSHXL
Supplier ERVYZ                           Montréal        Customer PVDZC

(14 row(s) affected)

companyname                              city            companyname
---------------------------------------- --------------- ----------------------------------------
Supplier SWRXU                           London          Customer HFBZG
Supplier SWRXU                           London          Customer UBHAU
Supplier SWRXU                           London          Customer GYBBY
Supplier SWRXU                           London          Customer RFNQC
Supplier SWRXU                           London          Customer GCJSG
Supplier SWRXU                           London          Customer AHPOP
Supplier UNAHG                           Sao Paulo       Customer JUWXK
Supplier UNAHG                           Sao Paulo       Customer KIDPX
Supplier UNAHG                           Sao Paulo       Customer WFIZJ
Supplier UNAHG                           Sao Paulo       Customer YQQWW
Supplier ZPYVS                           Berlin          Customer NRZBB
Supplier LVJUA                           Paris           Customer WVAXS
Supplier LVJUA                           Paris           Customer YSHXL
Supplier ERVYZ                           Montréal        Customer PVDZC

(14 row(s) affected)

ROLLBACK
*/

/* 9.3
List the suppliers who live in the same city as a customer.  Do not duplicate suppliers in the results.
*/
SELECT DISTINCT
	Production.Suppliers.companyname,
	Production.Suppliers.city
FROM 
	Sales.Customers
	JOIN Production.Suppliers
		ON Sales.Customers.city = Production.Suppliers.city
WHERE
	Production.Suppliers.city = Sales.Customers.city
ORDER BY
	Suppliers.companyname
/*
2016-04-08 10:44:07.7336956 -06:00 - TSQL2012
companyname                              city
---------------------------------------- ---------------
Supplier ERVYZ                           Montréal
Supplier LVJUA                           Paris
Supplier SWRXU                           London
Supplier UNAHG                           Sao Paulo
Supplier ZPYVS                           Berlin

(5 row(s) affected)

ROLLBACK
*/


/* 9.4
List the customers who live in the same city as a supplier.  Do not duplicate customers in the results.
*/
SELECT DISTINCT
	Sales.Customers.companyname,
	Sales.Customers.city
FROM 
	Production.Suppliers
	JOIN Sales.Customers
		ON Sales.Customers.city = Production.Suppliers.city
WHERE
	Production.Suppliers.city = Sales.Customers.city
ORDER BY
	Sales.Customers.companyname,
	Sales.Customers.city
/*
2016-04-08 12:43:22.1659664 -06:00 - TSQL2012
companyname                              city
---------------------------------------- ---------------
Customer AHPOP                           London
Customer GCJSG                           London
Customer GYBBY                           London
Customer HFBZG                           London
Customer JUWXK                           Sao Paulo
Customer KIDPX                           Sao Paulo
Customer NRZBB                           Berlin
Customer PVDZC                           Montréal
Customer RFNQC                           London
Customer UBHAU                           London
Customer WFIZJ                           Sao Paulo
Customer WVAXS                           Paris
Customer YQQWW                           Sao Paulo
Customer YSHXL                           Paris

(14 row(s) affected)

ROLLBACK
*/

/* 9.5
ENGLISH: Describe how you can anticipate the number of results when running an inner join.
*/
/*
Depending on what you are quering for you can expect to recieve at least the same length as the longest tabled you are joining
*/

/* 10.1
ENGLISH: Explain why you might use a full join when joining two tables.
*/

/*
Because the two tables that you are joining might be set up so that they correspond with eachother and line up .
They could also be small enough to not overwelm someone who needs to look through them as well.
*/


/*
Extra Credit (.2 points; the assigment is worth 4 total) Look at the region column on the customers table.  It's populated on some
 rows but not on others.  Does the country determine whether region is populated?
 Write a single query that determines whether there are any countries who's region is specified
 on some rows but not on others.
*/