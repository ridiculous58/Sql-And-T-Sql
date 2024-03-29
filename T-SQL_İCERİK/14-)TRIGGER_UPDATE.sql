ALTER TRIGGER TRG_TRANSACTIONS_UPDATE
ON ITEMTRANSACTIONS
AFTER UPDATE
AS
BEGIN

	DECLARE @ITEMID AS INT
	DECLARE @AMOUNT AS INT
	DECLARE @IOTYPE AS SMALLINT
	DECLARE @OLDAMOUNT AS INT
	DECLARE @NEWAMOUNT AS INT

	SELECT @ITEMID=ITEMID,@OLDAMOUNT=AMOUNT,@IOTYPE=IOTYPE FROM deleted
	SELECT @NEWAMOUNT=AMOUNT FROM inserted
	
	SET @AMOUNT = @OLDAMOUNT-@NEWAMOUNT

	IF @IOTYPE = 1
		UPDATE STOCK SET STOCK = STOCK - @AMOUNT WHERE ITEMID = @ITEMID
	IF @IOTYPE = 2
		UPDATE STOCK SET STOCK = STOCK + @AMOUNT WHERE ITEMID = @ITEMID


END

--HAREKET GUNCELLIYELIM

SELECT * FROM ITEMTRANSACTIONS WHERE ID = 5 -- 6 AMOUNT
SELECT * FROM STOCK WHERE ITEMID=487 --237 STOCK 

UPDATE ITEMTRANSACTIONS SET AMOUNT=10 WHERE ID = 5 -- 6 AMOUNT -> 10 AMOUNT

--237 STOCK -- AZALMASINI BEKLIYORUZ --233 OLDU IOTYPE =2 IDI CIKIS ISLEMI