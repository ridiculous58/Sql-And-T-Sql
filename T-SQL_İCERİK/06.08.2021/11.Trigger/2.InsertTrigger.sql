
Create Trigger TRG_TRANSACTION_INSERT
ON ITEMTRANSACTIONS
AFTER INSERT
AS
BEGIN
DECLARE @ITEMID AS INT
DECLARE @AMOUNT AS INT
DECLARE @IOTYPE AS SMALLINT

SELECT @ITEMID=ITEMID,@AMOUNT=AMOUNT,@IOTYPE=IOTYPE FROM INSERTED

IF @IOTYPE = 1
	UPDATE STOCK SET STOCK=STOCK+@AMOUNT WHERE ITEMID=@ITEMID
IF @IOTYPE = 2
	UPDATE STOCK SET STOCK=STOCK-@AMOUNT WHERE ITEMID=@ITEMID
END

--DOGRULAMA

INSERT INTO ItemTransactions (ItemId,Amount,IOType,Date_)
VALUES(1,3,2,GETDATE())


SELECT * FROM STOCK WHERE STOCK <> 0
