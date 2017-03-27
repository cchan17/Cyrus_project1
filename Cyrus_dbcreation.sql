
/*
** Cyrus Chan's Database Project
*/

USE master
GO

if exists (select * from sysdatabases where name='Miniamazon')
		DROP DATABASE Miniamazon
GO

CREATE DATABASE Miniamazon
GO

USE Miniamazon
GO

CREATE TABLE "Employees" (
	"EmployeeID" "int" IDENTITY (1, 1) NOT NULL ,
	"FirstName" nvarchar (20) NOT NULL ,
	"LastName" nvarchar (20) NOT NULL ,
	"Title" nvarchar (30) NULL ,
	"HireDate" "datetime" NULL ,
	"BirthDate" "datetime" NULL ,
	"LoginID" nvarchar (15) NULL ,
	"Email" nvarchar (50) NULL ,
	"Phone" nvarchar (24) NULL ,
	"Gender" nvarchar (15) NULL ,
	"Address" nvarchar (60) NULL ,
	"City" nvarchar (15) NULL ,
	"Region" nvarchar (15) NULL ,
	"Zip" nvarchar (10) NULL ,
	"Country" nvarchar (15) NULL ,
	CONSTRAINT "PK_Employees" PRIMARY KEY  CLUSTERED 
	("EmployeeID"))
GO

CREATE TABLE "Categories" (
	"CategoryID" "int" IDENTITY (1, 1) NOT NULL ,
	"CategoryName" nvarchar (15) NOT NULL ,
	"Description" "ntext" NULL
	CONSTRAINT "PK_Categories" PRIMARY KEY  CLUSTERED 
	("CategoryID"))
GO

CREATE TABLE "Customers" (
	"CustomerID" nchar (5) NOT NULL ,
	"CustomerName" nvarchar (30) NULL ,
	"Address" nvarchar (60) NULL ,
	"City" nvarchar (15) NULL ,
	"Region" nvarchar (15) NULL ,
	"Zip" nvarchar (10) NULL ,
	"Country" nvarchar (15) NULL ,
	"Phone" nvarchar (24) NULL ,
	CONSTRAINT "PK_Customers" PRIMARY KEY  CLUSTERED 
	("CustomerID"))
GO

CREATE TABLE "Shippers" (
	"ShipperID" "int" IDENTITY (1, 1) NOT NULL ,
	"ShipperName" nvarchar (40) NOT NULL ,
	"Address" nvarchar (60) NULL ,
	"City" nvarchar (15) NULL ,
	"Region" nvarchar (15) NULL ,
	"Country" nvarchar (15) NULL ,
	"Phone" nvarchar (24) NULL ,
	CONSTRAINT "PK_Shippers" PRIMARY KEY  CLUSTERED 
	("ShipperID"))
GO

CREATE TABLE "Suppliers" (
	"SupplierID" "int" IDENTITY (1, 1) NOT NULL ,
	"SupplierName" nvarchar (40) NOT NULL ,
	"Address" nvarchar (60) NULL ,
	"City" nvarchar (15) NULL ,
	"Region" nvarchar (15) NULL ,
	"Country" nvarchar (15) NULL ,
	"Phone" nvarchar (24) NULL ,
	CONSTRAINT "PK_Suppliers" PRIMARY KEY  CLUSTERED 
	("SupplierID"))
GO

CREATE TABLE "Orders" (
	"OrderID" "int" IDENTITY (1, 1) NOT NULL ,
	"CustomerID" nchar (5) NULL ,
	"EmployeeID" "int" NULL ,
	"OrderDate" "datetime" NULL ,
	"ShippedDate" "datetime" NULL ,
	"ShipperID" "int" NULL ,
	"Address" nvarchar (60) NULL ,
	"City" nvarchar (15) NULL ,
	"Region" nvarchar (15) NULL ,
	"Zip" nvarchar (24) NULL ,
	"Country" nvarchar (15) NULL ,
	CONSTRAINT "PK_Orders" PRIMARY KEY  CLUSTERED 
	("OrderID"),
	CONSTRAINT "FK_Orders_Customers" FOREIGN KEY 
	("CustomerID") REFERENCES "dbo"."Customers" ("CustomerID"),
	CONSTRAINT "FK_Orders_Employees" FOREIGN KEY 
	("EmployeeID") REFERENCES "dbo"."Employees" ("EmployeeID"),
	CONSTRAINT "FK_Orders_Shippers" FOREIGN KEY 
	("ShipperID") REFERENCES "dbo"."Shippers" ("ShipperID"))
