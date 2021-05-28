/*This script will create the database CARWASH  It will then create the tables
  and insert some test data
  Script created by Ashley Szpanelewski and Andrew Shock April 2021
*/

--use master
--go


--drop database carwash;
--go

--create database carwash
----use correct db
--use carwash;
--go

-- PERSON table: completed by Ashley 4/10/21
create table PERSON(
PersonID    int,
FirstName   char(15)    NOT NULL,
LastName    char(15),
Phone       char(11),
Address     char(30),
City        char(15),
State       char(2) default 'MI' NOT NULL,
Email       varchar(45),
PersonType  char(4) default 'NA' NOT NULL,
constraint person_id_pk Primary Key(PersonID),
constraint peopletype_person_ck check (PersonType in ('NA', 'CUST', 'EMP'))
);
GO
-- INSERT PERSON table: completed by Andrew 4/13/21
-- data edited by Ashley 4/27/21
INSERT INTO PERSON
(PersonID, FirstName, LastName, Phone, Address, City, Email, PersonType)
VALUES
--Employee
  (100, 'Andrew', 'Shock','5864564215', '123 Main St.', 'Chesterfield', 'ashock@macomb.edu', 'EMP' ),
  (101,'Michelle','Williams','5863831992', '24304 Old Kent Rd ','Warren', 'mwilliams@gmail.com', 'EMP'),
  (102,'Matt','Damon', '5863936615', '21544 Dequindre Rd','Warren', 'mdamon@gmail.com', 'EMP'),
  (103,'Brad','Pitt','5864276917', '4485 Marr Ave','Warren.', 'bpitt@yahoo.com', 'EMP'),
  (104,'Leonardo','DiCaprio', '3135275123','17275 Kingsbrooke Cir','Macomb', 'ldicaprio@att.net', 'EMP'),
  (105,'Kate','Winslet','5862260958','42004 Park Ln','Greyling', 'kwinslet@titanic.com','EMP'),
  (106,'Will','Smith', '5862262270','19945 Jolgren Dr','Marquette','wismith@retaillink.com','EMP'),
  (107,'Ryan','Gosling','5862264562','42129 Kyle Dr','Hell','rgosling@gmail.com','EMP'),
  (108,'Johnny','Depp','5863294321', '52084 Nottingham Ct','New Baltimore','jdepp@sparrow.net', 'EMP'),
  (109,'Tom','Hanks','5864215006','51510 Fairchild Rd','New Baltimore','thanks@yourewelcome.com', 'EMP'),
  (110,'Rachel','McAdams','5862950958','42004 Park Ln','Mackinac','rmcadams@macomb.edu', 'EMP'),
--Customer
  (500, 'Robert', 'Smith', '5867169250', '1965 Ritter Avenue', 'New Batlimore', 'robsmithfunguy@yahoo.com','CUST' ),
  (501,'Steven','Morrissey','5867252676', '3375 Ritter Avenue ','New Baltimore', 'singitman@therock.com','CUST'),
  (502,'Molly','Rankin','5863379304','7387 Dyke','Clay', 'mollymolly@att.com','CUST'),
  (503,'Kevin','Drew','5859669532','3565  Cherry Ridge Drive','Ann Arbor.', 'kevdrewstuff@hotmail.com','CUST'),
  (504,'Leslie','Feist','3139804041','351  D Street','Detroit', 'feistyleslie@gmail.com','CUST'),
  (505,'Jeffery','Mangum','2482264925','4813  Bobcat Drive','Southfield', 'coolguy27@hotmail.com','CUST'),
  (506,'Lou','Reed','2693258673','2773  Shingleton Road','Grand Rapids','loureedyahear@macomb.edu','CUST'),
  (507,'Adrianne','Lenker','2697818615','3894  Echo Lane','Marshall','alenker@centraltransport.com','CUST'),
  (508,'Carey','Lander','2699698248','4288  Broaddus Avenue','Battle Creek','applesandbats@gmail.com','CUST'),
  (509,'Stephin','Merritt','9898607614','2333  Juniper Drive','Saginaw','cashnow@gmail.com','CUST'),
  (510,'Phoebe','Bridgers','5864212657','3218  D Street','Mount Clemens','cheersphoebe@att.com','CUST');
GO


-- EMPLOYEE table: completed by Ashley 4/10/21
create table EMPLOYEE(
PersonID         int,
HireDate         date    NOT NULL,
TerminationDate  date,
SSN              char(9),
DOB              date,
constraint person_id_employee_pk Primary Key(PersonID),
constraint ssn_emp_uk unique(SSN),
constraint personid_employee_pk foreign key(PersonID) references PERSON(PersonID)
);
GO
 --INSERT EMPLOYEE table: completed by Andrew 4/13/21
 --Edited date format: completed by Ashley 4/27/21
