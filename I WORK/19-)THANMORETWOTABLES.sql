﻿SELECT
U.NAMESURNAME AS ADSOYAD,
U.EMAIL AS MAILADRESI,
U.GENDER AS CINSIYET,
U.BIRTHDATE AS DOGUMTARIHI,
C.COUNTRY AS ULKE,CT.CITY AS SEHIR,
T.TOWN AS ILCE ,D.DISTRICT AS SEMT,A.POSTALCODE AS POSTACODU,
A.ADDRESSTEXT AS ACIKADRESS
FROM USERS AS U,ADDRESS A,COUNTRYS C,CITIES CT,TOWNS T,DISTRICTS D
WHERE U.ID=A.USERID AND C.ID=A.COUNTRYID
AND CT.ID=A.CITYID AND T.ID=A.TOWNID AND D.ID=A.DISTRICTID
AND CT.CITY LIKE 'DENİZLİ'

ORDER BY U.NAMESURNAME ASC--DESC

--DISTINCT ALTERNATIFI GROUP BY DIR GROUP BY SADECE AGGERAGATE FUNCTION LARLA KULLANILMAZ

SELECT
COUNT(DISTINCT U.NAMESURNAME)
FROM USERS AS U,ADDRESS A,COUNTRYS C,CITIES CT,TOWNS T,DISTRICTS D
WHERE U.ID=A.USERID AND C.ID=A.COUNTRYID
AND CT.ID=A.CITYID AND T.ID=A.TOWNID AND D.ID=A.DISTRICTID

-- YUKARIDAKI ILE ASAGIDAKI KODUN SONUC OLARAK FARKI YOKTUR -------------------------------------------------
SELECT
U.NAMESURNAME,COUNT(A.USERID) AS ADDRESSAYISI,COUNT(DISTINCT C.COUNTRY) AS ULKESAYISI,
COUNT(DISTINCT CT.CITY) AS SEHIRSAYISI
FROM USERS AS U,ADDRESS A,COUNTRYS C,CITIES CT,TOWNS T,DISTRICTS D
WHERE U.ID=A.USERID AND C.ID=A.COUNTRYID
AND CT.ID=A.CITYID AND T.ID=A.TOWNID AND D.ID=A.DISTRICTID

GROUP BY U.NAMESURNAME
--IKIDEN FAZLA ADRES OLAN KULLANICILARI LISTELE AGGEREGATE FUNTION LARDA SINIRLAMADA WHERE YERINE HAVING KULLANILIR
HAVING COUNT(A.ID)>2


-- --------------------------------------------------------------------------------------------
SELECT
CT.CITY,COUNT(U.ID),COUNT(D.DISTRICT) ILCESAYISI
FROM USERS AS U,ADDRESS A,COUNTRYS C,CITIES CT,TOWNS T,DISTRICTS D
WHERE U.ID=A.USERID AND C.ID=A.COUNTRYID
AND CT.ID=A.CITYID AND T.ID=A.TOWNID AND D.ID=A.DISTRICTID

GROUP BY CT.CITY


