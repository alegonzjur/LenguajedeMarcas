/*Ejercicio 1*/
SELECT nomem, salar*1.01
FROM EMPLEADOS
WHERE numde = 100 AND TRUNC((fecin-fecna)/365) > 20
ORDER BY 1 DESC;

/*Ejercicio 2*/
SELECT numce, AVG(presu)
FROM CENTROS 
GROUP BY numce;

/*Ejercicio 3*/
SELECT nomem, TRUNC((SYSDATE-fecna)/365) AS "EDAD"
FROM EMPLEADOS E JOIN DEPARTAMENTOS D ON D.numde = E.numde 
WHERE D.nomde = 'PERSONAL';

/*Ejercicio 4*/
SELECT dirce, nomde 
FROM CENTROS C JOIN DEPARTAMENTOS D ON C.numce = D.numce 
                JOIN EMPLEADOS E ON D.numde = E.numde 
WHERE numhi > 3;

/*Ejercicio 5*/
SELECT dirce, nomde 
FROM CENTROS C JOIN DEPARTAMENTOS D ON C.numce = D.numce
                JOIN EMPLEADOS E ON D.numde = E.numde
WHERE EXISTS (SELECT * FROM EMPLEADOS WHERE numhi>3);

/*Ejercicio 6*/
SELECT numhi AS "Nº Hijos", COUNT(nomem) AS "Nº Empleados"
FROM EMPLEADOS
GROUP BY numhi
ORDER BY 1 ASC;

/*Ejercicio 7*/
CREATE VIEW SINCOMISION AS
    SELECT nomem AS "Nombre", TRUNC((SYSDATE-fecna)/365) AS "Edad Actual", salar || ' €' AS "Salario"
    FROM EMPLEADOS
    WHERE comis IS NULL;

/*Ejercicio 8*/
SELECT AVG(Salario) AS "Media comision" FROM SINCOMISION;

/*Ejercicio 9*/
SELECT nomde AS "Nombre depart.", MAX(salar) AS "Salario máx."
FROM DEPARTAMENTOS D JOIN EMPLEADOS E ON D.numde = E.numde 
GROUP BY nomde
HAVING MAX(salar) <= 2000;

/*Ejercicio 10*/
CREATE VIEW JUBILACION AS
    SELECT nomem AS "Nombreemp.", nomde AS "Dpto en el que trab.", TRUNC((SYSDATE-fecna)/365) AS "Edadactual", salar AS "Salario"
    FROM EMPLEADOS E JOIN DEPARTAMENTOS D ON E.numde = D.numde
    WHERE TRUNC((SYSDATE-fecna)/365) >= 60;

/*Ejercicio 11*/
SELECT Nombre emp
FROM JUBILACION
WHERE Edadactual = 60;

/*Ejercicio 12*/
SELECT dirce, nomem, nomde, direc 
FROM EMPLEADOS E JOIN DEPARTAMENTOS D ON D.numde = E.numde  
                JOIN CENTROS C ON D.numce = C.numce 
WHERE nomem LIKE 'J%';
     
