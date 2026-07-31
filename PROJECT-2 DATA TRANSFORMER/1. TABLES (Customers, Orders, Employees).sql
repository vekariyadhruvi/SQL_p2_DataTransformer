CREATE DATABASE pr_corporate_das;

CREATE TABLE Customers(
CustomerID INT PRIMARY KEY,
FirstName VARCHAR(100) NOT NULL,
LastName VARCHAR(100) NOT NULL,
Email VARCHAR(200) NOT NULL UNIQUE,
RegistrationDate DATE NOT NULL
);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, RegistrationDate) VALUES
(1, 'John', 'Doe', "john.doe@email.com", "2022-03-15"),
(2, 'Jane', 'Smith', "jane.smith@email.com", "2021-11-02"),
(3, 'Alex', 'Taylor', 'alex.taylor@email.com', '2023-01-10'),
(4, 'Emily', 'Brown', 'emily.brown@email.com', '2023-05-22'),
(5, 'Michael', 'Davis', 'michael.davis@email.com', '2023-08-14');

CREATE TABLE Orders(
OrderID INT PRIMARY KEY,
CustomerID INT NOT NULL,
OrderDate DATE NOT NULL,
TotalAmount DECIMAL(10,2) NOT NULL,
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES 
(101, 1, '2023-07-01', 150.50),
(102, 2, '2023-07-03', 200.75),
(103, 1, '2023-08-10', 450.00),
(104, 3, '2023-08-12', 89.99),
(105, 2, '2023-09-01', 310.20),
(106, 4, '2023-09-15', 75.50);

CREATE TABLE Employees(
EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Department VARCHAR(50) NOT NULL,
HireDate DATE NOT NULL,
Salary DECIMAL(10, 2) NOT NULL
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, HireDate, Salary) VALUES 
(1, 'Mark', 'Johnson', 'Sales', '2020-01-15', 50000.00),
(2, 'Susan', 'Lee', 'HR', '2021-03-20', 55000.00),
(3, 'Robert', 'Wilson', 'Sales', '2019-06-11', 62000.00),
(4, 'Jessica', 'Garcia', 'IT', '2022-02-01', 75000.00),
(5, 'David', 'Miller', 'IT', '2021-08-15', 71000.00);