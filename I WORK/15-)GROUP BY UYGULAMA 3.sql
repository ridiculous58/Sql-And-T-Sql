SELECT CATEGORY1,CATEGORY2,CATEGORY3,CATEGORY4,
SUM(TOTALPRICE) AS 'TOTALPRICE',
COUNT(*) AS ROWCOUNT_,
SUM(AMOUNT) AS TOTALAMOUNT

FROM SALES

GROUP BY CATEGORY1,CATEGORY2,CATEGORY3,CATEGORY4
ORDER BY CATEGORY1,CATEGORY2,CATEGORY3,CATEGORY4,SUM(TOTALPRICE)