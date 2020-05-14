/*SQL BASIC Exercises*/

/*Exercise - 1*/ 
/*Customers who live in Berlin city would be displayed*/
SELECT * FROM classicmodels.Customers WHERE city = 'Berlin';

/*Exercise - 2*/
/*Customers and the related details of them who live in the country Germany would be displayed*/
SELECT * FROM classicmodels.customers WHERE country = 'Germany';

/*Exercise - 3*/
/*Customers who live in the country Australia and all the relevant values would be displayed*/
SELECT * FROM classicmodels.customers WHERE country = 'Australia';

/*Exercise - 4*/
/*Displays the customerNumber and customerName of all the customers who live in the city Madrid*/
SELECT customerNumber, customerName FROM classicmodels.customers WHERE city = 'Madrid';

/*Exercise - 5*/
/*Displays the customers and relevant details of them, those who live in the state California and Country USA*/
SELECT * FROM classicmodels.customers WHERE state = 'CA' OR Country = 'USA';

/*Exercise - 6*/
/*Displays the customers and relevant values who live in the country Germany and city Berlin */
SELECT * FROM classicmodels.customers WHERE country = 'Germany' AND city = 'Berlin';

/*Exercise - 7*/
/*Displays the customers and relevant values who doesn't live in any of the countries Germany and Usa*/
SELECT * FROM classicmodels.customers WHERE country != 'Germany' AND country != 'USA';

/*Exercise - 8*/
/*Displays the customers and relevant values who live in either Berlin city or München and country Germany*/
SELECT * FROM classicmodels.customers WHERE country = 'Germany' AND city = 'Berlin' OR city = 'München';

/*Exercise - 9*/
/*Displays all the values of the column country from the customers table*/
SELECT country FROM classicmodels.customers;

/*Exercise - 10*/
/*Displays the unique country values from the customers table*/
SELECT DISTINCT country FROM classicmodels.customers;

/*Exercise - 11*/
/*Displays the unique city values from the customers table */
SELECT DISTINCT city FROM classicmodels.customers;

/*Exercise - 12*/
/*Displays unique customers who live in Germany and in one of the cities Berlin or München*/
SELECT DISTINCT customerNumber from classicmodels.customers
WHERE country = 'Germany' AND city = 'Berlin' OR city = 'München';

/*ORDER BY Excercises*/
/*Ascending or Descending order*/

/*Exercise 13*/
/*The query orders the countrynames of all customers in ascending order*/
SELECT country FROM classicmodels.customers
ORDER BY country ASC;

/* Exercise 14*/
/*All unique countries the table customers will be displayed and ordered in descending order*/
SELECT DISTINCT country FROM classicmodels.customers
ORDER BY country DESC;

/* Exercise 15*/
/*All unique cities in the customers table will be displayed, arranged in ascending order of the custoerNumber*/
SELECT DISTINCT city FROM classicmodels.customers
ORDER BY customerNumber ASC;

/* Exercise 16 */
/*All the rows of customers table will be returned ordered country in ascending order and customername in descending order*/
SELECT country, customerName, C.* 
FROM classicmodels.customers C
ORDER BY country ASC, customerName DESC;

/* Execise 17*/
/* It inserts new record with all column values*/
INSERT INTO classicmodels.customers
VALUES(12582, 'Knam Collectibles', 'Bmmk', 
'Aravind', '+407987222', '32 Mst avenue', '', 'Allentown', 'PA', '7026', 'USA', 1088, 999.99);

/* Exercise 18 */
/* It inserts new record with the mention columns being updated with the given values*/
INSERT INTO classicmodels.customers
(customerNumber,customerName, contactLastName, contactFirstName, AddressLine1, phone, city, country, salesRepEmployeeNumber, creditLimit)
VALUES (99554, 'Pnam Collectibles', 'Bmmk', 
'Aravind', '32 Mst avenue', '989-765-7655', 'Allentown', 'USA', 1088, 999.99);


/*Exercise 19*/
/*All the records where addressLine2 is NULL value would be returned*/

SELECT * FROM classicmodels.customers
WHERE addressLine2 is NULL;

/*Exercise 20*/
/*All the records where state value is NULL would be returned*/

SELECT * FROM classicmodels.customers
WHERE state IS NOT NULL;

/*Exercise 21*/
/*All the records where city is not a null value, i.e a definite value, and state is null would be returned*/
SELECT * FROM classicmodels.customers
WHERE city IS NOT NULL AND state IS NULL;

/*Exercise 22*/
/*All the records where postalCode is NULL is returned */
SELECT * FROM classicmodels.customers
WHERE postalCode IS NULL;

/*UPDATE and DELETE Exercises*/
/*Exercise 23*/
/*The address of the customer with customerNumber 999, would be updated with the new given address*/

UPDATE classicmodels.customers
SET addressLine1 = '55 avenue',
addressLine2 = 'Mn Colony',
city = 'Plainwood' , state = 'MA',
postalCode = '5214' 
WHERE customerNumber = '999';

SELECT * FROM classicmodels.customers WHERE customerNumber = 999;

/*Exercise 24 */
/*The specific record with customerNumber 1446 would be deleted from the table*/
DELETE FROM classicmodels.customers
WHERE customerNumber = 1446;

