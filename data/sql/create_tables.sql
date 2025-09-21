CREATE TABLE dbo.sales_raw (
  OrderID INT,
  OrderDate VARCHAR(50),
  Customer NVARCHAR(200),
  Product NVARCHAR(200),
  Quantity INT,
  UnitPrice DECIMAL(10,2),
  Region NVARCHAR(100)
);

CREATE TABLE dbo.sales_clean (
  OrderID INT PRIMARY KEY,
  OrderDate DATE,
  Customer NVARCHAR(200),
  Product NVARCHAR(200),
  Quantity INT,
  UnitPrice DECIMAL(10,2),
  TotalAmount DECIMAL(12,2),
  Region NVARCHAR(100)
);
