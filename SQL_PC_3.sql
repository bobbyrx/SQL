SELECT DISTINCT A.maker
FROM (SELECT maker,model FROM product WHERE type='PC') A, (SELECT model FROM pc WHERE speed>500) B
WHERE A.model=B.model

SELECT code, model ,price
FROM printer, (SELECT MAX(price) AS large FROM printer) A
WHERE price=A.large

SELECT laptop.*
FROM laptop, (SELECT MIN(speed) AS speed FROM pc) A
WHERE laptop.speed<A.speed

SELECT H.model, H.price
FROM (SELECT A.model, A.price FROM(SELECT model, price FROM laptop,(SELECT MAX(laptop.price) as pr FROM laptop) B WHERE laptop.price=B.pr UNION SELECT model, price FROM pc, (SELECT MAX(pc.price) as pr FROM pc) C WHERE pc.price=C.pr UNION SELECT model, price FROM printer,(SELECT MAX(printer.price) as pr FROM printer) D WHERE printer.price=D.pr) as A,(SELECT MAX(F.price) as pr FROM(SELECT model, price FROM laptop,(SELECT MAX(laptop.price) as pr FROM laptop) B WHERE laptop.price=B.pr UNION SELECT model, price FROM pc, (SELECT MAX(pc.price) as pr FROM pc) C WHERE pc.price=C.pr UNION SELECT model, price FROM printer,(SELECT MAX(printer.price) as pr FROM printer) D WHERE printer.price=D.pr) as F)as G WHERE A.price=G.pr)as H
 
 SELECT C.maker
 FROM (SELECT printer.model FROM printer,(SELECT MIN(printer.price) as pr FROM printer WHERE printer.color='y')as A WHERE printer.price=A.pr AND printer.color='y') as B,(SELECT maker, model FROM product WHERE product.type='Printer') as C
 WHERE B.model=C.model 

 SELECT DISTINCT F.maker
 FROM (SELECT B.model FROM (SELECT pc.speed, pc.model FROM pc, (SELECT MIN(pc.ram) as ram FROM pc)as A WHERE pc.ram=A.ram)as B,(SELECT MAX(C.speed) as sp FROM (SELECT pc.speed FROM pc, (SELECT MIN(pc.ram) as ram FROM pc)as A WHERE pc.ram=A.ram)as C)as D WHERE B.speed=D.sp)as H,(SELECT model, maker FROM product WHERE type='PC')as F
 WHERE H.model=F.model