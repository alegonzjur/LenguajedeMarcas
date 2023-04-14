/*Ejercicio 1*/
SELECT nomde
FROM DEPARTAMENTOS
WHERE tidir='F'
ORDER BY nomde ASC;

/*Ejercicio 2*/
SELECT nomem, numem, extel
FROM EMPLEADOS
WHERE numde=121
ORDER BY nomem ASC;

/*Ejercicio 3*/
SELECT nomem AS "Nombre empleado",
extel AS "Extension telefonica"
FROM EMPLEADOS
WHERE numde=110
ORDER BY nomem ASC;

/*Ejercicio 4*/
SELECT comis, nomem, salar
FROM EMPLEADOS
WHERE numhi = 3
ORDER BY comis ASC;

/*Ejercicio 5*/
SELECT comis, nomem, salar
FROM EMPLEADOS  
WHERE numhi = 3 AND comis IS NOT NULL
ORDER BY comis ASC;

/*Ejercicio 6*/
SELECT salar, nomem
FROM EMPLEADOS
WHERE numhi IS NULL AND (1200<salar<1500)
ORDER BY salar DESC, 1;

/*Ejercicio 7*/
SELECT DISTINCT numde 
FROM EMPLEADOS
WHERE salar<1500
ORDER BY numde ASC;

/*Ejercicio 8*/
SELECT DISTINCT comis 
FROM EMPLEADOS
WHERE numde=110;

