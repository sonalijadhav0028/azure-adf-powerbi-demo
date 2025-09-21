CREATE PROCEDURE dbo.sp_transform_sales
AS
BEGIN
  SET NOCOUNT ON;

  TRUNCATE TABLE dbo.sales_clean;

  INSERT INTO dbo.sales_clean (OrderID, OrderDate, Customer, Product, Quantity, UnitPrice, TotalAmount, Region)
  SELECT
    TRY_CAST(OrderID AS INT),
    TRY_CONVERT(DATE, OrderDate, 23),
    LTRIM(RTRIM(Customer)),
    LTRIM(RTRIM(Product)),
    TRY_CAST(Quantity AS INT),
    TRY_CAST(UnitPrice AS DECIMAL(10,2)),
    TRY_CAST(Quantity AS DECIMAL(12,2)) * TRY_CAST(UnitPrice AS DECIMAL(12,2)),
    LTRIM(RTRIM(Region))
  FROM dbo.sales_raw;
END;
