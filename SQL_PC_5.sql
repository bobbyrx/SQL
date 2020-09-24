SELECT AVG(speed) as AvgSpeed 
FROM pc

SELECT DISTINCT A.maker, AVG(laptop.screen) as AvgScreen
FROM (SELECT product.model, product.maker FROM product WHERE product.type='Laptop') as A, laptop
WHERE A.model=laptop.model
GROUP BY A.maker

SELECT AVG(laptop.speed)as AvgSpeed
FROM laptop
WHERE laptop.price>1000

SELECT A.maker,AVG(pc.price) as AvgPrice
FROM (SELECT model,maker FROM product WHERE maker='A') as A,pc
WHERE pc.model=A.model
GROUP BY A.maker

SELECT A.maker, AVG(B.price)as AvgPrice
FROM (SELECT product.maker, product.model FROM product WHERE product.maker='B' AND product.type NOT LIKE 'Printer')as A, (SELECT pc.model, pc.price FROM pc UNION ALL SELECT laptop.model,laptop.price FROM laptop) as B
WHERE A.model=B.model
GROUP BY A.maker

SELECT DISTINCT pc.speed,AVG(pc.price) as AvgPrice
FROM pc
GROUP BY pc.speed

SELECT DISTINCT product.maker, COUNT(pc.model)as num_product
FROM product, pc
WHERE product.type='PC' AND product.model=pc.model
GROUP BY product.maker
HAVING COUNT(DISTINCT pc.code)>=3

SELECT product.maker, B.price
FROM (SELECT pc.model, A.price FROM (SELECT MAX(pc.price) as price FROM product, pc WHERE product.model=pc.model) as A, pc WHERE A.price=pc.price) as B,product
WHERE B.model=product.model

SELECT pc.speed, AVG(pc.price)as  AvgPrice
FROM pc
GROUP BY pc.speed
HAVING pc.speed>800

SELECT AB.maker,AVG(pc.hd)as AvgHDD
FROM (SELECT product.maker, product.model FROM (SELECT A.maker FROM (SELECT * FROM product WHERE product.type NOT LIKE 'Laptop')as A GROUP BY A.maker HAVING COUNT(DISTINCT A.type)>1) as B,product WHERE product.maker=B.maker) as AB,pc
WHERE pc.model=AB.model
GROUP BY AB.maker