GO

CREATE TABLE "Products" (
	"ProductID" "int" IDENTITY (1, 1) NOT NULL ,
	"ProductName" nvarchar (40) NOT NULL ,
	"CategoryID" "int" NULL ,
	"SupplierID" "int" NULL ,
	"UnitPrice" "money" NULL ,
	"OrderQty" nvarchar (20) NULL ,
	CONSTRAINT "PK_Products" PRIMARY KEY  CLUSTERED 
	("ProductID"),
	CONSTRAINT "FK_Products_Categories" FOREIGN KEY 
	("CategoryID") REFERENCES "dbo"."Categories" ("CategoryID"),
	CONSTRAINT "FK_Products_Suppliers" FOREIGN KEY 
	("SupplierID") REFERENCES "dbo"."Suppliers" ("SupplierID"))
GO

CREATE TABLE "Order Details" (
	"OrderID" "int" NOT NULL ,
	"ProductID" "int" NOT NULL ,
	"UnitPrice" "money" NOT NULL ,
	"Quantity" "smallint" NOT NULL ,
	CONSTRAINT "PK_Order_Details" PRIMARY KEY  CLUSTERED 
	("OrderID"),
	CONSTRAINT "FK_Order_Details_Products" FOREIGN KEY 
	("ProductID") REFERENCES "dbo"."Products" ("ProductID"))
GO

set identity_insert "Categories" on
go
INSERT "Categories"("CategoryID","CategoryName","Description") VALUES(1,'Beverages','Soft drinks, coffees, teas, beers, and ales')
INSERT "Categories"("CategoryID","CategoryName","Description") VALUES(2,'Condiments','Sweet and savory sauces, relishes, spreads, and seasonings')
INSERT "Categories"("CategoryID","CategoryName","Description") VALUES(3,'Confections','Desserts, candies, and sweet breads')
INSERT "Categories"("CategoryID","CategoryName","Description") VALUES(4,'Dairy Products','Cheeses')
INSERT "Categories"("CategoryID","CategoryName","Description") VALUES(5,'Grains','Breads, crackers, pasta, and cereal')
INSERT "Categories"("CategoryID","CategoryName","Description") VALUES(6,'Meat','Prepared meats')
INSERT "Categories"("CategoryID","CategoryName","Description") VALUES(7,'Produce','Dried fruit and bean curd')
INSERT "Categories"("CategoryID","CategoryName","Description") VALUES(8,'Seafood','Seaweed and fish')
go
set identity_insert "Categories" off
go

