
Declare @I As Int= 0
while @I < 1000000
Begin
	DECLARE @ITEMID AS INT
	DECLARE @DATE AS DATETIME
	DECLARE @AMOUNT AS INT
	DECLARE @IOTYPE AS SMALLINT

	SET @ITEMID = ROUND(RAND() *499,0) +1
	IF @ITEMID = 0
		SET @ITEMID = 1
	SET @DATE = DATEADD(DAY,-ROUND(RAND() *365,0),GETDATE())
	SET @AMOUNT = ROUND(RAND() *9,0) + 1
	SET @IOTYPE = ROUND(RAND() *1,0) + 1

	INSERT INTO [dbo].[ItemTransactions] ([ItemId], [Date_], [Amount], [IOType]) 
	VALUES(@ITEMID,@DATE,@AMOUNT,@IOTYPE)
Set @I = @I + 1
End

select IOType,Sum(Amount),Count(IOType) from ItemTransactions where ItemId = 1
group by IOType



SET STATISTICS IO ON --message sonucunda kaç sayfa okudu vb bilgileri verir
SET STATISTICS TIME ON --message sonucunda kaç dakika vb bilgileri verir
select Id ,
(Select Sum(Amount) from ItemTransactions where ItemId=Itm.Id And IOType=1) -
(Select Sum(Amount) from ItemTransactions where ItemId=Itm.Id And IOType=2) as STOK
from Items Itm order by id

