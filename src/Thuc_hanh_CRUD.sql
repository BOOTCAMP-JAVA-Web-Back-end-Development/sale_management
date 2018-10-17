DROP DATABASE IF EXISTS crud;

CREATE DATABASE crud;
use crud;


SELECT * FROM customers;

SELECT customerNumber, contactLastName, contactFirstName, phone, city
FROM customers;

SELECT customerNumber, contactLastName, contactFirstName, phone, city
FROM customers
WHERE contactFirstName = 'Peter' AND city = 'Melbourne';

SELECT customerNumber, contactLastName, contactFirstName, phone, city
FROM customers
WHERE contactFirstName LIKE '%A%'

SELECT customernumber, contactlastname, contactfirstname, phone, city
FROM customers
WHERE customernumber between 103 and 125;

SELECT customernumber, contactlastname, contactfirstname, phone, city, country
FROM customers
WHERE country = 'USA' or country = 'France';

SELECT customernumber, contactlastname, contactfirstname, phone, city
FROM customers
ORDER BY contactfirstname asc;

SELECT customernumber, contactlastname, contactfirstname, phone, city
FROM customers
ORDER BY contactfirstname DESC
LIMIT 10;

SELECT COUNT(country) as 'Số khách hàng số ở France'
FROM customers
WHERE country = 'France';
INSERT INTO customers (customernumber, customername, contactfirstname, contactlastname, phone, addressline1, city, country)
values  (500, 'AgileLead', 'Lan', 'Trần', '0978822683', 'Hàm Nghi', 'Hà Nội', 'Việt Nam' );

SELECT customerNumber, contactLastName, contactFirstName, phone, city
FROM customers;

UPDATE customers
SET customername = 'Baane Mini Imports'
WHERE customernumber = 103;

DELETE FROM customers
WHERE city = 'Nantes';