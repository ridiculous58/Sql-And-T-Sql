-- User Defined Fucntion lar sonuc dondurdugunden Sql sorgusunda Sat�r sat�r �al��abilirler
--Sat�r Sat�r �al��t�g� i�in sorgular�m�z cok uzun surer

Create Function DBO.TOPLA(@SAYI1 AS INT,@SAYI2 AS INT)
returns int
as
begin
declare @result as int
set @result=@SAYI1 + @SAYI2
return @result

end