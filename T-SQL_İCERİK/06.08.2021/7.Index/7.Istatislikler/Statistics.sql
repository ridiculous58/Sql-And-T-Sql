SET STATISTICS IO ON --KA� PAGE OKUDUGUNU DONDURUR
SELECT * FROM CUSTOMERS 
WHERE BIRTHDATE = '1996-03-09' 
And NAMESURNAME='ADA S�Z�ER' 

/* 
Bu sorguyu IX1 Indexini kullanarak getirdi neden IX3 kullanmad� �unku IX1 den 4 kay�t geliyor ,
IX3 den 1166 kay�t geliyor peki bu say�lar� sql server nerden biliyor . Bunun Cevab� Istatisliklerdir

Her bir Index in alt�nda Istatislik de�eri tutulur. Buna Statistic Dosyas�n�n i�erisinden eri�ebiliriz.
Bu NameSurname 'lerin ka� sat�rdan olu�tugunun say�s�n� tutar bize bir histogram ��kartm�� oldu yani.
*/

/*
	Her Index Olu�turdugumuzda ya da Rebuild etti�imizde bu istatislikler g�ncellenir
	ISTATISLIK GUNCELLEMENIN 3 YOLU VAR BUNLAR : 
	1.INDEX REBUILD ETMEK , REORGANIZE ETMEK
	2.SP_UPDATESTATS => TUM TABLOLARDAKI ISTATISLIKLERI GUNCELLER
	3.UPDATE STATISTICS CUSTOMERS => ILGILI TABLONUN ISTATISLIKLERINI GUNCELLER
*/

/*
	B�R SORGUDA SU INDEX ILE GET�R D�YEB�L�R�Z COK TAVS�YE ED�LMEZ :
	SELECT * FROM CUSTOMERS WITH(INDEX=IX3)
	WHERE BIRTHDATE = '1996-03-09' 
	And NAMESURNAME='ADA S�Z�ER' 
*/