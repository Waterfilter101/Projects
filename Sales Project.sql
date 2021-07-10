-- As we are working with 2020 data, the current year would be noted as 2020

--1) A list of all our products that are from this year?
SELECT 
Englishproductname as Product_Name,
isnull(EnglishDescription,'N/A') as Product_Description,
StartDate
FROM DimProduct
Where startdate >='2020-01-01 00:00:00' AND Status = 'Current'
Order by product_name ASC;

-- 2) How many products were started this year vs last year with the product name, model, description?

SELECT 
englishproductname,
modelname,
englishdescription,
year(startdate)
FROM dimproduct
WHERE year(startdate) in ('2020','2019');

SELECT
year(startdate) as Start_year,
count(productkey) as number_products
FROM dimproduct
GROUP by year(startdate);

-- 3) Which of those products have the highest profitability
SELECT 
englishproductname as Product,
ListPrice,
DealerPrice,
ListPrice - DealerPrice as Margin,
(100 * ((ListPrice - DealerPrice)/DealerPrice)) as Percentage_Margin
year(startdate)
FROM dimproduct
WHERE year(startdate) in ('2020','2019');

