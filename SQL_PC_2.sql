SELECT speed, maker
FROM laptop, product
WHERE hd >= 9 and product.model LIKE laptop.model

SELECT laptop.model,price
FROM laptop,product
WHERE maker LIKE 'B' AND laptop.model=product.model
UNION
SELECT pc.model,price
FROM pc,product
WHERE maker LIKE 'B' AND pc.model=product.model

SELECT DISTINCT maker
FROM product
EXCEPT
SELECT DISTINCT maker
FROM product 
WHERE type LIKE 'PC'

SELECT hd
FROM pc
GROUP BY hd
HAVING COUNT(model)>1

SELECT DISTINCT A.model , B.model ,A.code ,B.code
FROM pc A
INNER JOIN pc B ON (A.hd=B.hd AND A.speed=B.speed AND A.model NOT LIKE B.model AND A.code>B.code) 

SELECT DISTINCT maker
FROM product
WHERE model IN(SELECT model FROM pc WHERE speed>=400 GROUP BY model HAVING COUNT(model)>1)