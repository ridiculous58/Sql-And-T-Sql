/*
While Döngüsü: Bu döngü ile bir işlemi istediğimiz kadargerçekleştirebiliriz. 
Genel yapı şu şekildedir:
------------------------------------------------------------------------------
WHILE şart
BEGIN
Tekrarlanması istenen kodlar buraya yazılır.
……………………………………….
END

*/

--Tamsayı bir değişken tanımı yapalım. Değeri 15 oluncaya kadar bir artıralım. 15 olduğunda da yazdıralım.

DECLARE @SAYI INT = 0
WHILE (@SAYI<15)
BEGIN
	SELECT @SAYI += 1
END
PRINT @SAYI