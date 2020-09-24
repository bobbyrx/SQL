SELECT NAME
FROM MOVIESTAR
WHERE GENDER LIKE 'M'
INTERSECT
SELECT STARNAME
FROM STARSIN
WHERE MOVIETITLE LIKE 'The Usual Suspects'

SELECT DISTINCT STARNAME
FROM STARSIN, MOVIE
WHERE STUDIONAME LIKE 'MGM' AND MOVIEYEAR LIKE 1995

SELECT DISTINCT NAME
FROM MOVIEEXEC, MOVIE
WHERE STUDIONAME LIKE 'MGM' AND PRODUCERC# LIKE CERT#

SELECT TITLE
FROM MOVIE
WHERE LENGTH > (SELECT LENGTH FROM MOVIE WHERE TITLE LIKE 'Star Wars')

SELECT NAME
FROM MOVIEEXEC
WHERE NETWORTH > (SELECT NETWORTH FROM MOVIEEXEC WHERE NAME LIKE 'Stephen Spielberg')

SELECT TITLE
FROM MOVIE, MOVIEEXEC
WHERE NETWORTH > (SELECT NETWORTH FROM MOVIEEXEC WHERE NAME LIKE 'Stephen Spielberg') AND PRODUCERC# LIKE CERT#