/*Exercise 25*/
/*The specific record of the customer with Last name as Bmmk would be deleted*/
DELETE FROM classicmodels.customers WHERE
contactLastname = 'Bmmk';

/* Exercise 26*/
/*Understanding of UPDATE and DELETE functions*/
/* UPDATE function enables the user to change existing values of various columns to new values
   DELETE function enables the user to delete a specific set of records with the given criteria */

/*Exercises on MIN and MAX functions*/
/* Exercise - 27*/
/* The query returns the minimum value of quantity ordered from the orderdetails table*/
SELECT MIN(quantityordered) FROM classicmodels.orderdetails;

/* Exercise - 28*/
/*The query returns the maximum value of quantity ordered from the orderdetails table*/
SELECT MAX(quantityordered) FROM classicmodels.orderdetails;

/* Exercise - 29*/
/*The order with the minimum ordernumber would be returned*/
SELECT MIN(ordernumber) FROM classicmodels.orders;

/* Exercise - 30*/
/* Order number which has the maximum price of a product would be returned from the orderdetails table */
SELECT MAX(priceEach) from classicmodels.orderdetails;

/* Exercise - 31*/
/* The total count of the number of products would be returned*/
SELECT COUNT(productCode) FROM classicmodels.products;

/* Exercise - 32*/
/* The average price of the products within the motorcycles productline will be returned*/
SELECT AVG(MSRP) FROM classicmodels.products 
WHERE productLine = 'motorcycles';

/* Exercise - 33*/
/*The total quantity ordered for a particular order which includes all products is returned*/
SELECT SUM(quantityOrdered) FROM classicmodels.orderdetails
WHERE orderNumber = 10100;

/* Exercise - 34*/
/*All the column values of the product with highest price is returned*/
SELECT * FROM classicmodels.orderdetails
WHERE priceEach in (select Max(priceEach) from classicmodels.orderdetails);

/* Exercise - 35*/
/*All the records with customers whose name starts with A are returned*/
SELECT * FROM classicmodels.customers
WHERE customerName LIKE 'A%';

/* Exercise - 36*/
/*All the records with customers whose name ends with A are returned*/
SELECT * FROM classicmodels.customers
WHERE customerName LIKE '%A';

/* Exercise - 37*/
/*All the records with customers whose name has a second character as r is returned*/
SELECT * FROM classicmodels.customers
WHERE customerName LIKE '_r%';

/* Exercise - 38*/
/*All the records with customers whose name starts with S and have a minimum of four characters are printed*/
SELECT * FROM classicmodels.customers
WHERE customerName LIKE 'S___%';

/* Exercise - 39*/
/*All the records of customers who live in Norway and France are returned*/
SELECT * FROM classicmodels.customers
where country IN ('Norway', 'France');

/* Exercise - 40*/
/*All the customers who live in USA, Sweden, Spain, Polan are returned*/
SELECT * FROM classicmodels.customers
WHERE country IN ('USA', 'Sweden', 'Spain', 'Poland');

/* Exercise - 41*/
/*All the customers who live in countries where the company has offices are returned*/
SELECT * FROM classicmodels.customers WHERE country IN
(SELECT DISTINCT country FROM classicmodels.OFFICES);

/* Exercise - 42*/
/*All the records of customers who don't live in USA or China are returned*/
SELECT * FROM classicmodels.customers WHERE country NOT IN ('USA', 'China');

/* Exercise - 43*/
/*All the products which are more than 3000 and less than 5000 in stock are returned*/
SELECT * FROM classicmodels.products WHERE
quantityInStock BETWEEN 3000 AND 5000;

/* Exercise - 44*/
/*All the orders which are placed between the dates october 10th 2003 and February 10th 2004 are returned*/
SELECT * FROM classicmodels.orders WHERE
orderDate BETWEEN '2003-10-10' AND '2004-02-10';

/* Exercise - 45*/
/*All the customers who live in Norway and France are returned and the results has the column heading as Customer_Name*/
SELECT customerName Customer_Name FROM classicmodels.customers
WHERE country in ('Norway', 'France');

/* Exercise - 46*/
/*Full name of the customers would be printed*/
SELECT CONCAT(contactLastName,' - ',contactFirstName) AS Full_Name
FROM classicmodels.customers;

/* Exercise - 47*/
/*Full name of all the customers whose customerNumber is less than 200 is printed*/
SELECT CONCAT(contactLastName,' - ',contactFirstName) AS Full_Name
FROM classicmodels.customers WHERE customerNumber < 200;

/* Exercise - 48*/
/*All the customer whose country is not in USA or China would be returned and the output has the column name CSTM*/
SELECT CSTM.customerName 
FROM classicmodels.customers AS CSTM
WHERE country NOT IN ('USA', 'China');

/* Exercise - 49*/
/*All the customers and the respecive matched orders from the orders table would be printed*/
SELECT * FROM classicmodels.customers
INNER JOIN classicmodels.orders
ON customers.customerNumber = orders.customerNumber;

/* Exercise - 50*/
/*All the products and their respective order details from the orderdetails table would be printed*/
SELECT DISTINCT productName 
FROM classicmodels.products INNER JOIN classicmodels.orderdetails
ON products.productCode = orderdetails.productCode;




































