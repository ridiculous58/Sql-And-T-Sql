--1.Konu Index'ler Nasýl Bozulur.
--2.Konu Bu Bozulmalarý Nasýl Fark Ederiz.
--3.Konu Bu Bozulmalarý Nasýl Düzeltiriz.


--1.Konu Yeni Kayýtlar Eklendikçe Index Bozulmaya baþlar
--2.Konu Ýlgili Index 'in properties lerine gidip oradan Fragmentation larýnda bulunan page fullness a bakýp doluluk oranýný bulabiliriz.Total Fragmantation ise Index 'in Bozulma oranýdýr.
--3.Konu Rebuild , Reorganize :
--Rebuild    kavrami : Masanýn üstü daðýnýk duzeltmek istiyorsunuz ama butun daðýnýklýgý masanýn ustunden kaldýrýp sonra duzeltmeye baþlýyorsunuz. => Fragmantation %40 'ýn üstündeyse kullanmak daha mantýklý
--Reorganize kavrami : Masanýn üstü daðýnýk duzeltmek istiyorsunuz ama bunu masanýn üstünde yapýyorsunuz. => Fragmantation %40 'ýn altýndaysa kullanmak daha mantýklý

--Genel Tavsiye Rebuild 'dir

--Index'leri Bozalým
--Exec SPGENERATE_CUSTOMER

--Inde2lerin Bozulmasý Arama performansýný dogrudan etkiler


-- Fill Factor ise Index Properties kýsmýndan options'larda Storage kýsmýnda bulunur default deðeri 0 dýr biz 70 yapalým


--Biz Bu fill factor olayýný global yapabiliyoruz Server'ýn properties lerinden Fill factor alanýný deðiþtirir sek olusan tum Index'lerde o global ' ý ornek alacak ,yani default deðeri deðiþtirdik