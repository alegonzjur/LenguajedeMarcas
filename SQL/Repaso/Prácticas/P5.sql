/*Ejercicio 1*/
SELECT nomem 
FROM EMPLEADOS
WHERE salar BETWEEN 1500 AND 1600
ORDER BY 1 ASC;

/*Ejercicio 2*/
SELECT nomem, salar 
FROM EMPLEADOS
WHERE comis IS NOT NULL AND (salar/numhi) NOT BETWEEN 720*numhi AND 50*numhi*comis
ORDER BY 1 ASC;  