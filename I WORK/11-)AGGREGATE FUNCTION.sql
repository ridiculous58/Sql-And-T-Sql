﻿/*
AGGEREATE FUNCTIONS

SUM(PRICE),(TOPLAM)
COUNT(PRICE),(SATIR SAYISI)
MIN(PRICE),(MINUMUM DEGER)
MAX(PRICE),(MAXIMUM DEGER)
AVG(PRICE),(ORTALMA)
-- ---------------------------------------
KULLANIMBICIMI 
SELECT SUM(PRICE) FROM CUSTOMERS

*/
SELECT * FROM SALES

SELECT SUM(TOTALPRICE) AS 'TOPLAM :',COUNT(ID)'SATIS SAYISI :'
,MIN(TOTALPRICE) AS 'MINIMUM SATILAN FIYAT :'
,MAX(TOTALPRICE) AS 'MAXIMUM SATILAN FIYAT :'
,AVG(TOTALPRICE) AS 'ORTALAMA :'
FROM SALES

SELECT SUM(TOTALPRICE) AS 'TOPLAM :',COUNT(ID)'SATIS SAYISI :'
,MIN(TOTALPRICE) AS 'MINIMUM SATILAN FIYAT :'
,MAX(TOTALPRICE) AS 'MAXIMUM SATILAN FIYAT :'
,AVG(TOTALPRICE) AS 'ORTALAMA :'
FROM SALES WHERE CITY='ANKARA'

SELECT SUM(TOTALPRICE) AS 'TOPLAM :',COUNT(ID)'SATIS SAYISI :'
,MIN(TOTALPRICE) AS 'MINIMUM SATILAN FIYAT :'
,MAX(TOTALPRICE) AS 'MAXIMUM SATILAN FIYAT :'
,AVG(TOTALPRICE) AS 'ORTALAMA :'
FROM SALES WHERE CITY='İSTANBUL'