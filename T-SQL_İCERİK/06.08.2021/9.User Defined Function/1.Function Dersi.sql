-- User Defined Fucntion lar sonuc dondurdugunden Sql sorgusunda Satýr satýr çalýþabilirler
--Satýr Satýr çalýþtýgý için sorgularýmýz cok uzun surer

Create Function DBO.TOPLA(@SAYI1 AS INT,@SAYI2 AS INT)
returns int
as
begin
declare @result as int
set @result=@SAYI1 + @SAYI2
return @result

end