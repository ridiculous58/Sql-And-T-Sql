﻿SET STATISTICS IO ON
SELECT * FROM CUSTOMERS WHERE NAMESURNAME='ADA SÖZÜER' AND BIRTHDATE = '1996-03-09'

--SQL SERVERIN KAFASINI KARISTIRIYORUZ
EXEC [dbo].[SPGENERATE_CUSTOMER2]

--VERI TABANININ STATISTICS LERİ SUREKLI GUNCELLENMELIDIR 

SP_UPDATESTATS -- BUTUN TABLOLALARIN STATISTICS LERİNİ GUNCELLER

UPDATE STATISTICS CUSTOMERS --TEK TABLO STATISTICS İGUNCELLER