INSERT "Customers" VALUES(1,'Jerry Tucker', '63 Fieldstone Trail', 'Jiangwang', null, 'China', '86-(860)972-7758')
INSERT "Customers" VALUES(2,'Helen Stewart', '1 Mendota Way', 'Łętownia', '37-312', 'Poland', '48-(490)727-7527')
INSERT "Customers" VALUES(3,'Rachel Henderson', '84 Clemons Park', 'Solina', null, 'Bosnia and Herzegovina', '387-(762)483-4055')
INSERT "Customers" VALUES(4,'Theresa Gibson', '5 Village Terrace', 'Crato', '63100-000', 'Brazil', '55-(747)794-4782')
INSERT "Customers" VALUES(5,'Margaret Fox', '13098 Manitowish Junction', 'Benito Juarez', '29120', 'Mexico', '52-(741)713-1200')
INSERT "Customers" VALUES(6,'Alice Stevens', '40 Forest Center', 'Ban Talat Nua', '83120', 'Thailand', '66-(597)880-9386')
INSERT "Customers" VALUES(7,'Kathleen Reid', '3147 Walton Alley', 'Toumodi', null, 'Ivory Coast', '225-(942)206-7121')
INSERT "Customers" VALUES(8,'Russell Kelley', '06 Northwestern Parkway', 'Yuncao', null, 'China', '86-(226)639-3188')
INSERT "Customers" VALUES(9,'Antonio Hernandez', '59 Stone Corner Point', 'Zemio', null, 'Central African Republic', '236-(893)264-5338')
INSERT "Customers" VALUES(10,'Theresa Hudson', '66 Lien Point', 'Zbarazh', null, 'Ukraine', '380-(892)769-4552')
go
INSERT "Customers" VALUES(11,'Charles Fields', '7 Straubel Center', 'Irirum', '5102', 'Philippines', '63-(400)492-5362')
INSERT "Customers" VALUES(12,'Ann Schmidt', '81878 Melvin Trail', 'Kyankwanzi', null, 'Uganda', '256-(340)354-6030')
INSERT "Customers" VALUES(13,'Todd Ray', '3 Burrows Parkway', 'Janes', '2755-123', 'Portugal', '351-(987)141-4799')
INSERT "Customers" VALUES(14,'Phillip Gray', '407 Manley Trail', 'Yanglinqiao', null, 'China', '86-(156)291-1036')
INSERT "Customers" VALUES(15,'Anthony Jordan', '076 Bobwhite Hill', 'Liuheng', null, 'China', '86-(817)583-3509')
INSERT "Customers" VALUES(16,'Catherine Matthews', '1 Autumn Leaf Avenue', 'Shitouhe', null, 'China', '86-(268)462-6070')
INSERT "Customers" VALUES(17,'Bonnie Webb', '1384 Debra Place', 'Barcelona', '4712', 'Philippines', '63-(920)599-2541')
INSERT "Customers" VALUES(18,'Angela Cooper', '298 Dakota Junction', 'Svetlanovskiy', '399612', 'Russia', '7-(892)471-4025')
INSERT "Customers" VALUES(19,'Julie Lane', '06361 Waxwing Junction', 'Mañazo', null, 'Peru', '51-(312)142-9584')
INSERT "Customers" VALUES(20,'Shawn Olson', '3 Carioca Court', 'Pointe-à-Pitre', '97171 CEDEX', 'Guadeloupe', '590-(522)208-6145')
go
INSERT "Customers" VALUES(21,'Mark Robertson', '31 Warrior Court', 'Bantarpanjang', null, 'Indonesia', '62-(972)771-0121')
INSERT "Customers" VALUES(22,'Adam Wright', '66 Jenna Center', 'Forquilhinha', '88850-000', 'Brazil', '55-(167)389-2875')
INSERT "Customers" VALUES(23,'Louis George', '6 1st Trail', 'Warungtanjung', null, 'Indonesia', '62-(626)619-7319')
INSERT "Customers" VALUES(24,'Kathleen Tucker', '37147 Atwood Hill', 'Chiguayante', null, 'Chile', '56-(227)893-8149')
INSERT "Customers" VALUES(25,'Willie Burton', '81 Pleasure Place', 'Badajoz', '06010', 'Spain', '34-(304)123-3093')
INSERT "Customers" VALUES(26,'Kimberly Greene', '5 Bultman Pass', 'Polyarnyye Zori', '184230', 'Russia', '7-(552)154-2104')
INSERT "Customers" VALUES(27,'Barbara Lynch', '8 Sauthoff Court', 'Guaiúba', '61890-000', 'Brazil', '55-(263)245-6885')
INSERT "Customers" VALUES(28,'Virginia Price', '030 American Lane', 'Norrköping', '602 14', 'Sweden', '46-(879)123-6873')
INSERT "Customers" VALUES(29,'Paul Henderson', '5 Spohn Pass', 'Billère', '64145 CEDEX', 'France', '33-(330)392-0881')
INSERT "Customers" VALUES(30,'Joe Stewart', '09 Delladonna Place', 'Sam Chuk', '72130', 'Thailand', '66-(549)723-2892')
go

