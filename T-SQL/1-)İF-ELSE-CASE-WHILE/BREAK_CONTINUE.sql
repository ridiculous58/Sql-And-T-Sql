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
DECLARE @saya� INT
SELECT @saya� = 1
WHILE (@saya�<15)
BEGIN
SELECT @saya� =@saya� +1
if(@saya�=1)
Continue
Print 'Saya�='
Print @saya�
END
GO