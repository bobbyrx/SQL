SELECT model, speed as MHz, cd as GB
FROM pc
WHERE price < 1200

SELECT DISTINCT type 
FROM printer 

SELECT model, hd, screen
FROM laptop
WHERE price > 1000

SELECT *
FROM printer
WHERE color LIKE 'y'

SELECT model, speed, cd
FROM pc
WHERE (cd LIKE '12x' OR cd LIKE '24x') AND price < 500