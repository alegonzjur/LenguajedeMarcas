/*Ejercicio 1*/
CREATE VIEW VISTA1 AS
    SELECT numem, nomde, salar, comis
    FROM EMPLEADOS
    WHERE numde = 111
ORDER BY 1 ASC;

/*Ejercicio 2*/
CREATE VIEW VISTA2 AS 
    SELECT numde, (SUM(salar)) AS "Salario total"
    FROM EMPLEADOS
    GROUP BY D.numde
    HAVING SUM(salar)=(SELECT MAX(SUM(salar)) FROM EMPLEADOS GROUP BY numde);

/*Ejercicio 3*/
SELECT numde FROM VISTA2;

/*Ejercicio 4*/
SELECT nomem AS "Nombre Emp."
FROM VISTA1
WHERE comis IS NOT NULL
ORDER BY 1 ASC;

/*Ejercicio 5*/
INSERT INTO VISTA1 VALUES (999,'RODOLFO',999,999); /*NO SE PUEDE*/

/*Ejercicio 6*/
DELETE FROM VISTA1 WHERE numem=999;

/*Ejercicio 7*/
CREATE VIEW VISTA3 AS
    SELECT nomce, D.*
    FROM CENTROS C, DEPARTAMENTOS D
    WHERE C.numce = D.numce;

/*Ejercicio 8*/
S
