##Sample Superstore Analysis using MySQL

##Project Structure:
- Database: superstore
  
- Main Tables:

- Orders: Contains sales transaction data

- Customers: Contains basic customer details (added manually for JOIN examples)

- SQL Script: Sample-Superstore Analysis.sql includes all database setup and queries.

  ##How to Run:
  - Open MySQL Workbench
- Run the SQL file: Sample-Superstore Analysis.sql
- Ensure Orders.csv is imported correctly into the Orders table before running analytics queries.

  ##SQL Features Demonstrated:
  #Basic Queries:
  - SELECT Region, SUM(Sales) AS Total_Sales
FROM Orders
GROUP BY Region
ORDER BY Total_Sales DESC;

#WHERE Clause:
- SELECT Order_ID, Customer_Name, Profit
FROM Orders
WHERE Profit > 500
ORDER BY Profit DESC;

#JOINS:
- INNER JOIN to combine Orders and CustomersER JOIN to combine Orders and Customers
- LEFT JOIN and RIGHT JOIN for completeness

#Subqueries:
- SELECT Order_ID, Sales
FROM Orders
WHERE Sales > (SELECT AVG(Sales) FROM Orders);

#Aggregate Functions:
- SELECT Category, AVG(Sales), AVG(Profit)
FROM Orders
GROUP BY Category;

#Views:
- CREATE VIEW Region_Sales AS
SELECT Region, SUM(Sales), SUM(Profit)
FROM Orders
GROUP BY Region;

#Indexes for Performance:
- CREATE INDEX idx_customer_id ON Orders(Customer_ID);
CREATE INDEX idx_order_date ON Orders(Order_Date);
CREATE INDEX idx_region ON Orders(Region);

##Sample Use Cases:
- Analyze region-wise or category-wise performance
- Identify high-profit orders
- Improve performance with indexing
- Create reusable SQL views for reporting

##Technologies Used:
- MySQL Workbench
