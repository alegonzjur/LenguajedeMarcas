/*Ejercicio 1*/
SELECT avg(salar) AS "Salario medio", min(salar) AS "Salario minimo", max(salar) AS "Salario max"
FROM EMPLEADOS
WHERE salar IS NOT NULL;

/*Ejercicio 2*/
SELECT salar, nomem
FROM EMPLEADOS
WHERE 1.4*salar > (SELECT MAX(salar) FROM EMPLEADOS)
ORDER BY 2 ASC;

/*Ejercicio 3*/
SELECT TRUNC(max((SYSDATE-fecna)/365)) AS "Edad"
FROM EMPLEADOS
WHERE numde=110;

/*Ejercicio 4*/
SELECT nomem AS "Nombre", TRUNC(max((SYSDATE-fecna)/365)) AS "Edad"
FROM EMPLEADOS
WHERE numde=110 AND (SELECT TRUNC(max(SYSDATE-fecna)/365) FROM EMPLEADOS WHERE numde=110);

/*Ejercicio 5*/
SELECT count(numem), count(disticnt comis), sum(comis)
FROM EMPLEADOS 
WHERE numde=112 AND comis IS NOT NULL;