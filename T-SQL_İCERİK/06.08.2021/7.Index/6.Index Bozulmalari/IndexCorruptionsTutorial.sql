--1.Konu Index'ler Nas�l Bozulur.
--2.Konu Bu Bozulmalar� Nas�l Fark Ederiz.
--3.Konu Bu Bozulmalar� Nas�l D�zeltiriz.


--1.Konu Yeni Kay�tlar Eklendik�e Index Bozulmaya ba�lar
--2.Konu �lgili Index 'in properties lerine gidip oradan Fragmentation lar�nda bulunan page fullness a bak�p doluluk oran�n� bulabiliriz.Total Fragmantation ise Index 'in Bozulma oran�d�r.
--3.Konu Rebuild , Reorganize :
--Rebuild    kavrami : Masan�n �st� da��n�k duzeltmek istiyorsunuz ama butun da��n�kl�g� masan�n ustunden kald�r�p sonra duzeltmeye ba�l�yorsunuz. => Fragmantation %40 '�n �st�ndeyse kullanmak daha mant�kl�
--Reorganize kavrami : Masan�n �st� da��n�k duzeltmek istiyorsunuz ama bunu masan�n �st�nde yap�yorsunuz. => Fragmantation %40 '�n alt�ndaysa kullanmak daha mant�kl�

--Genel Tavsiye Rebuild 'dir

--Index'leri Bozal�m
--Exec SPGENERATE_CUSTOMER

--Inde2lerin Bozulmas� Arama performans�n� dogrudan etkiler


-- Fill Factor ise Index Properties k�sm�ndan options'larda Storage k�sm�nda bulunur default de�eri 0 d�r biz 70 yapal�m


--Biz Bu fill factor olay�n� global yapabiliyoruz Server'�n properties lerinden Fill factor alan�n� de�i�tirir sek olusan tum Index'lerde o global ' � ornek alacak ,yani default de�eri de�i�tirdik