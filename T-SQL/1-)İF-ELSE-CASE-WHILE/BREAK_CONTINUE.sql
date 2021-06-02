--BREAK KOMUTU

DECLARE @SAYAC INT = 0
SELECT @SAYAC = 0
WHILE(@SAYAC != 15) 
BEGIN
SELECT @SAYAC +=2
IF(@SAYAC>15)
BEGIN
	PRINT 'SAYI 15 TEN BUYUKTUR PRG SONLANDI'
	BREAK
END
ELSE
BEGIN
	PRINT 'KISIR DONGU OLUSMADI'
	BREAK
	
END
END
GO
SELECT 'SAYAC : ', @SAYAC
--- ---------------------------------------------------------------------------
DECLARE @sayaç INT
SELECT @sayaç = 1
WHILE (@sayaç<15)
BEGIN
SELECT @sayaç =@sayaç +1
if(@sayaç=1)
Continue
Print 'Sayaç='
Print @sayaç
END
GO