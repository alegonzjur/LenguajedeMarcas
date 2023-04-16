/*Ejercicio 1*/
SELECT nomem, TO_CHAR(fecna, 'DD/MM/YYYY') AS "Nacimiento"
FROM EMPLEADOS
WHERE TO_CHAR(fecna, 'MM') = 11
ORDER BY 1 ASC;

/*Ejercicio 2*/
SELECT nomem
FROM EMPLEADOS
WHERE TO_CHAR(fecna, 'DDMM') = TO_CHAR(SYSDATE, 'DDMM')
ORDER BY 1 ASC;

/*Ejercicio 3*/
SELECT nomem, TO_CHAR(fecna, 'DD/MM/YYYY')
FROM EMPLEADOS 
WHERE TO_CHAR(fecna, 'YY') < 1950
ORDER BY 1 ASC;

/*Ejercicio 4*/
SELECT nomem, TO_CHAR(fecna, 'DD/MM/YYYY'), TO_CHAR(fecin, 'DD/MM/YYYY')
FROM EMPLEADOS
WHERE TO_CHAR(fecin, 'YYYY') < 1970;

/*Ejercicio 5*/
SELECT nomem, TO_CHAR(fecna, 'DD/MM/YYYY'), TO_CHAR(fecin,'DD/MM/YYYY')
FROM EMPLEADOS
WHERE (fecin-fecna)/365 <= 30;

/*Ejercicio 6*/
SELECT nomem, TO_CHAR(fecna,'DD/MM/YYYY') AS "Fecha Nac."
FROM EMPLEADOS
WHERE TO_CHAR(fecna, 'd') = 1
ORDER BY 1 ASC;

/*Ejercicio 7*/
SELECT nomem, TO_CHAR(fecna,'day') AS "Viernes día incor."
FROM EMPLEADOS
WHERE TO_CHAR(fecna, 'd') = TO_CHAR(fecin, 'd')
    AND TO_CHAR(fecna,'d') = 5;

/*Ejercicio 8*/
SELECT nomem, TO_CHAR(fecna, 'day') AS "Mismo día nac."
FROM EMPLEADOS
WHERE TO_CHAR(fecna, 'd') = TO_CHAR(fecin, 'd')
ORDER BY 1 ASC;

/*Ejercicio 9*/
SELECT nomem AS "Nombre", TO_CHAR(fecin, 'MONTH') AS "Mes incor."
FROM EMPLEADOS
WHERE TO_CHAR(fecin, 'MM') BETWEEN '01' AND '06';

/*Ejercicio 10*/
SELECT nomem AS "Nombre", TO_CHAR(fecin, 'MONTH') AS "Mes incor."
FROM EMPLEADOS
WHERE TO_CHAR(fecin,'MM') BETWEEN '01' AND '06'
    AND TO_CHAR(fecin, 'MM') = TO_CHAR(fecna, 'MM');