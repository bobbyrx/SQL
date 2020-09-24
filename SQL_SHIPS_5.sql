SELECT COUNT(DISTINCT CLASSES.CLASS)as NO_CLASSES
FROM CLASSES
WHERE CLASSES.TYPE='bb'

SELECT CLASSES.CLASS, AVG(CLASSES.NUMGUNS) as avgGUNS
FROM CLASSES
WHERE CLASSES.TYPE='bb'
GROUP BY CLASSES.CLASS

SELECT AVG(CLASSES.NUMGUNS)as avgGUNS
FROM CLASSES

SELECT CLASSES.CLASS, MIN(SHIPS.LAUNCHED) as FirstYear, MAX(SHIPS.LAUNCHED) as LastYear
FROM CLASSES, SHIPS
WHERE CLASSES.CLASS=SHIPS.CLASS
GROUP BY CLASSES.CLASS

SELECT CLASSES.CLASS, COUNT(OUTCOMES.RESULT) No_sunk
FROM CLASSES,SHIPS, OUTCOMES
WHERE CLASSES.CLASS=SHIPS.CLASS AND SHIPS.NAME=OUTCOMES.SHIP AND OUTCOMES.RESULT='sunk'
GROUP BY CLASSES.CLASS

SELECT DISTINCT SHIPS.CLASS, COUNT(OUTCOMES.RESULT) as No_sunk
FROM (SELECT CLASSES.CLASS FROM CLASSES,SHIPS WHERE CLASSES.CLASS=SHIPS.CLASS GROUP BY CLASSES.CLASS HAVING COUNT(DISTINCT SHIPS.NAME)>2) as B,SHIPS,OUTCOMES
WHERE SHIPS.CLASS=B.CLASS AND SHIPS.NAME=OUTCOMES.SHIP AND OUTCOMES.RESULT='sunk'
GROUP BY SHIPS.CLASS

SELECT CLASSES.COUNTRY, AVG(CLASSES.BORE) avg_bore
FROM CLASSES,SHIPS
WHERE CLASSES.CLASS=SHIPS.CLASS
GROUP BY CLASSES.COUNTRY
