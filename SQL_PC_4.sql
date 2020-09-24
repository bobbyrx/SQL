SELECT product.maker,product.model,product.type
FROM (SELECT product.model FROM product EXCEPT SELECT DISTINCT A.model FROM (SELECT laptop.model FROM laptop UNION SELECT pc.model FROM pc UNION SELECT printer.model FROM printer) as A WHERE A.model IS NOT NULL)as B,product
WHERE product.model=B.model

SELECT A.maker
FROM (SELECT DISTINCT product.maker FROM product WHERE product.type='Laptop') as A
JOIN (SELECT DISTINCT product.maker FROM product WHERE product.type='Printer') as B ON (A.maker=B.maker)

SELECT DISTINCT laptop.hd
FROM laptop
GROUP BY laptop.hd
HAVING COUNT(DISTINCT laptop.model)>=2

SELECT DISTINCT pc.model
FROM pc
EXCEPT 
SELECT DISTINCT product.model
FROM product --taka si e !!!
