/****** Script for SelectTopNRows command from SSMS  ******/
--clean data 
-- 135080 row has no customerid 
-- 406829 row has  customerid
-- now we have 397884 row clean 

with cte as 
(
	SELECT  [InvoiceNo]
		  ,[StockCode]
		  ,[Description]
		  ,[Quantity]
		  ,[InvoiceDate]
		  ,[UnitPrice]
		  ,isnull([CustomerID],0) as CustomerID
		  ,[Country]
	  FROM [SQLbook].[dbo].[online_retail]
) 
,cleandata as 
(
	select *
	from cte 
	where CustomerID > 0 --clean customerid
	and UnitPrice >0 --clean unitprice
	and Quantity >0 --clean quantity 
	
)
,duplicatechek as 
(
	select * 
	from cleandata
)
--clean data with out duplicate 
,clear as 
(
	select * ,ROW_NUMBER() over(partition by invoiceno,stockcode,quantity order by invoicedate) as dupcheck
	from duplicatechek
)
select *
into #online_retail
from clear
where dupcheck =1  -- here to retrive data with uniquness
--now let's insert it to temp table










 
---let's start in cohort analysis 


select CustomerID 
	,MIN(invoicedate) as FirstPurchase
	,DATEFROMPARTS(YEAR(MIN(invoicedate)),MONTH(MIN(invoicedate)),1) AS CohortDate
into #cohort
from #online_retail
GROUP BY CustomerID


SELECT R.* 
	,C.CohortDate
	,YEAR(R.invoicedate) as invoice_year 
	,MONTH(R.invoicedate) as invoice_month
	,YEAR(c.cohortdate) as cohort_year
	,MONTH(c.cohortdate)as cohort_month
FROM #cohort C RIGHT JOIN  #online_retail R 
ON C.CustomerID = R.CustomerID

--then deduct date from cohortdate
SELECT M.* 
	,YEAR_DIFF = invoice_year - cohort_year
	,MONTH_DIFF = invoice_month - cohort_month
FROM(
	SELECT R.* 
		,C.CohortDate
		,YEAR(R.invoicedate) as invoice_year 
		,MONTH(R.invoicedate) as invoice_month
		,YEAR(c.cohortdate) as cohort_year
		,MONTH(c.cohortdate)as cohort_month
	FROM #cohort C RIGHT JOIN  #online_retail R 
	ON C.CustomerID = R.CustomerID
)M

---Let'd creat cohort index
SELECT MM.*
	,Cohort_index = YEAR_DIFF * 12 + cohort_month + 1
--INTO #Cohort_Retained	
FROM (
	SELECT M.* 
		,YEAR_DIFF = invoice_year - cohort_year
		,MONTH_DIFF = invoice_month - cohort_month
	FROM(
		SELECT R.* 
			,C.CohortDate
			,YEAR(R.invoicedate) as invoice_year 
			,MONTH(R.invoicedate) as invoice_month
			,YEAR(c.cohortdate) as cohort_year
			,MONTH(c.cohortdate)as cohort_month
		FROM #cohort C RIGHT JOIN  #online_retail R 
		ON C.CustomerID = R.CustomerID
	)M
)MM	


select *
	from (
	select distinct 
		customerid,
		CohortDate ,
		cohort_index
	from #Cohort_Retained
----order by CustomerID , Cohort_index 
) pvt 
pivot COUNT(customerid) for
cohort_index in 
(
[1],
[2],
[3],
[4],
[5],
[6],
[7],
[8],
[9],
[10],
[11],
[12],
[13]
)
