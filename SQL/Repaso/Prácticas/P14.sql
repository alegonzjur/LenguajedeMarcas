/*Ejercicio 1*/
SELECT numde, numce, max(salar)
FROM EMPLEADOS E JOIN DEPARTAMENTOS D ON E.numde = D.numde 
            JOIN CENTROS C ON D.numce = C.numce
WHERE presu < 35
GROUP BY D.nomde, nomce
ORDER BY 1 ASC; 

/*Ejercicio 2*/
SELECT D2.nomde AS "Departamento", D1.nomde AS "Dpto. del que dep.", presu AS "Presu"
FROM DEPARTAMENTOS D1 JOIN DEPARTAMENTOS D2 ON D1.numde = D2.depde
WHERE D2.depde IN (SELECT numde FROM DEPARTAMENTOS WHERE presu<30)
ORDER BY 1 ASC;

 /*Ejercicio 3*/
 SELECT nomde, avg(salar) AS "Salario medio"
 FROM EMPLEADOS E JOIN DEPARTAMENTOS D 
    ON E.numde = D.numde 
GROUP BY nomde 
HAVING avg(salar) > (SELECT avg(salar) FROM EMPLEADOS);

/*Ejercicio 4*/
SELECT nomde, COUNT(numem), SUM(salar), SUM(comis), SUM(numhi)
FROM DEPARTAMENTOS D JOIN EMPLEADOS E  
    ON E.numde = D.numde 
WHERE tidir = 'F'
GROUP By nomde;

/*Ejercicio 5*/
SELECT nomde, extel, COUNT(numem)
FROM DEPARTAMENTOS D JOIN EMPLEADOS E 
    ON D.numde = E.numde
WHERE presu > 35
GROUP BY nomde, extel;

/*Ejercicio 6*/
SELECT nomem, numhi 
FROM DEPARTAMENTOS D JOIN EMPLEADOS E 
    ON D.numde = E.numde 
WHERE tidir = 'F'
ORDER BY 1 ASC;

/*Ejercicio 7*/
SELECT nomde 
FROM DEPARTAMENTOS
WHERE numde NOT IN (SELECT numde FROM EMPLEADOS);

/*Ejercicio 8*/
INSERT INTO DEPARTAMENTOS (nomde,tidir) VALUES ('NUEVO','F');

/*Ejercicio 9*/
INSERT INTO EMPLEADOS (numem,nomem) VALUES (NULL,'NORBERTO');

/*Ejercicio 10*/
SELECT nomde 
FROM DEPARTAMENTOS
WHERE numde NOT IN (SELECT numde FROM EMPLEADOS);

/*Ejercicio 11*/
SELECT nomde 
FROM DEPARTAMENTOS D LEFT JOIN EMPLEADOS E
    ON D.numde = E.numde
WHERE numem IS NULL;

/*Ejercicio 12*/
SELECT nomde 
FROM EMPLEADOS E RIGHT JOIN DEPARTAMENTOS D
    ON D.numde = E.nUmde 
WHERE numem IS NULL;

/*Ejercicio 13*/
SELECT nomem 
FROM EMPLEADOS E LEFT JOIN DEPARTAMENTOS D 
    ON E.numde = D.numde 
WHERE E.numde IS NULL;

/*Ejercicio 14*/
SELECT nomem 
FROM DEPARTAMENTOS D RIGHT JOIN EMPLEADOS E 
    ON D.numde = E.numde 
WHERE E.numde IS NULL;

/*Ejercicio 15*/
SELECT nomde, nomem 
FROM EMPLEADOS E FULL JOIN DEPARTAMENTOS D
    ON D.numde = E.numde 
WHERE E.numde IS NULL OR D.numde IS NULL;

/*Ejercicio 16*/
SELECT nomde, nomem 
FROM DEPARTAMENTOS D INNER JOIN EMPLEADOS E
    ON E.numde = D.numde;

/*Ejercicio 17*/
SELECT nomde, nomem 
FROM DEPARTAMENTOS D INNER JOIN EMPLEADOS E
    ON E.numde = D.numde
WHERE E.numde IS NULL;

/*Ejercicio 18*/
SELECT nomem, nomde 
FROM DEPARTAMENTOS D NATURAL JOIN EMPLEADOS E;

/*Ejercicio 19*/
SELECT * FROM DEPARTAMENTOS D NATURAL JOIN EMPLEADOS E NATURAL JOIN CENTROS C;

/*Ejercicio 20*/
