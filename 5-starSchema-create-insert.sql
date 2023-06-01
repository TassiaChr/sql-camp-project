CREATE TABLE CUSTOMERS 
	(custCode int PRIMARY KEY,
	custName varchar(30) NOT NULL,
	custSurname varchar(30) NOT NULL
	);

CREATE TABLE CATEGORIES 
	(catCode char(1) PRIMARY KEY,
	areaM2 int NOT NULL,
	unitCost numeric(4,2) NOT NULL
	);

CREATE TABLE CAMPS
	(campCode char(3) PRIMARY KEY,
	campName varchar(50) NOT NULL,
	numOfEmp int NOT NULL
	);

CREATE TABLE DATES
	(startDt date PRIMARY KEY,
	syear int NOT NULL,
	smonth int NOT NULL,
	sday int NOT NULL,
	);

CREATE TABLE BOOKINGS
	(bookCode int NOT NULL,
	campCode char(3) NOT NULL,
	empNo int NOT NULL,
	startDt date NOT NULL,
	endDt date NOT NULL,
	custCode int NOT NULL,
	catCode char(1) NOT NULL,
	noPers int NOT NULL,
	PRIMARY KEY (bookCode, campCode, empNo, startDt),
	FOREIGN KEY(campCode) REFERENCES CAMPS(campCode),
	FOREIGN KEY (startDt) REFERENCES DATES(startDt),
	FOREIGN KEY (custCode) REFERENCES CUSTOMERS(custCode),
	FOREIGN KEY(catCode) REFERENCES CATEGORIES(catCode)
	);


INSERT INTO CUSTOMERS(custCode, custName, custSurname)
SELECT DISTINCT custCode, custName, custSurname
FROM CAMPDB.dbo.Customer

INSERT INTO CAMPS(campCode, campName, numOfEmp)
SELECT DISTINCT campCode, campName, numOfEmp
FROM CAMPDB.dbo.Camping

INSERT INTO CATEGORIES(catCode, areaM2, unitCost)
SELECT DISTINCT catCode, areaM2, unitCost
FROM CAMPDB.dbo.Category

INSERT INTO DATES(startDt, syear, smonth, sday)
SELECT DISTINCT startDt, YEAR(startDt), MONTH(startDt), DAY(startDt)
FROM CAMPDB.dbo.Rental

INSERT INTO BOOKINGS(bookCode, campCode, empNo, startDt, endDt, custCode, catCode, noPers)
SELECT DISTINCT bookCode, campCode, empNo, startDt, custCode, catCode, noPers
FROM CAMPDB.dbo.campData