/*
Genel olarak
CREATE Trigger oluştur_adi
ON Tablo_adi
WITH seçenekler
{FOR | AFTER | INSTEAD OF} {INSERT | UPDATE | DELETE }
AS
--T-SQL Kodları….
GO
--FOR (INSERT | UPDATE | DELETE ) ONCE 
--AFTER (INSERT | UPDATE | DELETE ) SONRA
--INSTEAD OF (INSERT | UPDATE | DELETE ) ISLEM GERCEKLESIRKEN (YAPARKEN)

-- ---------------------------------------------------------------------+
Bir Trigger’ın kodlarına Query Analyzer ile şu şekilde erişebiliriz:
Sp_helptext trigger_ismi
*/
-- INSERT TRIGGER
CREATE TRIGGER UYARIVER --(INSERTED VEYA DELETED TRIGGER TABLOSU CAGIRMAK ISTERSEK)
ON NAMES
FOR INSERT
AS
DECLARE @GIRILENID INT
PRINT 'YENI KAYIT GIRILDI'
GO
SELECT * FROM NAMES
INSERT INTO NAMES (ID,[NAME_], [GENDER], [NAME2]) VALUES(613,'EMIRHAN','ERKEK','EMIRHAN2')

--DELETE_ TRIGGER --------------------------------------------------------
CREATE TRIGGER DELETE_
ON NAMES
AFTER DELETE
AS
IF EXISTS(SELECT * FROM NAMES N RIGHT JOIN DELETED D ON N.ID=D.ID WHERE D.ID = 613 )
BEGIN 
PRINT 'KAYIT SILINMEDI'
RAISERROR( 'BU KAYDI SILEMEZSINIZ',10,1)
ROLLBACK
END
GO
--DROP TRIGGER DELETE_
DELETE FROM NAMES WHERE ID=613

SELECT * FROM NAMES 

--UPDATE TRIGGER --------------------------------------------------------
CREATE TRIGGER urunFiyatAzalmasin
ON CUSTOMERS
AFTER UPDATE
AS
BEGIN
IF EXISTS
(
SELECT *
FROM INSERTED I INNER JOIN DELETED D
ON D.ID = I.ID
WHERE  D.AGE>I.AGE
)
BEGIN
RAISERROR('YASLARI AZALTAMAZSIN',10,1)
PRINT('LA OLMAZ BU DURUM')
ROLLBACK
END
END
GO
--DROP TRIGGER urunFiyatAzalmasin
UPDATE CUSTOMERS SET AGE -=1

--IF UPDATE()--------------------------------------------------------
/* YAPISI:
CREATE TRIGGER trigger_simi
ON tablo_ismi
FOR UPDATE [,DELETE,INSERT]
AS
IF UPDATE (sütun_ismi1) OR UPDATE (sütun_ismi2)
BEGIN
--sütunlardan herhangi biri değişirse çalışacak kodlar…
END


*/

CREATE TRIGGER SUTUNDEGISIKLIK
ON CUSTOMERS
AFTER UPDATE
AS
IF UPDATE(CUSTOMERNAME) OR UPDATE(ID)
BEGIN
PRINT 'ID VEYA CUSTOMER ALANINDA DEGISIKLIK YAPILDI'
END
GO
-- ----------------------------------------------------------------------
/*
CREATE TRIGGER trigger_simi
ON tablo_ismi
FOR UPDATE [,DELETE,INSERT]
AS
IF COLUMNS_UPDATED() & maske_deger>0
BEGIN
--sütunlardan herhangi biri veya hepsi değişirse çalışacak kodlar…
END

MASKELEME:
Sütun No 1 2 3 4 5  6  7   8   9  10   11   12
Değer    1 2 4 8 16 32 64 128 256 512 1025 2048
-- -------------------------------------------------
IF COLUMNS_UPDATED() & 17 >0
BEGIN
--1 ve 5 nolu sütunlar değişirse çalışacak kodlar
END
-- ------------------------------------------------
Kullanıcının e-mail adresinin değiştirilememesini istiyorsak:
CREATE TRIGGER emailDegismez
ON tbl_kullanici
AFTER UPDATE
AS
IF UPDATE(email) yada IF COLUMNS_UPDATED() & 4>0
BEGIN
IF EXISTS
(
SELECT *
FROM tbl_kullanici K JOIN DELETED D
ON K.kullaniciKod = D.kullaniciKod
WHERE D.email>K.email
)
BEGIN
RAISERROR(‘Kullanıcı mail adresi değiştirilemez’,10,1)
ROLLBACK
END
-- -------------------------------------------------------

*/

