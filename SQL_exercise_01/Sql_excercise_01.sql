-- 1.1
select name
from products;

-- 1.2 
SELECT Name, Price
FROM products;

-- 1.3 
SELECT Name, Price 
FROM products 
WHERE price <= 200;

-- 1.4
SELECT *
FROM products 
WHERE price BETWEEN 60 AND 120;
-- 1.5
SELECT Name, (Price *100)
FROM products ;
-- 1.6 
SELECT AVG(Price)
FROM products ;
-- 1.7
SELECT AVG(Price)
FROM products
WHERE manufacturer = 2;

-- 1.8 
SELECT COUNT(*)
FROM products
WHERE Price >= 180;

-- 1.9 
SELECT Name, Price 
FROM products
WHERE Price >= 180 
ORDER BY Price DESC, Name ASC;

-- 1.10
SELECT p.*,m.name
FROM products AS p
INNER JOIN manufacturers AS m on p.Manufacturer = m.code;

-- 1.11
SELECT p.Name, p.Price, m.name
FROM products AS p
INNER JOIN manufacturers AS m on p.Manufacturer = m.code;

-- 1.12 
SELECT  p.Manufacturer, AVG(p.Price)
FROM products AS p
INNER JOIN manufacturers AS m on p.Manufacturer = m.code
GROUP BY p.Manufacturer;

-- 1.13
SELECT  m.Name, AVG(p.Price)
FROM products AS p
INNER JOIN manufacturers AS m on p.Manufacturer = m.code
GROUP BY m.Name;

-- 1.14
SELECT AVG(p.Price) , m.Name
FROM products AS p
INNER JOIN manufacturers AS m on p.Manufacturer = m.code
GROUP BY m.Name
HAVING AVG(p.Price) >= 150;

-- 1.15
SELECT  Name, Price
FROM products AS p
ORDER BY p.Price ASC
LIMIT 1 ;

-- 1.16
select max_price_mapping.name as manu_name, max_price_mapping.price, products_with_manu_name.name as product_name
from 
    (SELECT Manufacturers.Name, MAX(Price) price
     FROM Products, Manufacturers
     WHERE Manufacturer = Manufacturers.Code
     GROUP BY Manufacturers.Name)
     as max_price_mapping
   left join
     (select products.*, manufacturers.name manu_name
      from products join manufacturers
      on (products.manufacturer = manufacturers.code))
      as products_with_manu_name
 on
   (max_price_mapping.name = products_with_manu_name.manu_name
    and
    max_price_mapping.price = products_with_manu_name.price);

-- 1.17
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(11,'Loudspeakers',70,2);

-- 1.18 
UPDATE products SET Name = 'Laser Printer' WHERE code = 8;

-- 1.19 
ALTER TABLE products
MODIFY COLUMN Price DECIMAL(10, 2);

UPDATE products
SET Price = Price * 0.90
WHERE code > 0;

-- 1.20

UPDATE products SET Price = Price * 0.90 WHERE Price >= 120;


SELECT *
FROM products
