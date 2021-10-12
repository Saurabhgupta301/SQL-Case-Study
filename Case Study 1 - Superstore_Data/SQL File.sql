# (1) Find the Maximum Quantity Sold in a Transaction and count them also.

SELECT max(Quantity) , count(*)
FROM tr_orderdetails;

# (2) Find the Unique Products in All the Transactions. 

SELECT DISTINCT(ProductName)
FROM tr_products;

# (3) Find those products which are sold maximum of 3 in all of them.

SELECT DISTINCT
ProductID , Quantity
FROM tr_orderdetails
WHERE Quantity = 3
ORDER BY ProductID ASC , Quantity DESC;

# (4) How many UNIQUE Properties are available in the data.

SELECT DISTINCT 
PropertyID
FROM tr_orderdetails;

# (5) Find the Product Categories that has Maximum Products.

SELECT ProductCategory ,
count(*) as COUNT
FROM tr_products
GROUP BY ProductCategory
ORDER BY COUNT DESC;            # We can use 2 inplace of COUNT to select the column to order.

# (6) Find the State where most stores are present.

SELECT PropertyState,
count(*) as COUNT
FROM tr_propertyinfo
GROUP BY PropertyState
ORDER BY 2 DESC;

# (7) Find the Top 5 Product IDs that did Maximum Sales in terms of Quantity.

SELECT ProductID,
SUM(Quantity) AS Total_Quantity
FROM tr_orderdetails
GROUP BY ProductID
ORDER BY 2 DESC
LIMIT 5;

# (8) Similarly, Find the Top 5 Property IDs that did Maximum Quantity.

SELECT PropertyID,
SUM(Quantity) AS Total_Quantity
FROM tr_orderdetails
GROUP BY PropertyID
ORDER BY 2 DESC
LIMIT 5;

# (9) Find the Top 5 Product Names that did Maximum Sales in terms of Quantity 

SELECT p.ProductName 
, SUM(o.Quantity) AS Total_Quantity 
FROM tr_orderdetails AS o
LEFT JOIN tr_products AS p ON o.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY Total_Quantity DESC
LIMIT 5 ;

# (9) Find the Top 5 Products that did Maximum Sales

SELECT p.ProductName 
, SUM(o.Quantity * p.Price) AS Sales 
FROM tr_orderdetails AS o
LEFT JOIN tr_products AS p ON o.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY 2 DESC
LIMIT 5 ; 

# (10) Find the Top 5 City that did Maximum Sales

SELECT pi.PropertyCity 
, SUM(o.Quantity * p.Price) AS Sales 
FROM tr_orderdetails AS o
LEFT JOIN tr_products AS p ON o.ProductID = p.ProductID
LEFT JOIN tr_propertyinfo as pi ON o.PropertyID = pi. `Prop ID`
GROUP BY pi.PropertyCity
ORDER BY 2 DESC
LIMIT 5 ; 

# (11) Find the Top 5 Products in each of the Cities.

SELECT pi.PropertyCity 
, p.ProductName
, SUM(o.Quantity * p.Price) AS Sales 
FROM tr_orderdetails AS o
LEFT JOIN tr_products AS p ON o.ProductID = p.ProductID
LEFT JOIN tr_propertyinfo as pi ON o.PropertyID = pi. `Prop ID`
GROUP BY pi.PropertyCity , p.ProductName
ORDER BY 3 DESC
LIMIT 5 ;

# (12) Find out the Top 5 Products in the Arlington City. 

SELECT pi.PropertyCity 
, p.ProductName
, SUM(o.Quantity * p.Price) AS Sales 
FROM tr_orderdetails AS o
LEFT JOIN tr_products AS p ON o.ProductID = p.ProductID
LEFT JOIN tr_propertyinfo as pi ON o.PropertyID = pi. `Prop ID`
WHERE pi.PropertyCity = 'Arlington'
GROUP BY pi.PropertyCity , p.ProductName
ORDER BY 3 DESC
LIMIT 5 ;
