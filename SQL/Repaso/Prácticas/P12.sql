/*Ejercicio 1*/
SELECT numde AS "Nº dep.", count(numem) AS "Nº Emp."
FROM EMPLEADOS
GROUP BY numde;

/*Ejercicio 2*/
SELECT numde AS "Nº dep.", avg(salar) AS "Salario medio", min(salar) AS "Salario minimo", max(salar) AS "Salario maximo"
FROM EMPLEADOS
GROUP BY numde;

/*Ejercicio 3*/
SELECT comis AS "Comision", avg(salar) AS "Salario medio", avg(ROUND((SYSDATE-fecna)/365)) AS "Edad Media"
FROM EMPLEADOS
GROUP BY comis;

/*Ejercicio 4*/
SELECT comis AS "Comision", avg(salar) AS "Salario medio", avg(TRUNC((SYSDATE-fecna)/365)) AS "Edad Media"
FROM EMPLEADOS
GROUP BY comis;

/*Ejercicio 5*/
SELECT avg(salar) AS "Salario medio", avg(TRUNC((SYSDATE-fecna)/365)) AS "Edad media"
FROM EMPLEADOS
GROUP BY numde, comis
ORDER BY 1 ASC;

/*Ejercicio 6*/
SELECT numde, count(numem), sum(salar)
FROM EMPLEADOS
WHERE numde IN (SELECT numde FROM EMPLEADOS WHERE salar>2500)
GROUP BY numde;