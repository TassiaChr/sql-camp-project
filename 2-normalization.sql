CREATE TABLE Staff
	(staffNo int PRIMARY KEY,
	staffName varchar(30) NOT NULL,
	staffSurname varchar(30) NOT NULL
	);

CREATE TABLE Customer
	(custCode int PRIMARY KEY,
	custName varchar(30) NOT NULL,
	custSurname varchar(30) NOT NULL,
	custPhone varchar(20) NOT NULL
	);

CREATE TABLE Payment
	(payCode int PRIMARY KEY,
	payMethod char(2) NOT NULL
	);

CREATE TABLE Camping
	(campCode char(3) PRIMARY KEY,
	campName varchar(50) NOT NULL,
	numOfEmp int NOT NULL
	);

CREATE TABLE Category
	(catCode char(1) PRIMARY KEY,
	areaM2 int NOT NULL,
	unitCost numeric(4,2) NOT NULL
	);

CREATE TABLE Booking
	(bookCode int PRIMARY KEY,
	bookDt date NOT NULL,
	payCode int NOT NULL,
	custCode int NOT NULL,
	staffNo int NOT NULL,
	FOREIGN KEY (payCode) REFERENCES payment(payCode),
	FOREIGN KEY (custCode) REFERENCES Customer(custCode),
	FOREIGN KEY (staffNo) REFERENCES Staff(staffNo)
	);

CREATE TABLE Emplacement
	(campCode char(3) NOT NULL,
	empNo int NOT NULL,
	catCode char(1) NOT NULL,
	PRIMARY KEY (campCode,empNo),
	FOREIGN KEY (campCode) REFERENCES Camping(campCode),
	FOREIGN KEY (catCode) REFERENCES Category(catCode)
	);

CREATE TABLE Rental
	(bookCode int NOT NULL,
	campCode char(3) NOT NULL,
	empNo int NOT NULL,
	startDt date NOT NULL,
	endDt date NOT NULL,
	noPers int NOT NULL,
	PRIMARY KEY (bookCode,campCode,empNo,startDt),
	FOREIGN KEY (bookCode) REFERENCES Booking(bookCode),
	FOREIGN KEY (campCode,empNo) REFERENCES Emplacement(campCode,empNo)
	);