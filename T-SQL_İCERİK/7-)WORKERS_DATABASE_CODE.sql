﻿--KAYIT EKLIYELIM

INSERT INTO WORKERS ([WORKERCODE], [WORKERNAME], [GENDER], [BIRTHDATE], [TCNO], [WORKERBARCODE])

VALUES ('12345678901','ÖMER ÇOLAKOĞLU','E','19900101','12345678901',NEWID())

-- SELECT NEWID() -- SIFIR ID URETIR

SELECT * FROM WORKERS

--TRANSACTION(ISLEM) TABLOSUNA KAYIT EKLIYELIM

SELECT * FROM WORKERTRANSACTION

INSERT INTO WORKERTRANSACTION ([WORKERID], [DATE_], [IOTYPE], [GATEID])

VALUES(1,'2020-04-12 08:00:00','G',1)

-------------------------------------------------------------------

INSERT INTO WORKERTRANSACTION ([WORKERID], [DATE_], [IOTYPE], [GATEID])

VALUES(1,'2020-04-12 10:01:25','C',3)

-------------------------------------------------------------------

INSERT INTO WORKERTRANSACTION ([WORKERID], [DATE_], [IOTYPE], [GATEID])

VALUES(1,'2020-04-12 10:11:34','G',2)

-------------------------------------------------------------------

INSERT INTO WORKERTRANSACTION ([WORKERID], [DATE_], [IOTYPE], [GATEID])

VALUES(1,'2020-04-12 12:05:34','C',1)

SELECT * FROM WORKERTRANSACTION

-------------------------------------------------------------------

INSERT INTO WORKERTRANSACTION ([WORKERID], [DATE_], [IOTYPE], [GATEID])

VALUES(1,'2020-04-12 13:08:34','G',1)

-------------------------------------------------------------------

INSERT INTO WORKERTRANSACTION ([WORKERID], [DATE_], [IOTYPE], [GATEID])

VALUES(1,'2020-04-12 15:05:34','C',3)


INSERT INTO WORKERTRANSACTION ([WORKERID], [DATE_], [IOTYPE], [GATEID])

VALUES(1,'2020-04-12 15:15:21','G',3)


INSERT INTO WORKERTRANSACTION ([WORKERID], [DATE_], [IOTYPE], [GATEID])

VALUES(1,'2020-04-12 17:32:28','C',6)


SELECT * FROM WORKERTRANSACTION

TRUNCATE TABLE WORKERTRANSACTION