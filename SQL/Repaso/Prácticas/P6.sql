/*Ejercicio 1*/
SELECT nomem AS "Nombre", 
salar | ' €' AS "Salario" 
FROM EMPLEADOS
WHERE nomem LIKE 'A%'
ORDER BY 1 ASC;

/*Ejercicio 2*/
SELECT nomem 
FROM EMPLEADOS 
WHERE nomem LIKE '________'
ORDER BY 1 ASC;

/*Ejercicio 3*/
SELECT 'DEPARTAMENTO DE ' || nomde AS "Departamento",
presu*1000 || ' €' AS "Presupuesto"
FROM DEPARTAMENTOS
WHERE nomde LIKE '%SECTOR%'
ORDER BY 1 ASC; 