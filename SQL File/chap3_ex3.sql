#1
SELECT CUSTOMERID,
ORDERNUMBER,
ORDERDATE,
TOTALAMOUNT,
MAX(TOTALAMOUNT) OVER(partition by CUSTOMERID ) AS TOTAL_MAX
FROM ORDERS
WHERE year(ORDERDATE) = 2013;

#2

SELECT ORD.CUSTOMERID, CUS.ID,
CUS.FIRSTNAME,  
CUS.LASTNAME, 
ORD.ORDERNUMBER, 
ORD.ORDERDATE, 
ORD.TOTALAMOUNT
FROM ORDERS ORD INNER JOIN CUSTOMERS CUS 
ON ORD.CUSTOMERID = CUS.ID  AND 
ORD.TOTALAMOUNT IN (SELECT DISTINCT  MAX(TOTALAMOUNT) OVER(partition by CUSTOMERID ) AS TOTAL_MAX
FROM ORDERS 
WHERE year(ORDERDATE) = 2013) 
where  year(ORD.ORDERDATE) = 2013 
ORDER BY ORD.CUSTOMERID ASC; 

#3
SELECT ORDERNUMBER, 
MONTH(ORDERDATE) AS MONTH,
TOTALAMOUNT,
RANK() OVER(partition by MONTH(ORDERDATE) ORDER BY TOTALAMOUNT DESC) AS RK
FROM ORDERS
WHERE YEAR(ORDERDATE) = 2013
ORDER BY MONTH ASC, TOTALAMOUNT DESC;

#4
WITH RankedOrders AS (
SELECT 
month(orderdate) as month,
ORDERNUMBER,
TOTALAMOUNT,
ROW_NUMBER() OVER (PARTITION BY MONTH(ORDERDATE) ORDER BY TOTALAMOUNT DESC) AS Ranks
FROM ORDERS
WHERE YEAR(ORDERDATE) = 2013
)
SELECT month,
ORDERNUMBER,
TOTALAMOUNT
FROM RankedOrders
WHERE Ranks <= 3;  


#5









