﻿
CREATE PROCEDURE SP_CARD_CONTROL
@WORKERBARCODE AS VARCHAR(50)
AS
BEGIN
	
	DECLARE @WORKERNAME AS VARCHAR(100)

	SELECT @WORKERNAME = WORKERNAME FROM WORKERS WHERE WORKERBARCODE = @WORKERBARCODE
	
	IF @WORKERNAME IS NULL
	BEGIN
		RAISERROR('KART GECERSİZ',16,1)
		RETURN
	END
	ELSE
	BEGIN
		SELECT @WORKERNAME
	END



END



