--CREATE TRIGGER TRG_ITEMS_UPDATE
--ON ITEMS
--AFTER UPDATE
--AS
--BEGIN 
--INSERT INTO Item_Logs
--([Id], [ItemCode], [ItemName], [UnitPrice], [Category1], [Category2], [Category3], [Category4], [Brand], [Log_ActionType], [Log_Date], [Log_Username], [Log_ProgramName], [Log_HostName])

--SELECT [Id], [ItemCode], [ItemName], UNITPRICE, [Category1], [Category2], [Category3], [Category4], [Brand],'Update',
--GETDATE(),
--SUSER_NAME(),
--PROGRAM_NAME(),
--HOST_NAME()
--FROM deleted

--END

--FOR DELETE 


Create TRIGGER TRG_ITEMS_DELETE
ON ITEMS
AFTER Delete
AS
BEGIN 
INSERT INTO Item_Logs
([Id], [ItemCode], [ItemName], [UnitPrice], [Category1], [Category2], [Category3], [Category4], [Brand], [Log_ActionType], [Log_Date], [Log_Username], [Log_ProgramName], [Log_HostName])

SELECT [Id], [ItemCode], [ItemName], UNITPRICE, [Category1], [Category2], [Category3], [Category4], [Brand],'Delete',
GETDATE(),
SUSER_NAME(),
PROGRAM_NAME(),
HOST_NAME()
FROM deleted

END


Delete from ITEMS where ID=7

select * from Item_Logs