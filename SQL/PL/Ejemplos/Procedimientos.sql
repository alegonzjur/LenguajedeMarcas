--PROCEDURE
--Procedimiento: No devuelve valor. Con parámetros hay que añadirle un IS.
CREATE OR REPLACE PROCEDURE nombreProcedimiento (listaDeParametros)
IS | AS
    --Declare
BEGIN
    --Bloque de ejecucion
EXCEPTION 
    --Bloque de excepciones
END;
--Ejemplo con parámetros:
CREATE OR REPLACE PROCEDURE añadirEstudiante(numero NUMBER, name VARCHAR2) IS
BEGIN
    INSERT INTO students VALUES(numero,name);
END;
/
--Para ejecutar un procedimiento:
EXEC nombreProcedimiento(parametros);
EXEC añadirEstudiante(1,'Juan');
--Para borrar un procedimiento:
DROP nombreProcedimiento;