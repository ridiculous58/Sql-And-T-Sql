CREATE TRIGGER TRG_ITEMS_DELETE_UPDATE_INSTEADOF
ON ITEMS
INSTEAD OF UPDATE,DELETE  --USER IN CALISTIRDIGI KODUN YERÝNE BÝZÝM TRIGGER DAKÝ KOD CALISIR.
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