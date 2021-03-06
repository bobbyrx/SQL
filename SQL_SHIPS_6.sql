SELECT DISTINCT OUTCOMES.SHIP
FROM OUTCOMES
WHERE OUTCOMES.SHIP LIKE 'C%' OR OUTCOMES.SHIP LIKE 'K%'

SELECT DISTINCT B.NAME, A.COUNTRY 
FROM (SELECT CLASSES.CLASS, CLASSES.COUNTRY FROM CLASSES)as A, (SELECT SHIPS.CLASS, SHIPS.NAME FROM SHIPS)as B
WHERE A.CLASS=B.CLASS
EXCEPT
SELECT DISTINCT AB.NAME, AB.COUNTRY
FROM (SELECT DISTINCT B.NAME, A.COUNTRY FROM (SELECT CLASSES.CLASS, CLASSES.COUNTRY FROM CLASSES)as A, (SELECT SHIPS.CLASS, SHIPS.NAME FROM SHIPS)as B WHERE A.CLASS=B.CLASS) as AB, OUTCOMES
WHERE OUTCOMES.RESULT='sunk' AND OUTCOMES.SHIP=AB.NAME

SELECT DISTINCT B.COUNTRY, COUNT(AB.SHIP) as ships
FROM (SELECT DISTINCT A.COUNTRY, Ships.NAME FROM (SELECT COUNTRY, CLASSES.CLASS FROM CLASSES)as A FULL JOIN SHIPS ON (SHIPS.CLASS=A.CLASS))as B
FULL JOIN (SELECT * FROM OUTCOMES WHERE OUTCOMES.RESULT='sunk')as AB ON (AB.SHIP=B.NAME)
GROUP BY B.COUNTRY

SELECT A.BATTLE
FROM (SELECT OUTCOMES.BATTLE,COUNT(DISTINCT OUTCOMES.SHIP) as ships FROM OUTCOMES GROUP BY OUTCOMES.BATTLE)as A ,(SELECT OUTCOMES.BATTLE,COUNT(DISTINCT OUTCOMES.SHIP) as ships FROM OUTCOMES WHERE OUTCOMES.BATTLE='Guadalcanal' GROUP BY OUTCOMES.BATTLE)as B 
WHERE A.ships>B.ships

SELECT C.BATTLE, C.country
FROM (SELECT DISTINCT OUTCOMES.BATTLE, COUNT(AB.COUNTRY) as country
FROM (SELECT DISTINCT A.NAME, B.COUNTRY FROM (SELECT CLASS, SHIPS.NAME FROM SHIPS)as A JOIN (SELECT CLASSES.CLASS, CLASSES.COUNTRY FROM CLASSES)as B ON(B.CLASS=A.CLASS))as AB JOIN OUTCOMES ON (AB.NAME=OUTCOMES.SHIP)
GROUP BY OUTCOMES.BATTLE)as C, (SELECT DISTINCT OUTCOMES.BATTLE, COUNT(AB.COUNTRY) as country
FROM (SELECT DISTINCT A.NAME, B.COUNTRY FROM (SELECT CLASS, SHIPS.NAME FROM SHIPS)as A JOIN (SELECT CLASSES.CLASS, CLASSES.COUNTRY FROM CLASSES)as B ON(B.CLASS=A.CLASS))as AB JOIN OUTCOMES ON (AB.NAME=OUTCOMES.SHIP)
WHERE OUTCOMES.BATTLE='Surigao Strait'
GROUP BY OUTCOMES.BATTLE) as D
WHERE C.country>D.country

SELECT DISTINCT A.NAME, AB.DISPLACEMENT, AB.NUMGUNS
FROM (SELECT SHIPS.CLASS, SHIPS.NAME FROM SHIPS)as A JOIN (SELECT* FROM(SELECT * FROM CLASSES,(SELECT MIN(CLASSES.DISPLACEMENT)as min FROM CLASSES)as B WHERE CLASSES.DISPLACEMENT=B.min)as D,(SELECT MAX(CD.NUMGUNS)as max FROM (SELECT * FROM CLASSES,(SELECT MIN(CLASSES.DISPLACEMENT)as min FROM CLASSES)as B WHERE CLASSES.DISPLACEMENT=B.min)as CD)as C WHERE D.NUMGUNS=C.max)as AB ON(AB.CLASS=A.CLASS)

SELECT COUNT(A.SHIP)as ship
FROM (SELECT* FROM OUTCOMES WHERE RESULT='damaged')as A, (SELECT * FROM OUTCOMES WHERE RESULT='ok')as B
WHERE A.SHIP=B.SHIP

SELECT A.SHIP
FROM (SELECT* FROM OUTCOMES WHERE RESULT='damaged')as A, (SELECT * FROM OUTCOMES WHERE RESULT='ok')as B
WHERE A.SHIP=B.SHIP