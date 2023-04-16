/*Ejercicio 1*/
SELECT nomem, comis 
FROM EMPLEADOS
WHERE numde = 110 AND 
    EXISTS (SELECT comis FROM EMPLEADOS WHERE numde=110 AND comis IS NOT NULL)
ORDER BY 1 ASC;

/*Ejercicio 2*/
SELECT nomde 
FROM DEPARTAMENTOS
WHERE numde NOT LIKE '%DIRECC%' AND numde NOT LIKE '%SECTOR%'
ORDER BY 1 ASC;

/*Ejercicio 3*/
SELECT nomem AS "Nombre", salar || ' €' AS "Salario"
FROM EMPLEADOS
WHERE (numhi=0 AND salar>1500) OR (numhi>0 AND salar<1000)
ORDER BY 1 ASC;

/*Ejercicio 4*/
SELECT numem || 'nº ' AS "Num. Emp.", nomem AS "Nombre", salar+comis || ' €' AS "Salario total"
FROM EMPLEADOS
WHERE (salar+comis)> SOME(SELECT 1800+(salar+comis) FROM EMPLEADOS);

/*Ejercicio 5*/
SELECT nomen, salar 
FROM EMPLEADOS
WHERE numde = 111 
    AND comis IS NOT NULL 
    AND EXISTS (SELECT * FROM EMPLEADOS WHERE numde=111 AND comis>salar*0.15);

/*Ejercicio 6*/
SELECT nomde AS "Nom. Depart.", tidir AS "T", presu AS "Presupuesto"
FROM DEPARTAMENTOS 
WHERE tidir = 'F'
    OR (tidir = 'P' AND (presu>30 OR depde IS NULL))
ORDER BY 1 ASC;

/*Ejercicio 7*/
SELECT nomde AS "Nom. Depart.", tidir AS "T", presu || '.000 €' AS "Presupuesto"
FROM DEPARTAMENTOS 
WHERE tidir = 'F'
    OR (tidir = 'P' AND (presu>30 OR depde IS NULL))
ORDER BY 1 ASC;