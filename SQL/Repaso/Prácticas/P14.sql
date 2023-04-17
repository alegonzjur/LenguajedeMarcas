/*Ejercicio 1*/
SELECT numde, numce, max(salar)
FROM EMPLEADOS E JOIN DEPARTAMENTOS D ON E.numde = D.numde 
            JOIN CENTROS C ON D.numce = C.numce
WHERE presu < 35
GROUP BY D.nomde, nomce
ORDER BY 1 ASC; 

/*Ejercicio 2*/
SELECT D2.nomde AS "Departamento", D1.nomde AS "Dpto. del que dep.", presu AS "Presu"
FROM DEPARTAMENTOS D1 JOIN DEPARTAMENTOS D2 ON D1.numde = D2.depde
WHERE D2.depde IN (SELECT numde FROM DEPARTAMENTOS WHERE presu<30)
ORDER BY 1 ASC;

 