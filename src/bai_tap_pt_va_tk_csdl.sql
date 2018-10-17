CREATE DATABASE sale_management;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS office;
DROP TABLE IF EXISTS order_bill;
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS productsline;
DROP TABLE IF EXISTS product_order;

CREATE TABLE Customers (
  customer_number       INT AUTO_INCREMENT NOT NULL ,
  customer_name         VARCHAR(250) NOT NULL ,
  customer_phone        INT NOT NULL ,
  customer_address      VARCHAR(250) NOT NULL ,
  customer_order        INT NOT NULL ,
  customer_payment_time INT NOT NULL ,
  PRIMARY KEY (customer_number)
);

CREATE TABLE ProductsLine (
  ProductsLine INT NOT NULL ,
  ProductsInfo VARCHAR(250) NOT NULL ,
  PRIMARY KEY (ProductsLine)
);

CREATE TABLE Payments (
  Payments_code   INT NOT NULL ,
  Payments_date   DATE NOT NULL ,
  Payments_amount INT NOT NULL ,
  PRIMARY KEY (Payments_code)
);

CREATE TABLE Employees (
  employee_number    INT NOT NULL ,
  employee_name      VARCHAR(250) NOT NULL ,
  employee_email     VARCHAR(250) NOT NULL ,
  task_name          VARCHAR(250) NOT NULL ,
  take_care_customer INT,
  PRIMARY KEY (employee_number)
);

CREATE TABLE office (
  office_code  INT NOT NULL ,
  address      VARCHAR(250) NOT NULL ,
  phone_number INT NOT NULL ,
  national     VARCHAR(50) NOT NULL ,
  PRIMARY KEY (office_code)
);

CREATE TABLE order_bill (
  order_number          INT AUTO_INCREMENT NOT NULL ,
  order_date            DATE NOT NULL ,
  request_delivery_date DATE NOT NULL ,
  real_delivery_date    DATE NOT NULL ,
  production_amount     INT NOT NULL ,
  unit_price            INT NOT NULL,
  PRIMARY KEY (order_number)
);

CREATE TABLE product (
  productcode  INT AUTO_INCREMENT NOT NULL,
  productname  VARCHAR(250) NOT NULL,
  supplier     VARCHAR(250) NOT NULL,
  export_price INT NOT NULL,
  amount       INT NOT NULL,
  import_price INT NOT NULL,
  producline   INT NOT NULL,
  PRIMARY KEY (productcode)
);

CREATE TABLE product_order (
  productcode  INT AUTO_INCREMENT ,
  order_number INT,
  FOREIGN KEY (productcode) REFERENCES order_bill (order_number),
  FOREIGN KEY (order_number) REFERENCES product (productcode)
);

ALTER TABLE customers
  ADD FOREIGN KEY (customer_number) REFERENCES order_bill (order_number),
  ADD FOREIGN KEY (customer_number) REFERENCES payments (Payments_code),
  ADD FOREIGN KEY (customer_number) REFERENCES employees (employee_number);

ALTER TABLE productsline
  ADD FOREIGN KEY (ProductsLine) REFERENCES product (productcode);

ALTER TABLE employees
  ADD FOREIGN KEY (employee_number) REFERENCES customers (customer_name),
  ADD FOREIGN KEY (employee_number) REFERENCES Employees (employee_number),
  ADD FOREIGN KEY (employee_number) REFERENCES office (office_code);

ALTER TABLE order_bill
  ADD FOREIGN KEY (order_number) REFERENCES customers (customer_number),
  ADD FOREIGN KEY (order_number) REFERENCES product (productcode);

ALTER TABLE payments
  ADD FOREIGN KEY (Payments_code) REFERENCES customers (customer_number);

ALTER TABLE product
  ADD FOREIGN KEY (producline) REFERENCES productsline (ProductsLine);

ALTER TABLE office
  ADD FOREIGN KEY (office_code) REFERENCES employees (employee_number);
