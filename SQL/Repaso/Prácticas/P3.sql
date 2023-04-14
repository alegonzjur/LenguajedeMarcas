/*Ejercicio 1*/
SELECT 'DEPARTAMENTO DE ' || nomde AS "Nombre"
FROM DEPARTAMENTOS 
WHERE presu < 30
ORDER BY nomde ASC;

/*Ejercicio 2*/
SELECT numde ||'-'|| nomde AS "Numero-nombre",
tidir AS "T"
FROM DEPARTAMENTOS
WHERE presu < 30
ORDER BY 1 ASC;

/*Ejercicio 3*/
SELECT nomem AS "Nombre",
    12*salar AS "Salario 2014",
    12*1.02*salar AS "Salario 2015",
    12*1.02*1.02*salar AS "Salario 2016"
FROM EMPLEADOS
WHERE numhi>4
ORDER BY 1;

/*Ejercico 4*/
SELECT nomem
FROM EMPLEADOS 
WHERE salar+(120*numhi) > 1.20*salar
ORDER BY nomem ASC;

/*Ejercicio 5*/
SELECT nomem AS "Nombre",
salar+comis AS "Salario total"
FROM EMPLEADOS
WHERE numde=112
ORDER BY 2 DESC, 1;

/*Ejercicio 6*/
SELECT nomem AS "Nombre",
salar+comis AS "Salario total"
FROM EMPLEADOS
WHERE numde=112 AND comis IS NOT NULL
ORDER BY 2 DESC, 1;

/*Ejercicio 7*/
SELECT nomem AS "Nombre",
salar+comis || '€' AS "Salario total"
FROM EMPLEADOS
WHERE numde=112 AND comis IS NOT NULL
ORDER BY 2 DESC, 1;

/*Ejercicio 8*/
SELECT nomem AS "Nombre",
salar+60*(numhi-3) || ' €' AS "Salario total"
FROM EMPLEADOS
WHERE numhi >= 4
ORDER BY 1 ASC;

/*Ejercicio 9*/
SELECT nomem AS "Nombre",
salar+60*(numhi-3) || ' €' AS "Salario total"
FROM EMPLEADOS
WHERE numhi >= (SELECT numhi FROM EMPLEADOS WHERE nomem='JULIANA')
ORDER BY 1 ASC;

/*Ejercicio 10*/
SELECT nomem
FROM EMPLEADOS
WHERE salar >= 1.15*(SELECT salar FROM EMPLEADOS WHERE nomem='CLAUDIA')
ORDER BY 1 ASC;

/*Ejercicio 11*/
SELECT nomde 
FROM DEPARTAMENTOS 
WHERE depde IS NULL;