INSERT INTO EMPLOYEE
(PersonID, HireDate, TerminationDate, SSN, DOB)
VALUES
(100,'10-13-2020',null,'377293671','10-15-1999'),
(101,'6-12-2013',null,'276103581','9-30-1958'),
(102,'5-28-2014',null,'223466402','6-23-1971'),
(103,'8-31-2015',null,'630186376','10-24-1967'),
(104,'9-19-2016',null,'295628491','5-5-1997'),
(105,'11-30-2016',null,'650183226','7-15-1972'),
(106,'3-2-2017',null,'035505704','1-14-1985'),
(107,'2-6-2018',null,'012443779','11-4-1964'),
(108,'2-27-2018',null,'145107123','10-30-1994'),
(109,'5-16-2019',null,'546060901','3-6-1958'),
(110,'11-1-2021',null,'528928282','10-15-1999');
GO

-- CUSTOMER table: completed by Ashley 4/10/21
create table CUSTOMER(
PersonID           int,
CustomerSince      date   default GetDate(),
constraint personid_cust_pk primary key(PersonID),

);
GO
-- INSERT CUSTOMER table: completed by Andrew 4/13/21
INSERT INTO CUSTOMER
(PersonID, CustomerSince)
VALUES
(500,'1/8/2013'),
(501,'2/18/2014'),
(502,'4/17/2014'),
(503,'3/27/2015'),
(504,'4/4/2016'),
(505,'11/21/2016'),
(506,'5/30/2018'),
(507,'4/17/2017'),
(508,'6/10/2016'),
(509,'3/21/2018'),
(510,'1/10/2017');
GO
 --ORDERS table: completed by Ashley 4/10/21
create table ORDERS(
OrderID      int,
OrderDate    date default GetDate(),
EmployeeID   int,
CustomerID   int,
PickedUpBy   char(15),
constraint orderid_pk primary key(OrderID),
constraint custid_fk foreign key(CustomerID) references PERSON(PersonID)
);
GO
-- INSERT CUSTOMER table: completed by Andrew 4/13/21
 INSERT INTO ORDERS
(OrderID, OrderDate,EmployeeID,CustomerID,PickedUpBy)
VALUES
  (1000, '2/8/2020', 108, 500, 'Robert'),
  (1001,'6/25/2020',109,501,'Steven'),
  (1002,'10/14/2020',107,502,'Molly'),
  (1003,'12/18/2020',106,503,'Kevin'),
  (1004,'1/8/2021',101,504,'Leslie'),
  (1005,'2/4/2021',102,505,'Jeffery'),
  (1006,'2/20/2021',104,506,'Lou'),
  (1007,'4/26/2021',105,507,'Adrianne'),
  (1008,'10/12/2021',103,508,'Carey'),
  (1009,'11/26/2021',110,509,'Stephin'),
  (1010,'1/13/2020',100,510,'Phoebe');
  GO

--SERVICES table: completed by Ashley 4/10/21
create table OrdServices(
ServiceID            int,
ServiceName          char(25),
ServiceDescription   char(255),
PricePerHour         money,
EstimatedHours       int,
constraint service_id_pk primary key(ServiceID)
);
GO
-- INSERT CUSTOMER table: completed by Andrew 4/15/21
INSERT INTO OrdServices
(ServiceID,ServiceName,ServiceDescription,PricePerHour,EstimatedHours)
VALUES
(10,'Exprss Intrior','Includes Car Wash, Interior Vacuuming, Dashboard Wiping,Cleaning Windows, and Tire Shine.',19,1),
(11,'Exprss Wax','Includes Hand Waxing and Car wash.',20,1),
(12,'ExprssComplete','Includes both Express Interior and Express Wax Packages with Tire Shine.',30,1),
(13,'DluxeInterior','Includes Thorough Cleaning of Vehicles with Compressed Air, Advanced Cleaners, and Detail Brushes.',20,2),
(14,'DluxeWax','Includes Ultimate Waxing with Orbital Polsher and Hand Finished.',20,2),
(15,'Bumper2Bumper','Includes both Deluxe Wax and Deluxe Interior Packages.',15,4);
GO



