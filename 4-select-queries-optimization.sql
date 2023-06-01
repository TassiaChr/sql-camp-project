SELECT COUNT(bookCode) AS Bookings, payMethod
FROM Booking B 
INNER JOIN Payment P ON B.payCode = P.payCode
GROUP BY payMethod
ORDER BY COUNT(bookCode)



WITH C AS (
SELECT COUNT(bookCode) AS CNT ,staffSurname, staffName
		FROM Staff S INNER JOIN Booking B ON S.staffNo = B.staffNo
		GROUP BY staffSurname, staffName), 
B AS (
SELECT MAX(C.CNT) AS MAX_CNT,staffSurname, staffName
		FROM C
		GROUP BY staffSurname, staffName)


SELECT S.staffName, S.staffSurname, COUNT(book.bookCode) AS Max_Bookings
FROM Booking  as book
INNER JOIN Staff S ON S.staffNo = book.staffNo
INNER JOIN B B on B.staffSurname= S.staffSurname
GROUP BY S.staffSurname, S.staffName, B.MAX_CNT
HAVING
	COUNT(bookCode) = B.MAX_CNT



SELECT DISTINCT E.campCode, COUNT(bookCode) as A_Bookings
FROM Rental R 
INNER JOIN Emplacement E ON R.campCode = E.campCode
WHERE catCode = 'A'
GROUP BY E.campCode
ORDER BY A_Bookings


SELECT custSurname, custName, COUNT(bookCode) as Bookings_2000
FROM Customer C 
INNER JOIN Booking B ON C.custCode = B.custCode
WHERE YEAR(bookDt) = 2000
GROUP BY custName, custSurname
ORDER BY custSurnameCREATE INDEX idx_d ON Booking(bookDt, custCode)SELECT R.campCode, SUM(unitCost * noPers * (DATEDIFF(day, startDt, endDt)) + 1) AS Profit
FROM Rental R
INNER JOIN Emplacement E ON R.campCode = E.campCode AND R.empNo = E.empNo 
INNER JOIN Category C ON E.catCode = C.catCode
GROUP BY R.campCode
ORDER BY ProfitCREATE INDEX idx_e1 ON Emplacement(catCode, campCode)CREATE INDEX idx_e2 ON Rental(startDt, endDt, noPers)