set identity_insert "Employees" on
go
INSERT "Employees" ("EmployeeID","FirstName","LastName","Title","BirthDate","HireDate","LoginID","Email","Gender","Address","City","Region","Zip","Country","Phone") VALUES(2,'Fuller','Andrew','Vice President, Sales','02/19/1952','08/14/1992','00001','Fandrew@ams.com','Male','908 W. Capital Way','Tacoma','WA','98401','USA','(206) 555-9482')
GO
INSERT "Employees"("EmployeeID","FirstName","LastName","Title","BirthDate","HireDate","LoginID","Email","Gender","Address","City","Region","Zip","Country","Phone") VALUES(3,'Leverling','Janet','Sales Representative','08/30/1963','04/01/1992','00002','Ljanet@ams.com','Female','722 Moss Bay Blvd.','Kirkland','WA','98033','USA','(206) 555-3412')
GO
INSERT "Employees"("EmployeeID","FirstName","LastName","Title","BirthDate","HireDate","LoginID","Email","Gender","Address","City","Region","Zip","Country","Phone") VALUES(4,'Peacock','Margaret','Sales Representative','09/19/1937','05/03/1993','00003','Pmargaret@ams.com','Female','4110 Old Redmond Rd.','Redmond','WA','98052','USA','(206) 555-8122')
GO
INSERT "Employees"("EmployeeID","FirstName","LastName","Title","BirthDate","HireDate","LoginID","Email","Gender","Address","City","Region","Zip","Country","Phone") VALUES(5,'Buchanan','Steven','Sales Manager','03/04/1955','10/17/1993','00004','Bsteven@ams.com','Male','14 Garrett Hill','London',NULL,'SW1 8JR','UK','(71) 555-4848')
GO
INSERT "Employees"("EmployeeID","FirstName","LastName","Title","BirthDate","HireDate","LoginID","Email","Gender","Address","City","Region","Zip","Country","Phone") VALUES(6,'Suyama','Michael','Sales Representative','07/02/1963','10/17/1993','00005','Smichael@ams.com','Male','Coventry HouseMiner Rd.','London',NULL,'EC2 7JR','UK','(71) 555-7773')
GO
INSERT "Employees"("EmployeeID","FirstName","LastName","Title","BirthDate","HireDate","LoginID","Email","Gender","Address","City","Region","Zip","Country","Phone") VALUES(7,'King','Robert','Sales Representative','05/29/1960','01/02/1994','00006','Krobert@ams.com','Male','Edgeham Hollow Winchester Way','London',NULL,'RG1 9SP','UK','(71) 555-5598')
GO
INSERT "Employees"("EmployeeID","FirstName","LastName","Title","BirthDate","HireDate","LoginID","Email","Gender","Address","City","Region","Zip","Country","Phone") VALUES(8,'Callahan','Laura','Inside Sales Coordinator','01/09/1958','03/05/1994','00007','Claura@ams.com','Female','4726 - 11th Ave. N.E.','Seattle','WA','98105','USA','(206) 555-1189')
GO
INSERT "Employees"("EmployeeID","FirstName","LastName","Title","BirthDate","HireDate","LoginID","Email","Gender","Address","City","Region","Zip","Country","Phone") VALUES(9,'Dodsworth','Anne','Sales Representative','01/27/1966','11/15/1994','00008','Danne@ams.com','Female','7 Houndstooth Rd.','London',NULL,'WG2 7LT','UK','(71) 555-4444')
go
set identity_insert "Employees" off
go

set identity_insert "Shippers" on
go
INSERT "Shippers"("ShipperID","ShipperName","Phone") VALUES(1,'Speedy Express','(503) 555-9831')
INSERT "Shippers"("ShipperID","ShipperName","Phone") VALUES(2,'United Package','(503) 555-3199')
INSERT "Shippers"("ShipperID","ShipperName","Phone") VALUES(3,'Federal Shipping','(503) 555-9931')
go
set identity_insert "Shippers" off
go

