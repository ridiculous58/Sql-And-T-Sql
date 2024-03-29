
--BELIRLEDIGIMIZ ISLEMI YAPMAZ
CREATE TRIGGER TRG_ITEMS_DELETE_UPDATE_INSTEAD_OF
ON ITEMS
INSTEAD OF DELETE,UPDATE
AS
BEGIN

DECLARE @DELETEDCOUNT AS INT
DECLARE @INSERTEDCOUNT AS INT

SELECT @DELETEDCOUNT = COUNT(*) FROM deleted
SELECT @INSERTEDCOUNT = COUNT(*) FROM inserted
DECLARE @LOG_ACTIONTYPE AS VARCHAR(20)

IF @DELETEDCOUNT > 0 AND @INSERTEDCOUNT > 0
	SET @LOG_ACTIONTYPE = 'UPDATE'
IF @DELETEDCOUNT > 0 AND @INSERTEDCOUNT = 0
	SET @LOG_ACTIONTYPE = 'DELETE'

	INSERT INTO ITEMS_LOG([ID], [ITEMCODE], [ITEMNAME], [UNITPRICE], [CATEGORY1], [CATEGORY2], [CATEGORY3], [CATEGORY4], [BRAND], [LOG_ACTIONTYPE], [LOG_DATE], [LOG_USERNAME], [LOG_PROGRAMNAME], [LOG_HOSTNAME])
	
	SELECT [ID], [ITEMCODE], [ITEMNAME], [UNITPRICE], [CATEGORY1], [CATEGORY2], [CATEGORY3], [CATEGORY4], [BRAND],@LOG_ACTIONTYPE,GETDATE(),SUSER_NAME(), PROGRAM_NAME(),HOST_NAME()
	FROM deleted 
END

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM [ETRADE].[dbo].[ITEMS] WHERE ID = 15
  
  SELECT * FROM [dbo].[ITEMS_LOG]