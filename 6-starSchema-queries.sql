SELECT TOP 100 custName, custSurname, SUM(unitCost * noPers * (DATEDIFF(day, startDt, endDt)) + 1) as totalCost
FROM CUSTOMERS CU
INNER JOIN  BOOKINGS B ON CU.custCode = B.custCode
INNER JOIN CATEGORIES CA ON CA.catCode = B.catCode
GROUP BY custName, custSurname
ORDER BY totalCost DESC


SELECT DISTINCT B.campCode, B.catCode, syear, SUM(unitCost * noPers * (DATEDIFF(day, D.startDt, endDt)) + 1)
FROM CAMPS CAM
INNER JOIN BOOKINGS B ON CAM.campCode = B.campCode 
INNER JOIN CATEGORIES CAT ON CAT.catCode = B.catCode
INNER JOIN DATES D ON D.startDt = B.startDt
WHERE syear = 2000
GROUP BY B.campCode, B.catCode, syear
ORDER BY campCode, catCode


SELECT DISTINCT B.campCode, smonth, syear, SUM(unitCost * noPers * (DATEDIFF(day, D.startDt, endDt)) + 1)
FROM BOOKINGS B
INNER JOIN CATEGORIES CAT ON CAT.catCode = B.catCode
INNER JOIN CAMPS CAM ON CAM.campCode = B.campCode
INNER JOIN DATES D ON D.startDt = B.startDt
WHERE syear = 2018
GROUP BY smonth, B.campCode, syear
ORDER BY campCode, smonth


SELECT SUM(noPers), syear, B.campCode, B.catCode
FROM CAMPS CAM 
INNER JOIN BOOKINGS B ON CAM.campCode = B.campCode 
INNER JOIN DATES D ON D.startDt = B.startDt
GROUP BY ROLLUP (noPers, syear, B.campCode, B.catCode)


SELECT B.campCode, B.catCode, syear, SUM(unitCost * noPers * (DATEDIFF(day, D.startDt, endDt)) + 1)
FROM CAMPS CAM 
INNER JOIN BOOKINGS B ON CAM.campCode = B.campCode 
INNER JOIN CATEGORIES CAT ON CAT.catCode = B.catCode
INNER JOIN DATES D ON D.startDt = B.startDt
GROUP BY CUBE (syear, B.campCode, B.catCode)
