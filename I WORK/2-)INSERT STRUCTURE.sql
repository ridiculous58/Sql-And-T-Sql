﻿--INSERT INTO TABLOADI
--(KOLONADI1,KOLONADI2,KOLONADI3,... )
--VALUES
--(DEGER1,DEGER2,DEGER3,...)
INSERT INTO CUSTOMERS
([CUSTOMERNAME], [CITY], [BIRTHDATE], [DISTRICT], [GENDER], [NATION], [AGE])
VALUES
('EMİRHAN','İSTANBUL','03.09.2000','SULTANGAZİ','E','TR',DATEDIFF(YEAR,'03.09.2000',GETDATE()))

--SELECT SORGUSU EKLİYELİM
SELECT * FROM CUSTOMERS