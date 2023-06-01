CREATE TABLE campData 
	(bookCode int,
	 bookDt date, 
	 payCode int,
	 payMethod char(2),
	 custCode int,
	 custName varchar(30),
	 custSurname varchar(30),
	 custPhone varchar(20),
	 staffNo int,
	 staffName varchar(30),
	 staffSurname varchar(30),
	 totalCost numeric(19,2),
	 campCode char(3),
	 campName varchar(50),
	 numOfEmp int,
	 empNo int,
	 catCode char(1),
	 areaM2 int,
	 unitCost numeric(4,2),
	 startDt date, 
	 endDt date, 
	 noPers int, 
	 costPerRental numeric(19,2)
	 );


SET DATEFORMAT dmy;
BULK INSERT campData
FROM 'C:\Users\xrist\campData.txt'
WITH (FIRSTROW = 2,FIELDTERMINATOR= ',', ROWTERMINATOR = '\n')
