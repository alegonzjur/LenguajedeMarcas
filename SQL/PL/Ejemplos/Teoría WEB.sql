--Variables
--En el declare, ponemos todas las variables.
DECLARE 
    variable1 := 20;
    variable2 := 30;
    variable3 := 40;
    variable4 := 50;
    variable5 NUMBER;
    variable6 INTEGER;
    variable7 VARCHAR2;
begin
    variable5 := variable1 + variable2;
    DBMS_OUTPUT.PUT_LINE('La variable 5 es' || variable5);
END;
/
--Constant
--Las constantes son variables inicializadas con un valor.
DECLARE
    constante := 12;
    multiplicacion := constante*2;
BEGIN 
    DBMS_OUTPUT.PUT_LINE('La multiplicación es' || multiplicacion);
END;
/
--Mensajes
DECLARE
    mensaje VARCHAR2(20) := 'Hola mundo';
BEGIN 
    DBMS_OUTPUT.PUT_LINE(mensaje);
    --Intercalamos algunos mensajes con lo agregado.
    DBMS_OUTPUT.PUT_LINE('El mensaje es' || mensaje);
END;

--EXIT LOOPS
--Cuando se cumple una condición se termina el LOOP.
DECLARE 
    num NUMBER := 1;
BEGIN 
    LOOP 
        DBMS_OUTPUT.PUT_LINE(num);
        EXIT WHEN num = 10;
        num := num+1;
    END LOOP;
END;
--WHILE LOOPS
--Mientras se esté cumpliendo una condición, el LOOP seguirá funcionando.
DECLARE
    num NUMBER := 1;
BEGIN 
    WHILE num <= 10
    LOOP 
        DBMS_OUTPUT.PUT_LINE(num);
        num := num+1;
    END LOOP;
END;
--FOR IN LOOPS
--Hace que el LOOP se repita un número determinado de veces.
DECLARE
    var NUMBER;
begin
  FOR var IN 1..10
  loop
    DBMS_OUTPUT.PUT_LINE(var);
  end loop
end;
--CONTINUE
--Se utiliza para saltar un determinado paso en los LOOPS.
DECLARE 
    num NUMBER := 0;
begin
  WHILE num <10
  loop
    num := num +1;
    IF num = 5 THEN 
        CONTINUE;
    END IF;
    DBMS_OUTPUT.PUT_LINE(num);
  end loop;
end;


