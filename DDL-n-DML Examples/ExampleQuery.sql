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

/*
			DDL Example Tables
*/

CREATE TABLE customers
( customer_id int NOT NULL,
  last_name char(50) NOT NULL,
  first_name char(50) NOT NULL,
  favorite_website char(50),
  CONSTRAINT customers_pk PRIMARY KEY (customer_id));

CREATE TABLE orders
( order_id int NOT NULL,
  customer_id int NOT NULL,
  CONSTRAINT orders_pk PRIMARY KEY (order_id));

CREATE TABLE contacts
( contact_id int NOT NULL,
  last_name char(50) NOT NULL,
  first_name char(50) NOT NULL,
  CONSTRAINT contacts_pk PRIMARY KEY (contact_id));

CREATE TABLE products
( product_id int NOT NULL,
  product_name char(50) NOT NULL,
  quantity int,
  CONSTRAINT products_pk PRIMARY KEY (product_id)
);
  
CREATE TABLE summary_data
( product_id int NOT NULL,
  current_levels int,
  CONSTRAINT summary_data_pk PRIMARY KEY (product_id)
);

CREATE TABLE archival
( product_id int,
  CONSTRAINT archival_pk PRIMARY KEY (product_id)
);


/*
			DML Example Statements
*/

INSERT INTO customers
(customer_id, last_name, first_name, favorite_website)
VALUES
(4000,'Jackson','Joe','www.techonthenet.com');

INSERT INTO customers
(customer_id, last_name, first_name, favorite_website)
VALUES
(5000,'Smith','Jane','www.digminecraft.com');

INSERT INTO customers
(customer_id, last_name, first_name, favorite_website)
VALUES
(6000,'Ferguson','Samantha','www.bigactivities.com');

INSERT INTO customers
(customer_id, last_name, first_name, favorite_website)
VALUES
(7000,'Reynolds','Allen','www.checkyourmath.com');

INSERT INTO customers
(customer_id, last_name, first_name, favorite_website)
VALUES
(8000,'Anderson','Paige',NULL);

INSERT INTO customers
(customer_id, last_name, first_name, favorite_website)
VALUES
(9000,'Johnson','Derek','www.techonthenet.com');

INSERT INTO orders
(order_id, customer_id)
VALUES
(1,5000);

INSERT INTO orders
(order_id, customer_id)
VALUES
(2,6000);

INSERT INTO orders
(order_id, customer_id)
VALUES
(3,7000);

INSERT INTO orders
(order_id, customer_id)
VALUES
(4,9000);

INSERT INTO products
(product_id, product_name, quantity)
VALUES
(1,'Pear',25);

INSERT INTO products
(product_id, product_name, quantity)
VALUES
(2,'Banana',0);

INSERT INTO products
(product_id, product_name, quantity)
VALUES
(3,'Orange',18);

INSERT INTO products
(product_id, product_name, quantity)
VALUES
(4,'Apple',45);

INSERT INTO summary_data
(product_id, current_levels)
VALUES
(1,10);

INSERT INTO summary_data
(product_id, current_levels)
VALUES
(2,10);

INSERT INTO summary_data
(product_id, current_levels)
VALUES
(3,10);

INSERT INTO summary_data
(product_id, current_levels)
VALUES
(4,10);

INSERT INTO summary_data
(product_id, current_levels)
VALUES
(5,10);

INSERT INTO archival
(product_id)
VALUES
(1);

INSERT INTO archival
(product_id)
VALUES
(2);

INSERT INTO archival
(product_id)
VALUES
(3);

INSERT INTO archival
(product_id)
VALUES
(4);

INSERT INTO archival
(product_id)
VALUES
(5);


/*
		The actual search statement
*/

SELECT *
FROM customers

WHERE EXISTS (SELECT *
              FROM orders
              WHERE customers.customer_id = orders.customer_id);


Print 'ROLLBACK'ROLLBACK TRANSACTION;
--Print 'COMMIT'COMMIT WORK;
/*

*/