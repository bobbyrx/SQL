SELECT DISTINCT COUNTRY
FROM CLASSES,(SELECT MAX(CLASSES.NUMGUNS)as num FROM CLASSES)as H
WHERE CLASSES.NUMGUNS=H.num

SELECT DISTINCT SHIPS.CLASS
FROM (SELECT SHIP FROM OUTCOMES WHERE RESULT='sunk')as A,SHIPS
WHERE SHIPS.NAME=A.SHIP

SELECT DISTINCT SHIPS.NAME, SHIPS.CLASS
FROM (SELECT CLASS FROM CLASSES WHERE BORE=16)as A, SHIPS
WHERE SHIPS.CLASS=A.CLASS

SELECT OUTCOMES.BATTLE
FROM (SELECT NAME FROM SHIPS WHERE SHIPS.CLASS='Kongo')as A, OUTCOMES
WHERE OUTCOMES.SHIP=A.NAME

SELECT DISTINCT SHIPS.CLASS, SHIPS.NAME
FROM SHIPS
WHERE CLASS IN (SELECT CLASS FROM CLASSES clas WHERE NUMGUNS>=ALL(SELECT NUMGUNS FROM CLASSES WHERE BORE=clas.BORE))