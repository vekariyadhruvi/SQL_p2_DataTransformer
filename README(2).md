# Corporate Database System (SQL Project)

## Overview

This project is a simple Corporate Database Management System built
using SQL. It demonstrates relational tables, data insertion, and
queries like joins and subqueries.

## Database Name

pr_corporate_das

## Tables Included

### Customers

-   CustomerID (Primary Key)
-   FirstName
-   LastName
-   Email (Unique)
-   RegistrationDate

### Orders

-   OrderID (Primary Key)
-   CustomerID (Foreign Key)
-   OrderDate
-   TotalAmount

Relationship: One Customer → Many Orders (via CustomerID)

## Features

-   Table creation with constraints (PK, FK, NOT NULL, UNIQUE)
-   Data insertion
-   Queries:
    -   SELECT
    -   INNER JOIN
    -   LEFT JOIN
    -   RIGHT JOIN
    -   FULL OUTER JOIN (using UNION)
    -   Subqueries

## How to Run

1.  Run: 1. TABLES.sql
2.  Run: 2. QUERIES.sql
3.  View results

## Purpose

-   DBMS practical learning
-   SQL query practice
-   Exam and viva preparation

## Author

Your Name

## Notes

MySQL does not support FULL OUTER JOIN directly, so UNION is used.