set identity_insert "Suppliers" on
go
INSERT "Suppliers"("SupplierID","SupplierName","Address","City","Region","Zip","Country","Phone") VALUES(1,'Exotic Liquids','49 Gilbert St.','London',NULL,'EC1 4SD','UK','(171) 555-2222')
INSERT "Suppliers"("SupplierID","SupplierName","Address","City","Region","Zip","Country","Phone") VALUES(2,'New Orleans Cajun Delights','P.O. Box 78934','New Orleans','LA','70117','USA','(100) 555-4822')
INSERT "Suppliers"("SupplierID","SupplierName","Address","City","Region","Zip","Country","Phone") VALUES(3,'Grandma Kelly''s Homestead','707 Oxford Rd.','Ann Arbor','MI','48104','USA','(313) 555-5735')
INSERT "Suppliers"("SupplierID","SupplierName","Address","City","Region","Zip","Country","Phone") VALUES(4,'Tokyo Traders','9-8 Sekimai Musashino-shi','Tokyo',NULL,'100','Japan','(03) 3555-5011')
INSERT "Suppliers"("SupplierID","SupplierName","Address","City","Region","Zip","Country","Phone") VALUES(5,'Cooperativa de Quesos ''Las Cabras''','Calle del Rosal 4','Oviedo','Asturias','33007','Spain','(98) 598 76 54')
INSERT "Suppliers"("SupplierID","SupplierName","Address","City","Region","Zip","Country","Phone") VALUES(6,'Mayumi''s','92 Setsuko Chuo-ku','Osaka',NULL,'545','Japan','(06) 431-7877')
INSERT "Suppliers"("SupplierID","SupplierName","Address","City","Region","Zip","Country","Phone") VALUES(7,'Pavlova, Ltd.','74 Rose St. Moonie Ponds','Melbourne','Victoria','3058','Australia','(03) 444-2343')
INSERT "Suppliers"("SupplierID","SupplierName","Address","City","Region","Zip","Country","Phone") VALUES(8,'Specialty Biscuits, Ltd.','29 King''s Way','Manchester',NULL,'M14 GSD','UK','(161) 555-4448')
INSERT "Suppliers"("SupplierID","SupplierName","Address","City","Region","Zip","Country","Phone") VALUES(9,'PB Knäckebröd AB','Kaloadagatan 13','Göteborg',NULL,'S-345 67','Sweden','031-987 65 43')
INSERT "Suppliers"("SupplierID","SupplierName","Address","City","Region","Zip","Country","Phone") VALUES(10,'Refrescos Americanas LTDA','Av. das Americanas 12.890','Sao Paulo',NULL,'5442','Brazil','(11) 555 4640')
go

set identity_insert "Suppliers" off
go

