USE Miniamazon
GO

/*
** Showing all the employees of MiniAmazon
*/
SELECT * from Employees
GO

/*
** Showing all categories of MiniAmazon
*/
SELECT * from Categories
GO

/*
** Showing all Customers of MiniAmazon
*/
SELECT * from Customers
GO

/*
** Showing all orders of MiniAmazon
*/
SELECT * from Orders
GO


/*
** Showing all orders details of MiniAmazon
*/
SELECT * from "Order Details"
GO


/*
** Showing all products of MiniAmazon
*/
SELECT * from Products
GO

/*
** Showing all shippers of MiniAmazon
*/
SELECT * from Shippers
GO

/*
** Showing all suppliers of MiniAmazon
*/
SELECT * from Suppliers
GO

/*
** Showing total number of orders in MiniAmazon - aggregate 
*/
SELECT count(*) AS TotalOrders
FROM Orders
GO

/*
** Return all customers with orders - Order number should be > 0 - Inner join
*/
SELECT Customers.ContactName, Orders.OrderID
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID=Orders.CustomerID
GO

/*
** Return all customers, and any orders. Orders can 0 or more - LEFT OUTER JOIN
*/
SELECT Customers.ContactName, Orders.OrderID
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID=Orders.CustomerID
GO

/*
** Subquery - Selecting only customers with name starting with a
*/
SELECT * FROM Customers
WHERE ContactName IN (
SELECT Customers.ContactName from Customers
WHERE Customers.ContactName like 'a%'
)
GO