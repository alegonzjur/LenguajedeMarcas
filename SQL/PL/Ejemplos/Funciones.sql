--Funciones.
--Devuelven un valor siempre.

--Estructura:
CREATE OR REPLACE FUNCTION nombreFuncion(listaParametros) 
RETURN tipodedato;
IS|AS

begin
    RETURN variable;
exception
    RETURN variable;
end;
/

--Ejemplo:
CREATE OR REPLACE FUNCTION multiplicacion(num1 NUMBER,num2 NUMBER) 
RETURN NUMBER
IS 
    num3 NUMBER(8);
BEGIN 
    num3 := num1*num2;
    RETURN num3;
END;
/
--Una función puede ser asignada a una variable.
resultado := multiplicacion(10,12);
--Una funcion puede ser asignada a un select.
SELECT multiplicacion(11,7) FROM dual;
--Una función puede ser asignada a un mensaje.
DBMS_OUTPUT.PUT_LINE(multiplicacion(2,3));

--Para borrar una función.
DROP FUNCTION multiplicacion;