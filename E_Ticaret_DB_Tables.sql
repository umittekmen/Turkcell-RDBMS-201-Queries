CREATE DATABASE SALES
USE SALES

CREATE TABLE USERS(
ID INT IDENTITY(1,1) PRIMARY KEY,
USERNAME_ VARCHAR(50),
PASSWORD_ VARCHAR(50),
NAMESURNAME VARCHAR(100),
EMAIL VARCHAR(100),
GENDER VARCHAR(1),
BIRTHDATE DATE,
CREATEDDATE DATETIME,
TELNR1 VARCHAR(15),
TELNR2 VARCHAR(15));

CREATE TABLE ITEMS(
ID INT IDENTITY(1,1) PRIMARY KEY,
ITEMCODE VARCHAR(50),
ITEMNAME VARCHAR(100),
UNITPRICE FLOAT,
CATEGORY1 VARCHAR(50),
CATEGORY2 VARCHAR(50),
CATEGORY3 VARCHAR(50),
BRAND VARCHAR(50)
);
CREATE TABLE COUNTRIES(
ID TINYINT IDENTITY(1,1) PRIMARY KEY,
COUNTRY VARCHAR(50));

CREATE TABLE CITIES(
ID SMALLINT IDENTITY(1,1) PRIMARY KEY,
COUNTRYID TINYINT,
CITY VARCHAR(50),
REGION VARCHAR(50)
FOREIGN KEY (COUNTRYID) REFERENCES COUNTRIES(ID)
);

CREATE TABLE TOWNS(
ID INT IDENTITY(1,1) PRIMARY KEY,
CITYID SMALLINT,
TOWN VARCHAR(50)
FOREIGN KEY (CITYID) REFERENCES CITIES(ID)
);

CREATE TABLE DISTRICTS(
ID INT IDENTITY(1,1) PRIMARY KEY,
TOWNID INT,
DISTRICT VARCHAR(50)
FOREIGN KEY (TOWNID) REFERENCES TOWNS(ID)
);

CREATE TABLE ADDRESS(
ID INT IDENTITY(1,1) PRIMARY KEY,
USERID INT,
COUNTRYID TINYINT,
CITYID SMALLINT,
TOWNID INT,
DISTRICTID INT,
POSTALCODE VARCHAR(10),
ADDRESSTEXT VARCHAR(500),
FOREIGN KEY (USERID) REFERENCES USERS(ID),
FOREIGN KEY (COUNTRYID) REFERENCES COUNTRIES(ID),
FOREIGN KEY  (CITYID) REFERENCES CITIES(ID),
FOREIGN KEY (TOWNID) REFERENCES TOWNS(ID),
FOREIGN KEY (DISTRICTID) REFERENCES DISTRICTS(ID)
)
CREATE TABLE ORDERS(
ID INT IDENTITY(1,1) PRIMARY KEY,
USERID INT,
DATE_ DATETIME,
TOTALPRICE FLOAT,
STATUS_ TINYINT,
ADDRESSID INT
FOREIGN KEY (USERID) REFERENCES USERS(ID),
FOREIGN KEY (ADDRESSID) REFERENCES ADDRESS(ID)
)
CREATE TABLE ORDERDETAILS(
ID INT IDENTITY(1,1) PRIMARY KEY,
ORDERID INT,
ITEMID INT,
AMOUNT INT,
UNITPRICE FLOAT,
LINETOTAL FLOAT,
FOREIGN KEY (ORDERID) REFERENCES ORDERS(ID),
FOREIGN KEY (ITEMID) REFERENCES ITEMS(ID)
)
CREATE TABLE PAYMENTS(
ID INT IDENTITY(1,1) PRIMARY KEY,
ORDERID INT,
PAYMENTTYPE TINYINT,
DATE_ DATETIME,
ISOK BIT,
APPROVECODE VARCHAR(100),
PAYMENTTOTAL FLOAT,
FOREIGN KEY (ORDERID) REFERENCES ORDERS(ID)
)
CREATE TABLE INVOICES(
ID INT IDENTITY(1,1) PRIMARY KEY,
ORDERID INT,
DATE_ DATETIME,
ADDRESSID INT,
CARGOFICHENO VARCHAR(20),
TOTALPRICE FLOAT,
FOREIGN KEY (ORDERID) REFERENCES ORDERS(ID),
FOREIGN KEY (ADDRESSID) REFERENCES ADDRESS(ID), 
)
CREATE TABLE INVOICEDETAILS(
ID INT IDENTITY(1,1) PRIMARY KEY,
INVOICEID INT,
ORDERDETAILID INT,
ITEMID INT,
AMOUNT INT,
UNITPRICE FLOAT,
LINETOTAL FLOAT,
FOREIGN KEY (ORDERDETAILID) REFERENCES ORDERDETAILS(ID),
FOREIGN KEY  (ITEMID) REFERENCES ITEMS(ID)
)
SELECT*FROM USERS