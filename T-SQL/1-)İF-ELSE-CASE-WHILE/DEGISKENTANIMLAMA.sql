--T-SQL DE DEGISKEN TANIMLAMA
-- ---------------------------------------------------------------------------------------
DECLARE @DEGISKEN NVARCHAR(50) --DEGISKEN OLUSTURMA
SET @DEGISKEN = 'EMIRHAN' --SET ILE DEGISKENE DEGER ATAMA
SELECT @DEGISKEN = 'dILARA' --SELECT IFADESIYLE DEGISKENE DEGER ATAMA
select @DEGISKEN
--BU BIR BUTUNDUR BUTUN OLARAK CALISTIRILMASI GEREKIR YOKSA SELECT IFADESI CALISMAZ

-- ---------------------------------------------------------------------------------------

DECLARE @enYuksekFiyat MONEY-- DEGISKENI TANIMLADIK

SELECT @enYuksekFiyat = Max(saatlik_ucret) FROM [tbl.Rapor] -- CUSTOMERS TABLOSUNDAN EN BUYUK OLAN SAYIYI CEKTIK

SELECT @enYuksekFiyat --SELECT IFADESIYLE SONUCU DONDURDUK BUNLAR BIR BUTUNDUR BIRLIKTE CALISTIRILMALIDIR

-- ---------------------------------------------------------------------------------------
DECLARE @enYuksekFiyat2 MONEY -- DEGISKEN TANIMI YAPTIK DECLARE DEGISKEN_ADI DEGISKEN_TIPI
SELECT @enYuksekFiyat2 = 23799.0328 --SELECT ILE SADECE TABLODAKI DEGERLER DEGILDE SABIT DEGERDE ATABILIRIZ
-- ---------------------------------------------------------------------------------------

--Not: Bir SELECT ifadesi kullanılarak, sütundan alınan değer değişkene atanacaksa, bu
--SELECT ifadesinin bir tek satır döndürdüğüne dikkat etmek gerekir. Aksi halde, değişkenin
--tuttuğu değer SELECT ifadesinin döndürdüğü satırların en sonunda yer alan değer olacaktır

DECLARE @enYuksekFiyat3 MONEY-- DEGISKENI TANIMLADIK

SELECT @enYuksekFiyat3 = saatlik_ucret FROM [tbl.Rapor] -- CUSTOMERS TABLOSUNDAN EN SONDA OLAN SAYIYI CEKTIK

SELECT @enYuksekFiyat3 --sELECT IFADESIYLE SONUCU DONDURDUK BUNLAR BIR BUTUNDUR BIRLIKTE CALISTIRILMALIDIR

-- ----------------------------------------------------------------------------------------------------

DECLARE @ID VarChar(200), @Adı VARCHAR(200)
SELECT @ID = ID, @Adı = CUSTOMERNAME
FROM CUSTOMERS
WHERE ID = 150
SELECT @ID AS YASI, @Adı AS ADI

-- ----------------------------------------------------------------------------------------------------
--SONUCUN TEK SATIR DONDURDUGUNE DIKKAT EDILMELIDIR VE BUTUN OLARAK CALISTIRILMALIDIR

-- ----------------------------------------------------------------------------------------------------

DECLARE @SAYAC INT = 0
SET @SAYAC +=7
SELECT @SAYAC AS 'SAYACIN DEGERI : 7'
SET @SAYAC -= 2
SELECT @SAYAC AS 'SAYACIN DEGERI : 5'
SET @SAYAC -=10
SELECT @SAYAC AS 'SAYACIN DEGERI : -5'
-- ----------------------------------------------------------------------------------------------------

DECLARE @sayac INT = 0;
SET @sayac +=7;
SELECT @sayac as arti7;
SET @sayac -=2;
SELECT @sayac as eksi2;
SET @sayac *=10;
SELECT @sayac as carpi10;
SET @sayac /=5;
SELECT @sayac as bolum5;
SET @sayac %=8;
SELECT @sayac as mod8;

-- ----------------------------------------------------------------------------------------------------

--Bit Seviye Operatörler

DECLARE @TRUEFALSE BIT
SET @TRUEFALSE=1
SELECT ~@TRUEFALSE -- ~ DEGIL DEMEKTIR

-- ----------------------------------------------------------------------------------------------------
--SELECT @@connections; --SQL Server’a kaç kere bağlanıldığını gösteren global değişkendir.
DECLARE @@AD VARCHAR(20)
SELECT @@AD = 'EMİRHAN'

SELECT @@AD

SELECT @@connections AS 'SQL Server’a kaç kere bağlanıldığını gösteren DEGISKEN'

-- ----------------------------------------------------------------------------------------------------

--GO ifadesi T-SQL komut yığınının
--sonunu belirtmek için kullanılır ve Query Analyzer ya da osql gibi istemci
--uygulamalar tarafından algılanır ve yorumlanır. SQL Server motoruna
--iletilmez. T-SQL’in bir parçası değildir

-- ----------------------------------------------------------------------------------------------------

DECLARE @sonuc MONEY
SELECT @sonuc = SUM(AGE)
FROM CUSTOMERS

PRINT CAST(@sonuc AS VARCHAR(10)) -- MONEY TIPINI VARCHAR YAP

GO--BOLUMU BITIR

-- ----------------------------------------------------------------------------------------------------
