-- Write a Query that display the individual tables.
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;

-- Write a statement that list all customers along with their ID, Name & Segment. 
SELECT [Customer_ID], [Customer_Name], [Segment]
FROM [dbo].[Customer];

-- Write a statement that lists the Name, Product ID, Category & SubCategory of each product. 
SELECT [Product_Name], [Product_ID], [Category], [Sub_Category]
FROM [dbo].[Product];

--  Write a query that displays all the columns of all product who have the category “Furniture”. 
SELECT *
FROM [dbo].[Product]
WHERE [Category] = 'Furniture';

-- Write a query that displays the Product name, and ID of each product with the Name starting with “Boston”. 
SELECT [Product_Name], [Product_ID]
FROM [dbo].[Product]
WHERE [Product_Name] LIKE 'Boston%';

--  Write a query that displays the Product name, and ID of each product with the Name having “Collection”.
SELECT [Product_Name], [Product_ID]
FROM [dbo].[Product]
WHERE [Product_Name] LIKE '%Collection%';

-- Write the query that displays all orders made during the month of March 2014. 
SELECT * 
FROM [dbo].[Order]
WHERE [Order_Date] LIKE '2014-03-%';

-- Write the query that displays all orders the were not made during the month of March 2014 but shipped between 5th and 30th of March 2014.
SELECT * 
FROM [dbo].[Order]
WHERE [Order_Date] LIKE '2014-03-%'
AND ([Ship_Date] >= '2014-03-05' AND [Ship_Date] <= '2014-03-30');

-- Join the Order table to the Customer table on the Customer ID column. Display all columns from both tables.
SELECT *
FROM [dbo].[Order]
JOIN [dbo].[Customer]
ON [dbo].[Order].[Customer_ID] = [dbo].[Customer].[Customer_ID];

/*  
Join the Order table to the Customer, Product, & Region tables on the 
basis that the CustomerID column in the Order table matches the 
CustomerID column in the Customer table, the ProductID column in the 
Product table matches the ProductID column in the Order table, the 
Postalcode column in the Region table matches the Postalcode column in 
the Order Table.
*/

SELECT *
FROM [dbo].[Order]
JOIN [dbo].[Customer]
ON [dbo].[Order].[Customer_ID] = [dbo].[Customer].[Customer_ID]
JOIN [dbo].[Product] 
ON [dbo].[Product].[Product_ID] = [dbo].[Order].[Product_ID]
JOIN [dbo].[Region]
ON [dbo].[Region].[Postal_Code] = [dbo].[Order].[Postal_Code];