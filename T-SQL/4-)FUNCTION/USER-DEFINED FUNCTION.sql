/*
-- YAPISI ---------------------------------------------------
CREATE FUNCTION [sahip_ismi] Fonksiyon_adı
([@Parametre_ismi degisken_turu [=standart_deger]],[n,n,])
RETURN skaler_veri_tipi
[WITH seçenekler]
AS
BEGIN
Fonksiyonda yapılacak işlemler
RETURN skaler değer veya değişken
END

*/

/*
Bir müşteri kodu girildiğinde, bu müşterinin KAC YASINDA OLDUGUNU bulacak
bir fonksiyon şöyle olmaktadır:
*/
CREATE FUNCTION dbo.YASBUL
(
@ID INT=1
)
RETURNS INT
WITH ENCRYPTION
AS
BEGIN
DECLARE @MUSTERIYASI INT
SELECT @MUSTERIYASI=AGE FROM CUSTOMERS WHERE ID = @ID
RETURN @MUSTERIYASI
END
GO
/*
WITH ENCRYPTION seçeneği ile kodlar gizlenmektedir.
Burada ENCRYPTION yerine SCHEMABINDING seçeneği kullanılırsa tblSepet tablosunda bir yapısal değişiklik
yapılmasına engel olacaktır
*/
SELECT * FROM CUSTOMERS WHERE AGE>dbo.YASBUL(3)

CREATE FUNCTION dbo.bırsey
(
@MUSTERIDEGERI VARCHAR(10)=NULL
)
RETURNS INT

AS
BEGIN 
	DECLARE @SAYI INT

	IF(@MUSTERIDEGERI IS NULL)
		SELECT @SAYI=(SELECT COUNT(*) FROM CUSTOMERS)


	
	RETURN @SAYI
END
GO

--TABLO DÖNDÜREN FONKSİYONLAR (TABLE-VALUED FUNCTİONS)---------------------------------------------------------------

/*
Bu tip fonksiyonlar viewlere benzerdir. Bir tek select ifadesi içerir. View’den farklı olarak
dışarıdan parametre almaktadır.
*/

/*	KULLANIM SEKLI 

CREATE FUNCTION fonksiyonAdı (varsaParametreler)
RETURNS TABLE
AS
RETURN selectİfadesi
Go

*/

/*Tüm müşterileri listeleyen bir view oluşturunuz ve bu view’i sorgulayınız.*/
CREATE VIEW MUSTERILERI_LISTELE 
AS SELECT * FROM CUSTOMERS WHERE GENDER= 'KADIN'

SELECT * FROM  MUSTERILERI_LISTELE 

--- ATYNI ISLEMI YAPAN FUNCTION TANIMLAYALIM
CREATE FUNCTION aynı_YAP()
RETURNS TABLE
AS

RETURN SELECT * FROM CUSTOMERS WHERE GENDER='KADIN'

GO
--CAGIRMA SEKLI
SELECT * FROM aynı_YAP()

--- ATYNI ISLEMI YAPAN PROCEDURE TANIMLAYALIM

CREATE PROCEDURE prc_AYNI
AS
BEGIN
	SELECT * FROM CUSTOMERS WHERE GENDER LIKE 'K%'
END
GO
--DROP PROCEDURE prc_AYNI
EXEC prc_AYNI --Prosedürler sorgulanamaz.
--- ------------------------------------------------------------
SELECT * FROM MUSTERILERI_LISTELE WHERE AGE=80--VIEW
SELECT * FROM aynı_YAP() WHERE AGE=80 --FUNCTION

--Yukarıdaki sorgulamalardan, fonksiyonların view gibi sorgulanabildiğini gördük.
--PROCEDURLER EXEC IFADESIYLE CAGIRILMAK ZORUNDA OLDUGUNDAN SORGULANAMAZ

-- ----------------------------------------------------------------------------

-- Şimdi view, fonksiyon ve prosedüre grubu parametresi tanımlayalım ve VE YASI 80 OLANLARI listeleyelim.
--VIEW LER PARAMETRE ALAMAZ

--PROCEDURE TANIMLAYALIM

CREATE PROCEDURE prc_PARAMETRELI
@YASI INT=NULL
AS
BEGIN
SELECT * FROM CUSTOMERS WHERE AGE=@YASI
END
GO
--CALISTIRALIM
EXEC prc_PARAMETRELI 21--YASI 21 OLANLARI LISTELEDI

--WE ARE FUNCTION DEFINED

CREATE FUNCTION fc_PARAMETRELI
(
@YAS2 INT = NULL
)
RETURNS TABLE
AS
RETURN SELECT * FROM CUSTOMERS WHERE AGE=@YAS2
GO

SELECT * FROM fc_PARAMETRELI(52) WHERE GENDER LIKE 'E%'

/*	FONKSIYONDA DEGISIKLIK
Alter function fn_musteri (@grubu varchar(10))
Returns table
As
Return select * from musteri where grubu=@grubu
Go
*/
-- -------------------------------------------------------------------------------------------
/*	PROCEDURE DE DEGISIKLIK

Alter proc sp_musteri @grubu varchar(10)
As
Select * from musteri where grubu=@grubu
Go

*/
-- -------------------------------------------------------------------------------------------
/*

View ve fonksiyon sorgulanabilir, prosedür sorgulanamaz.

View’in parametresi olamaz, ancak fonksiyon ve prosedürün parametresi bulunabilir.

Prosedürün kullanım amacı çoğunlukla, insert, update vs. gibi iş yapmaktır.

*/

CREATE FUNCTION ayini_BUL
(
@ay_NO INT = 1
)
RETURNS VARCHAR(15)
AS
BEGIN
	RETURN(
	SELECT CASE @ay_NO
	WHEN 1 THEN '01.OCAK' 
	WHEN 2 THEN '02.ŞUBAT' 
	WHEN 3 THEN '03.MART' 
	WHEN 4 THEN '04.NISAN' 
	WHEN 5 THEN '05.MAYIS' 
	WHEN 6 THEN '06.HAZIRAN' 
	WHEN 7 THEN '07.TEMMUZ' 
	WHEN 8 THEN '08.AGUSTOS' 
	WHEN 9 THEN '09.EYLUL' 
	WHEN 10 THEN '10.EKIM' 
	WHEN 11 THEN '11.KASIM' 
	WHEN 12 THEN '12.ARALIK'
	ELSE 'TANIMSIZ'
	END
	) 

	
END
GO

SELECT dbo.ayini_BUL(12) AS AY

--MUSTERININ ID SINI VERDIGIMIZDE ADINI DONDUREN FUNCTION YAZINIZ

CREATE FUNCTION ad_bul
(
@musteri_ID INT =1
)
RETURNS VARCHAR(100)
AS
BEGIN
	RETURN(SELECT CUSTOMERNAME FROM CUSTOMERS WHERE ID = @musteri_ID)
END
GO

SELECT dbo.ad_bul(200) AS CUSTOMERNAME --dbo. yazmazsan calısmaz