--VERİTABANI SEVIYESI TRIGGLER -------------------------------------------------------

/*
KULLANIM SEKLI:
ILK ONCE SEVIYEYI BELIRTMEMIZ LAZIM
Veritabanı üzerinde tablo silinmesini ve değiştirilmesini yasaklayacak bir Trigger yazalım.
*/

CREATE TRIGGER DATABASE_
ON DATABASE 
FOR DROP_TABLE, ALTER_TABLE--OZEL KULLANIM
AS
BEGIN
PRINT 'BU VERITABANI USTUNDE TABLO DEGISIKLIGI YASAKLANDI'
ROLLBACK
END
GO

-- -------------------------------------------------------------------------
/*
Veritabanı düzeyinde tanımlı Trigger’ları görelim.

SELECT * FROM sys.triggers WHERE parent_id = 0 --Veritabanı düzeyinde tanımlı Trigger PARENT_ID=0 DIR


*/

SELECT * FROM sys.triggers 

/*
TRIGGERLERIN ISMINI DEGISTIRELIM
Sp_rename !sistem! stored procedure’ünü kullanarak Trigger’ların isimlerini değiştirebiliriz

/*				KULLANIM SEKLI
sp_rename @objname = eski_isim, @newname = yeni_isim
(@objname = Nesnenin halihazırda geçerli olan ismi - @newname = Nesnenin değiştirilme işleminden sonra alacağı ismi)
*/

*/
EXEC SP_RENAME @objname =urunFiyatAzalmasin, @newname =NOT_DROPDATABASE

--ALTER ILE TRIGGER DUZLENLEME
/*		KULLANIM SEKLI

ALTER TRIGGER trigger_ismi
ON tablo_adi | DATABASE | ALL SERVER
WITH seçenekler
FOR olay_tanımları
AS
Otomatik çalışacak SQL ifadeleri

*/

--TRIGGER SILMEK
/*DROP TRIGGER trigger_ismi*/

--VERI TABANI SEVIYESINDEKI TRIGGER I SILMEK
/*   KULLANIM SEKLI
DROP TRIGGER trigger_ismi ON DATABASE
*/
-- ------------------------------------------------------------------
--SUNUCU SEVIYESINDEKI TRIGGER I SILMEK
/*	KULLANIM SEKLI
DROP TRIGGER trigger_ismi
ON ALL SERVER
*/
-- ------------------------------------------------------------------

--TRIGGERLERI TEPKIMEYE KAPATMA
/*	KULLANIM SEKLI
ALTER TABLE tablo_ismi
DISABLE TRIGGER trigger_ismi | ALL
*/

--TRIGGERLERI TEPKIMEYE ACMA
/*	KULLANIM SEKLI
ALTER TABLE tablo_ismi
ENABLE TRIGGER trigger_ismi | ALL
*/
--BELIRLI BIR TRIGGERLI TEPKIMEYE ACIP KAPATABILIRIZ
/*
Not: Sadece belirli bir Trigger’ı da tepkimeye kapatıp açabiliriz.
DISABLE TRIGGER trigger_ismi Trigger’ı tepkimeye kapatır.
ENABLE TRIGGER trigger_ismi Trigger’ı tepkimey
*/
ALTER TABLE CUSTOMERS
ENABLE TRIGGER [urunFiyatAzalmasin]
-- DATABASE TRIGGER DISABLE----------------------------------------------
/*DISABLE TRIGGER { [ schema_name . ] trigger_name [ ,...n ] | ALL }  
ON { object_name | DATABASE | ALL SERVER } [ ; ]  */

--ENABLE TRIGGER DATABASE_ ON DATABASE

