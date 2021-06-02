/*
Case Kontrol Deyimi:
• Genel yapı şu şekildedir:

CASE
WHEN şart THEN değer
[ELSE değer]
END

*/
-- ----------------------------------------------------------------------
SELECT AGE,YILDIZ=
CASE
	WHEN COUNT(AGE) > 10 THEN '****'
	WHEN COUNT(AGE) > 9 THEN '***'
	WHEN COUNT(AGE) > 8 THEN '**'
	WHEN COUNT(AGE) > 5 THEN '**'
END,COUNT(*) AS 'HEPSI'
FROM CUSTOMERS
GROUP BY AGE
-- ----------------------------------------------------------------------
SELECT  ID,KIDEMLI=
CASE ID
	WHEN '1' THEN 'ÜST DÜZEY' 
	WHEN '2' THEN 'ORTA DÜZEY'
	WHEN '3' THEN 'ALT DÜZEY'
	ELSE 'BELİRSİZ MÜŞTERİ TİPİ'
END,CUSTOMERNAME As CUSTOMER_NAME
FROM CUSTOMERS

-- ----------------------------------------------------------------------