/*Ejercicio 1*/
SELECT extel, count(numem)
FROM EMPLEADOS
GROUP BY extel
HAVING count(numem)>1;

/*Ejercicio 2*/
SELECT numce, avg(presu) AS "Presupuesto medio"
FROM CENTROS 
GROUP BY numce;

/*Ejercicio 3*/
SELECT numce, tidir AS "T", avg(presu) AS "Presupuesto medio"
FROM EMPLEADOS
GROUP BY numce, tidir;

/*Ejercicio 4*/
SELECT numde, count(DISTINCT extel) AS "Nº ext. tel."
FROM EMPLEADOS
GROUP BY numde
HAVING AVG(salar) > (SELECT AVG(salar) FROM EMPLEADOS);

/*Ejercicio 5*/
SELECT numde, max(sum(salar))
FROM EMPLEADOS
GROUP BY numde;