set identity_insert "Products" on
go
INSERT "Products"("ProductID","ProductName","SupplierID","CategoryID","UnitPrice","OrderQty") VALUES(1,'Chai',1,1,18,39)
INSERT "Products"("ProductID","ProductName","SupplierID","CategoryID","UnitPrice","OrderQty") VALUES(2,'Chang',1,1,19,17)
INSERT "Products"("ProductID","ProductName","SupplierID","CategoryID","UnitPrice","OrderQty") VALUES(3,'Aniseed Syrup',1,2,10,13)
INSERT "Products"("ProductID","ProductName","SupplierID","CategoryID","UnitPrice","OrderQty") VALUES(4,'Chef Anton''s Cajun Seasoning',2,2,22,53)
INSERT "Products"("ProductID","ProductName","SupplierID","CategoryID","UnitPrice","OrderQty") VALUES(5,'Chef Anton''s Gumbo Mix',2,2,21,35)
INSERT "Products"("ProductID","ProductName","SupplierID","CategoryID","UnitPrice","OrderQty") VALUES(6,'Grandma''s Boysenberry Spread',3,2,25,120)
INSERT "Products"("ProductID","ProductName","SupplierID","CategoryID","UnitPrice","OrderQty") VALUES(7,'Uncle Bob''s Organic Dried Pears',3,7,30,15)
INSERT "Products"("ProductID","ProductName","SupplierID","CategoryID","UnitPrice","OrderQty") VALUES(8,'Northwoods Cranberry Sauce',3,2,40,6)
INSERT "Products"("ProductID","ProductName","SupplierID","CategoryID","UnitPrice","OrderQty") VALUES(9,'Mishi Kobe Niku',4,6,97,29)
INSERT "Products"("ProductID","ProductName","SupplierID","CategoryID","UnitPrice","OrderQty") VALUES(10,'Ikura',4,8,31,31)
go
INSERT "Products"("ProductID","ProductName","SupplierID","CategoryID","UnitPrice","OrderQty") VALUES(11,'Queso Cabrales',5,4,21,22)
INSERT "Products"("ProductID","ProductName","SupplierID","CategoryID","UnitPrice","OrderQty") VALUES(12,'Queso Manchego La Pastora',5,4,38,86)
INSERT "Products"("ProductID","ProductName","SupplierID","CategoryID","UnitPrice","OrderQty") VALUES(13,'Konbu',6,8,6,24)
INSERT "Products"("ProductID","ProductName","SupplierID","CategoryID","UnitPrice","OrderQty") VALUES(14,'Tofu',6,7,25,35)
INSERT "Products"("ProductID","ProductName","SupplierID","CategoryID","UnitPrice","OrderQty") VALUES(15,'Genen Shouyu',6,2,15,39)
INSERT "Products"("ProductID","ProductName","SupplierID","CategoryID","UnitPrice","OrderQty") VALUES(16,'Pavlova',7,3,17,29)
INSERT "Products"("ProductID","ProductName","SupplierID","CategoryID","UnitPrice","OrderQty") VALUES(17,'Alice Mutton',7,6,39,6)
INSERT "Products"("ProductID","ProductName","SupplierID","CategoryID","UnitPrice","OrderQty") VALUES(18,'Carnarvon Tigers',7,8,62,42)
INSERT "Products"("ProductID","ProductName","SupplierID","CategoryID","UnitPrice","OrderQty") VALUES(19,'Teatime Chocolate Biscuits',8,3,9,25)
INSERT "Products"("ProductID","ProductName","SupplierID","CategoryID","UnitPrice","OrderQty") VALUES(20,'Sir Rodney''s Marmalade',8,3,81,40)
go
INSERT "Products"("ProductID","ProductName","SupplierID","CategoryID","UnitPrice","OrderQty") VALUES(21,'Sir Rodney''s Scones',8,3,10,3)
INSERT "Products"("ProductID","ProductName","SupplierID","CategoryID","UnitPrice","OrderQty") VALUES(22,'Gustaf''s Knäckebröd',9,5,21,104)
INSERT "Products"("ProductID","ProductName","SupplierID","CategoryID","UnitPrice","OrderQty") VALUES(23,'Tunnbröd',9,5,9,61)
INSERT "Products"("ProductID","ProductName","SupplierID","CategoryID","UnitPrice","OrderQty") VALUES(24,'Guaraná Fantástica',10,1,5,20)
INSERT "Products"("ProductID","ProductName","SupplierID","CategoryID","UnitPrice","OrderQty") VALUES(25,'NuNuCa Nuß-Nougat-Creme',11,3,14,76)
INSERT "Products"("ProductID","ProductName","SupplierID","CategoryID","UnitPrice","OrderQty") VALUES(26,'Gumbär Gummibärchen',11,3,31,15)
INSERT "Products"("ProductID","ProductName","SupplierID","CategoryID","UnitPrice","OrderQty") VALUES(27,'Schoggi Schokolade',11,3,43,49)
INSERT "Products"("ProductID","ProductName","SupplierID","CategoryID","UnitPrice","OrderQty") VALUES(28,'Rössle Sauerkraut',12,7,45,26)
INSERT "Products"("ProductID","ProductName","SupplierID","CategoryID","UnitPrice","OrderQty") VALUES(29,'Thüringer Rostbratwurst',12,6,123,79)
INSERT "Products"("ProductID","ProductName","SupplierID","CategoryID","UnitPrice","OrderQty") VALUES(30,'Nord-Ost Matjeshering',13,8,25,10)
go

set identity_insert "Products" off
go

