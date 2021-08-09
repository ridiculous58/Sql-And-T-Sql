SET STATISTICS IO ON --KAÇ PAGE OKUDUGUNU DONDURUR
SELECT * FROM CUSTOMERS 
WHERE BIRTHDATE = '1996-03-09' 
And NAMESURNAME='ADA SÖZÜER' 

/* 
Bu sorguyu IX1 Indexini kullanarak getirdi neden IX3 kullanmadý çunku IX1 den 4 kayýt geliyor ,
IX3 den 1166 kayýt geliyor peki bu sayýlarý sql server nerden biliyor . Bunun Cevabý Istatisliklerdir

Her bir Index in altýnda Istatislik deðeri tutulur. Buna Statistic Dosyasýnýn içerisinden eriþebiliriz.
Bu NameSurname 'lerin kaç satýrdan oluþtugunun sayýsýný tutar bize bir histogram çýkartmýþ oldu yani.
*/

/*
	Her Index Oluþturdugumuzda ya da Rebuild ettiðimizde bu istatislikler güncellenir
	ISTATISLIK GUNCELLEMENIN 3 YOLU VAR BUNLAR : 
	1.INDEX REBUILD ETMEK , REORGANIZE ETMEK
	2.SP_UPDATESTATS => TUM TABLOLARDAKI ISTATISLIKLERI GUNCELLER
	3.UPDATE STATISTICS CUSTOMERS => ILGILI TABLONUN ISTATISLIKLERINI GUNCELLER
*/

/*
	BÝR SORGUDA SU INDEX ILE GETÝR DÝYEBÝLÝRÝZ COK TAVSÝYE EDÝLMEZ :
	SELECT * FROM CUSTOMERS WITH(INDEX=IX3)
	WHERE BIRTHDATE = '1996-03-09' 
	And NAMESURNAME='ADA SÖZÜER' 
*/