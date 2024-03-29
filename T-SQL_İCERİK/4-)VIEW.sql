CREATE VIEW VWORDERS
AS
SELECT 
U.USERNAME_ KULLANICIADI,
U.NAMESURNAME ADSOYAD,
C.COUNTRY ULKE,
CT.CITY SEHIR,
T.TOWN ILCE,
A.ADDRESSTEXT ACIKADRES,
O.ID SIPARISID,
O.DATE_ SIPARISTARIHI,
ITM.ITEMCODE URUNKODU,
ITM.ITEMNAME URUNADI,
ITM.BRAND MARKA,
OD.AMOUNT MIKTAR,
OD.UNITPRICE BIRIMFIYAT,
OD.LINETOTAL SATIRTOPLAMI
FROM 
ORDERDETAILS OD
INNER JOIN ORDERS O ON OD.ORDERID = O.ID
INNER JOIN ITEMS ITM ON ITM.ID = OD.ITEMID
INNER JOIN USERS U ON U.ID = O.USERID
INNER JOIN ADDRESS A ON A.ID=O.ADDRESSID
INNER JOIN COUNTRIES C ON C.ID=A.COUNTRYID
INNER JOIN CITIES CT ON CT.ID = A.CITYID
INNER JOIN TOWNS T ON T.ID=A.TOWNID
INNER JOIN PAYMENTS P ON P.ORDERID=O.ID
GO
--VIEW VI GETIR
SELECT * FROM VWORDERS
--VIEW I SEHIRLERIN SATIS TOPLAMINI GETIR

SELECT SEHIR,SUM(SATIRTOPLAMI),COUNT(*)

FROM VWORDERS
GROUP BY SEHIR
