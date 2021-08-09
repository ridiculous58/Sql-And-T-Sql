--Ahmet Omer'E 1.000 Tl Para Gonderiyor

SELECT * FROM MONEYTRANSACTIONS
select c.Name, A.AccountNo,A.AccountName,A.Currency,B.Balance from AccountBalance b
inner join	Accounts a on a.Id = b.AccountId
Inner join Customers c on c.id = a.CustomerId



Insert Into [dbo].[MoneyTransactions]
([AccountId], [TranType], [Amount], [Date_],[Currency], [EftCode1], [EftCode2])
Values (1,2,1000,'2020-04-14 14:21:36','TL','12345678','')

Update [dbo].[AccountBalance] Set Balance=Balance-1000 where AccountId=1


Insert Into [dbo].[MoneyTransactions]
([AccountId], [TranType], [Amount], [Date_], [EftCode1], [EftCode2])
Values 
(2,1,1000,'2020-04-14 15:21:36','TL','12345678','0987654321')

Update [dbo].[AccountBalance] Set Balance=Balance+1000 where AccountId=2


-- ---------------------------------------------------------------------------------

BEGIN TRAN --TRANSACTION NI BASLATTIK

Insert Into [dbo].[MoneyTransactions]
([AccountId], [TranType], [Amount], [Date_],[Currency], [EftCode1], [EftCode2])
Values (1,2,1000,'2020-04-14 14:21:36','TL','12345678','')


IF @@ERROR > 0
BEGIN
	ROLLBACK TRAN
	RETURN
END

Update [dbo].[AccountBalance] Set Balance=Balance-1000 where AccountId=1

IF @@ERROR > 0
BEGIN
	ROLLBACK TRAN
	RETURN
END


Insert Into [dbo].[MoneyTransactions]
([AccountId], [TranType], [Amount], [Date_],[Currency], [EftCode1], [EftCode2])
Values 
(2,1,1000,'2020-04-14 15:21:36','TL','12345678','987654321')

IF @@ERROR > 0
BEGIN
	ROLLBACK TRAN
	RETURN
END

Update [dbo].[AccountBalance] Set Balance=Balance+1000 where AccountId=2
IF @@ERROR > 0
BEGIN
	ROLLBACK TRAN
	RETURN
END

COMMIT TRAN -- LDF DOSYASINDA MDF DOSYASINA AKTAR

 -- ROLLBACK TRAN


 --Trigger lar transactionlarýn bir parçasýdýr.
 
 /*
 TRANSACTIONLAR COMMIT VEYA ROLLBACK OLMADIGI SURECE TABLO KILITLI KALIR 
 FAKAT 1 MILYON KULLANICILI SISTEMLERDE BU KABUL EDILEBILIR BISEY DEGILDIR BU YUZDEN SORGULARI CEKERKEN WITH (NOLOCK) SEKLINDE ISLEM YAPARISEK
 LOCK A TAKILMADAN ISLEMLERI GERCEKLEÞTIRIR. 
 
 SISTEMDE ACIK TRANSACTION LARI GETIREN KOMUT => DBCC OPENTRAN
 */

 SELECT * FROM ITEMS WITH(NOLOCK)

 WAITFOR DELAY '00:00:01'

 -- SELECT * INTO DATES2 FROM DATES  => DATES TABLOSU VAR OLAN BIR TABLOMUZ DATES -2 ISE ONUN BÝR KOPYASI OLUR