--SERVICES table: completed by Ashley 4/10/21
create table OrdServ(
OrderID     int,
ServiceID   int,
StartDate   date default GetDate(),
EndDate     date,
StartTime   time,
EndTime     time,
Cost        money,
EmployeeID  int,
PromiseDate date,
constraint ordserv_orderid_pk primary key(OrderID),
constraint ordserv_orderid_fk foreign key(OrderID) references ORDERS(OrderID),
constraint service_fk foreign key(ServiceID) references OrdServices(ServiceID),
);
GO
-- INSERT OrderServices table: completed by Andrew 4/15/21
INSERT INTO OrdServ
(OrderID, ServiceID,StartDate,EndDate,StartTime,EndTime,Cost,EmployeeID,PromiseDate)
VALUES
  (1000,'11', '2/8/2020', '2/8/2020', '13:24','14:25',20,108,'2/8/2020'),
  (1001,'12','6/25/2020','6/25/2020','12:14','13:15',30,109,'6/25/2020'),
  (1002,'11','10/14/2020','10/14/2020','12:00','13:01',20,107,'10/14/2020'),
  (1003,'15','12/18/2020','12/18/2020','14:52','18:52',60,106,'12/18/2020'),
  (1004,'14','1/8/2021','1/8/2021','17:07','19:08',40,101,'1/8/2021'),
  (1005,'10','2/4/2021','2/4/2021','16:33','17:34',19,102,'2/4/2021'),
  (1006,'13','2/20/2021','2/20/2021','12:48','14:29',40,104,'2/20/2021'),
  (1007,'14','4/26/2021','4/26/2021','09:39','11:39',40,105,'4/26/2021'),
  (1008,'10','10/12/2021','10/12/2021','17:33','18:34',19,103,'10/12/2021'),
  (1009,'11','11/26/2021','11/26/2021','18:00','19:00',20,110,'11/26/2021'),
  (1010,'13','1/13/2020','1/13/2020','14:37','16:37',40,100,'1/13/2020');
  GO


create table VENDRS(
VendorID      int,
Name          varchar(15),
constraint vendorid_pk primary key(VendorID)
);
GO
-- INSERT VENDORS table: completed by Andrew 4/15/21
INSERT INTO VENDRS
(VendorID, Name)
VALUES
(300,'Mr.Pink'),
(301,'Adams Polishes'),
(302,'Meguiars'),
(303,'Griots Garage'),
(304,'Turtle Wax'),
(305,'Rain-X'),
(306,'MCalifornia'),
(307,'Duragloss'),
(308,'Armor All'),
(309,'Shamwow!'),
(310,'Little Trees');
GO


--PRODUCTS table: completed by Ashley 4/10/21
create table PRDUCTS(
ProductID               int,
ProductName             char(75),
ProductDescription      varchar(255),
WholesaleCost           money,
RetailCost              money,
VendorID                int,
constraint productID_pk primary key(ProductID),
constraint vendorid_fk foreign key(VendorID) references VENDRS(VendorID)
);
GO
-- INSERT PRODUCTS table: completed by Andrew 4/15/21
INSERT INTO PRDUCTS
(ProductID,ProductName,ProductDescription,WholesaleCost,RetailCost,VendorID)
VALUES
(400,'Mr.Pink Super Suds','Removes dirt, grime and debirs through a constant stream of foaming bubbles. (1 Gallon)',40,44.99,300),
(401,'Adams Polishes Car Shampoo','A pH neutral wash soap that is safe on paint, rubber, vinyl and windows. (16 Ounces)',8,10.99,301),
(402,'Meguiars Gold Class Car Wash','Soap that contains an ultra-rich conditioner to make your car paint look the best.(1 Gallon)',15,20.99,302),
(403,'Griots Garage Brillant Finish Car Wash','Soap designed to cut grease while perserving life of waxes and sealents. (64 Ounces)',5,15.99,303),
(404,'Turtle Wax Hyrbrid Solutions Ceramic Wash and Wax','Scratch-free cleaning solution that leaves a great shine a protection for your vehicle. (48 Ounces)',13,20.99,304),
(405,'Rain-X Wash and Wax','Specialty cleaning solution that washes and waxes your vehicle of dirt and grime. (64 ounces)',10,15.99,305),
(406,'Mothers California Gold Car Wash','Car wash with a balance of powerful cleaning and exacting care. (64 ounces)',10,16.99,306),
(407,'Duragloss Car Wash Concentrate 902','Car wash with a blend of mild surfactants and cleaners that enchance shine of the vehicle with each use. (1 Gallon)',25,29.99,307),
(408,'Armor All Car Wash', 'Delicate cleaning solution that perserves the vehicle wax while removing dirt and grime. (64 Ounces)',10,14.99,308),
(409,'Shamwow! Cloth','Anti-bacterial cloth. (1-pack)',19.95,20,309),
(410,'Little Trees Car Freshener Black Ice','Car freshener that hangs on your car mirror. (1-pack)',2,4.95,310);
GO

--INVENTORY table: completed by Ashley 4/10/21
create table INVNTORY(
ProductID   int,
OnHand      int,
OrderAmount int,
constraint product_pk primary key(ProductID)
);
GO
-- INSERT INVENTORY table: completed by Andrew 4/15/21
INSERT INTO INVNTORY
(ProductID,OnHand,OrderAmount)
VALUES
(400,100,0),
(401,50,0),
(402,0,30),
(403,10,0),
(404,0,18),
(405,15,0),
(406,0,12),
(407,23,0),
(408,42,0),
(409,800,0),
(410,1091,0);
GO