set identity_insert "Orders" on
go
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","ShippedDate","ShipperID","Address","City","Region","Zip","Country")
VALUES (10248,1,5,'7/4/1996','7/16/1996',3,'59 rue de l''Abbaye','Reims',NULL,'51100','France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","ShippedDate","ShipVia","Address","City","Region","Zip","Country")
VALUES (10249,2,6,'7/5/1996','7/10/1996',1,'Luisenstr. 48','Münster',NULL,'44087','Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","ShippedDate","ShipVia","Address","City","Region","Zip","Country")
VALUES (10250,3,4,'7/8/1996','7/12/1996',2,'Rua do Paço, 67','Rio de Janeiro','RJ','05454-876','Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","ShippedDate","ShipVia","Address","City","Region","Zip","Country")
VALUES (10251,4,3,'7/8/1996','7/15/1996',1,'2, rue du Commerce','Lyon',NULL,'69004','France')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","ShippedDate","ShipVia","Address","City","Region","Zip","Country")
VALUES (10252,5,4,'7/9/1996','7/11/1996',2,'Boulevard Tirou, 255','Charleroi',NULL,'B-6000','Belgium')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","ShippedDate","ShipVia","Address","City","Region","Zip","Country")
VALUES (10253,6,3,'7/10/1996','7/16/1996',2,'Rua do Paço, 67','Rio de Janeiro','RJ','05454-876','Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","ShippedDate","ShipVia","Address","City","Region","Zip","Country")
VALUES (10254,7,5,'7/11/1996','7/23/1996',2,'Hauptstr. 31','Bern',NULL,'3012','Switzerland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","ShippedDate","ShipVia","Address","City","Region","Zip","Country")
VALUES (10255,8,9,'7/12/1996','7/15/1996',3,'Starenweg 5','Genève',NULL,'1204','Switzerland')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","ShippedDate","ShipVia","Address","City","Region","Zip","Country")
VALUES (10256,9,3,'7/15/1996','7/17/1996',2,'Rua do Mercado, 12','Resende','SP','08737-363','Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","ShippedDate","ShipVia","Address","City","Region","Zip","Country")
VALUES (10257,10,4,'7/16/1996','7/22/1996',3,'Carrera 22 con Ave. Carlos Soublette #8-35','San Cristóbal','Táchira','5022','Venezuela')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","ShippedDate","ShipVia","Address","City","Region","Zip","Country")
VALUES (10259,11,4,'7/18/1996','7/25/1996',3,'Sierras de Granada 9993','México D.F.',NULL,'05022','Mexico')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","ShippedDate","ShipVia","Address","City","Region","Zip","Country")
VALUES (10260,12,4,'7/19/1996','7/29/1996',1,'Mehrheimerstr. 369','Köln',NULL,'50739','Germany')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","ShippedDate","ShipVia","Address","City","Region","Zip","Country")
VALUES (10261,13,4,'7/19/1996','7/30/1996',2,'Rua da Panificadora, 12','Rio de Janeiro','RJ','02389-673','Brazil')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","ShippedDate","ShipVia","Address","City","Region","Zip","Country")
VALUES (10262,14,8,'7/22/1996','7/25/1996',3,'2817 Milton Dr.','Albuquerque','NM','87110','USA')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","ShippedDate","ShipVia","Address","City","Region","Zip","Country")
VALUES (10263,15,9,'7/23/1996','7/31/1996',3,'Kirchgasse 6','Graz',NULL,'8010','Austria')
INSERT INTO "Orders"
("OrderID","CustomerID","EmployeeID","OrderDate","ShippedDate","ShipVia","Address","City","Region","Zip","Country")
VALUES (10264,16,6,'7/24/1996','8/23/1996',3,'Åkergatan 24','Bräcke',NULL,'S-844 67','Sweden')
set identity_insert "Orders" off
go

INSERT "Order Details" VALUES(10248,11,14,12)
INSERT "Order Details" VALUES(10248,42,9,10)
INSERT "Order Details" VALUES(10248,72,34,5)
INSERT "Order Details" VALUES(10249,14,18,9)
INSERT "Order Details" VALUES(10250,41,7,10)
INSERT "Order Details" VALUES(10250,65,16,15)
INSERT "Order Details" VALUES(10251,22,16,6)
go
INSERT "Order Details" VALUES(10251,65,16,20)
INSERT "Order Details" VALUES(10252,20,64,40)
INSERT "Order Details" VALUES(10252,33,2,25)
INSERT "Order Details" VALUES(10253,31,10,20)
INSERT "Order Details" VALUES(10253,39,14,42)
INSERT "Order Details" VALUES(10254,24,3,15)
INSERT "Order Details" VALUES(10254,74,8,21)
go
INSERT "Order Details" VALUES(10255,2,15,20)
INSERT "Order Details" VALUES(10255,16,13,35)
INSERT "Order Details" VALUES(10255,36,15,25)
INSERT "Order Details" VALUES(10256,77,10,12)
INSERT "Order Details" VALUES(10257,27,35,25)
INSERT "Order Details" VALUES(10257,39,14,6)
INSERT "Order Details" VALUES(10257,77,10,15)
go