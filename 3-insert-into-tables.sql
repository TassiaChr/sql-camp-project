INSERT INTO Staff
SELECT DISTINCT staffNo, staffName, staffSurname
FROM campData

INSERT INTO Customer
SELECT DISTINCT custCode, custName, custSurname, custPhone 
FROM campData

INSERT INTO Payment
SELECT DISTINCT payCode, payMethod 
FROM campData
 
INSERT INTO Camping
SELECT DISTINCT campCode, campName, numOfEmp
FROM campData

INSERT INTO Category
SELECT catCode, areaM2, unitCost
FROM campData

INSERT INTO Booking
SELECT DISTINCT bookCode, bookDt, payCode, custCode, staffNo
FROM campData

INSERT INTO Emplacement
SELECT DISTINCT campCode, empNo, catCode
FROM campData

INSERT INTO Rental
SELECT DISTINCT bookCode, campCode, empNo, startDt, endDt, noPers
FROM campData