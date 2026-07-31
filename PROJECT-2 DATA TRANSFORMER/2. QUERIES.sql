SELECT * FROM Customers;
SELECT * FROM Orders;

-- 1. INNER JOIN
SELECT o.OrderID, o.OrderDate, o.TotalAmount, c.CustomerID, c.FirstName, c.LastName, c.Email
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID;

-- 2. LEFT JOIN
SELECT c.CustomerID, c.FirstName, c.LastName, c.Email, o.OrderID, o.OrderDate, o.TotalAmount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;

-- 3. RIGHT JOIN
SELECT o.OrderID, o.OrderDate, o.TotalAmount, c.CustomerID, c.FirstName, c.LastName
FROM Orders o
RIGHT JOIN Customers c ON o.CustomerID = c.CustomerID;

-- 4. FULL OUTER JOIN
SELECT c.CustomerID, c.FirstName, o.OrderID, o.TotalAmount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
UNION
SELECT c.CustomerID, c.FirstName, o.OrderID, o.TotalAmount
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;

-- 5. Subquery to find customers who have placed orders worth more than the average amount
SELECT CustomerID, FirstName, LastName, Email 
FROM Customers 
WHERE CustomerID 
IN (SELECT CustomerID FROM Orders WHERE TotalAmount > (SELECT AVG(TotalAmount) FROM Orders));

-- 6. Subquery to find employees with salaries above the average salary
SELECT EmployeeID, FirstName, LastName, Department, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- 7. Extract the year and month from the OrderDate
SELECT OrderID, OrderDate,
EXTRACT(YEAR FROM OrderDate) AS OrderYear,
EXTRACT(MONTH FROM OrderDate) AS OrderMonth
FROM Orders;

-- 8. Calculate the difference in days between two dates (order date and current date)
SELECT OrderID, OrderDate, 
CURRENT_DATE AS TodayDate,
DATEDIFF(CURRENT_DATE, OrderDate) AS DaysDifference
FROM Orders;

-- 9. Format the OrderDate to a more readable format (e.g., 'DD-MMM-YYYY')
SELECT OrderID, OrderDate,
DATE_FORMAT(OrderDate, '%d-%m-%Y') AS FormattedDate
FROM Orders;

-- 10. Concatenate FirstName and LastName to form a full name
SELECT CustomerID, CONCAT(FirstName, " ", LastName) AS FullName FROM Customers;

-- 11. Replace part of a string (e.g., replace 'John' with 'Jonathan')
SELECT CustomerID, FirstName,
REPLACE (FirstName, 'John', 'Jonathan') AS UpdatedFirstName
FROM Customers;

-- 12. Convert FirstName to uppercase and LastName to lowercase
SELECT CustomerID,
UPPER(FirstName) AS UpperFirstName,
LOWER(LastName) AS LowerLastName
FROM Customers;

-- 13. Trim extra spaces from the Email field
SELECT CustomerID,
TRIM(Email) AS TrimmedEmail
FROM Customers;

-- 14. Calculate the running total of TotalAmount for each order
SELECT OrderID, CustomerID, OrderDate, TotalAmount,
SUM(TotalAmount) 
OVER (ORDER BY OrderDate, OrderID) AS RunningTotal
FROM Orders;

-- 15. Rank orders based on TotalAmount using the RANK() function
SELECT OrderID, CustomerID, TotalAmount,
RANK() OVER (ORDER BY TotalAmount DESC) AS OrderRank
FROM Orders;

-- 16. Assign a discount based on TotalAmount in orders (> 1000: 10% off, > 500: 5% off)
SELECT OrderID, TotalAmount,
    CASE 
        WHEN TotalAmount > 1000 THEN '10% Off'
        WHEN TotalAmount > 500 THEN '5% Off'
        ELSE 'No Discount'
    END AS Discount
FROM Orders;

-- 17. Categorize employees' salaries as high, medium, or low
SELECT EmployeeID, FirstName, LastName, Salary,
    CASE 
        WHEN Salary >= 70000 THEN 'High'
        WHEN Salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryCategory
FROM Employees;