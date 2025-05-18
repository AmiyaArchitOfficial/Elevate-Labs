CREATE DATABASE superstore;
USE superstore;
CREATE TABLE Orders (
    Order_ID VARCHAR(20),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(20),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Postal_Code VARCHAR(20),
    Region VARCHAR(50),
    Product_ID VARCHAR(20),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(255),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(10,2)
);
-- Total Sales per Region
SELECT Region, SUM(Sales) AS Total_Sales
FROM Orders
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Orders with high profit
SELECT Order_ID, Customer_Name, Profit
FROM Orders
WHERE Profit > 500
ORDER BY Profit DESC;
CREATE TABLE Customers (
    Customer_ID VARCHAR(20) PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    Region VARCHAR(50)
);
SELECT o.Order_ID, c.Customer_Name, o.Sales
FROM Orders o
INNER JOIN Customers c ON o.Customer_ID = c.Customer_ID;
SELECT c.Customer_Name, o.Order_ID
FROM Customers c
LEFT JOIN Orders o ON c.Customer_ID = o.Customer_ID;
SELECT o.Order_ID, c.Customer_Name
FROM Orders o
RIGHT JOIN Customers c ON o.Customer_ID = c.Customer_ID;
-- Orders with above average sales
SELECT Order_ID, Sales
FROM Orders
WHERE Sales > (
    SELECT AVG(Sales) FROM Orders
);
-- Average Sales and Profit per Category
SELECT Category, AVG(Sales) AS Avg_Sales, AVG(Profit) AS Avg_Profit
FROM Orders
GROUP BY Category;
-- View for Region-wise Sales Summary
CREATE VIEW Region_Sales AS
SELECT Region, SUM(Sales) AS Total_Sales, SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY Region;

-- Usage
SELECT * FROM Region_Sales;
-- Add indexes to speed up queries
CREATE INDEX idx_customer_id ON Orders(Customer_ID);
CREATE INDEX idx_order_date ON Orders(Order_Date);
CREATE INDEX idx_region ON Orders(Region);

