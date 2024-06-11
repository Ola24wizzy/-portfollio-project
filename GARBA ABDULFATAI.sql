1. retrieve all TAX RATES:

select  Name, TaxRate
from [Sales].[SalesTaxRate]

2. find tax rate for retail transactions:

select name, taxrate
from [Sales].[SalesTaxRate]
where taxtype = 1;

3. find tax rate for wholesale transactions:

select name, taxrate
from[Sales].[SalesTaxRate]
where taxtype = 2;

4. calculate total sales tax amount for each oredr:

select soh.salesorderID, sum(sod.linetotal)
 as totalsalestax
from sales.SalesOrderHeader soh
inner join sales.SalesOrderDetail sod on
soh.SalesOrderID = sod.SalesOrderID
GROUP BY soh.SalesOrderID;

5. identify tax rate name:

select name 
from [Sales].[SalesTaxRate]

6. find tax rate for all sales transactions:


select name
from [Sales].[SalesTaxRate]
where taxtype = 3;

7. retrieve tax rates with non-zero amount:

select name
from [Sales].[SalesTaxRate]
where TaxRate > 0.0;

8. calculate total sales tax amount for reach customer:

select c.CustomerID, sum(sod.linetotal)
as totalsalestax
FROM sales.customer c
inner join sales.SalesOrderHeader soh on
c.CustomerID = soh.CustomerID
inner join sales.SalesOrderDetail sod on 
soh.SalesOrderID = sod.SalesOrderID
inner join [Sales].[SalesTaxRate] STR ON
soh.TaxAmt = str.TaxRate
GROUP BY C.CustomerID;

9. Find tax rate for a specific territory:

select name as territoryname 
from Sales.SalesTerritory
where name = 'soutwest';

10. find the highest tax rate:

select MAX(taxrate) as highesttaxrate
from [Sales].[SalesTaxRate];

11. average tax rate

select avg(taxrate) AS highesttacrate
from [Sales].[SalesTaxRate];

12. filter by state or province:

select salestaxrateid,name, taxrate
from [Sales].[SalesTaxRate]
where StateProvinceID =1; -- replace 1 with thr desired state/province id 

13. tax rate range.

select name, taxrate
from [Sales].[SalesTaxRate]
where TaxRate between 7.00 and 7.25;

14. order by tax rate (ascending):

select name, taxrate
from [Sales].[SalesTaxRate]
order by TaxRate asc;

15. total number of tax rates:

select count(*) as totaltaxrates
from [Sales].[SalesTaxRate]
