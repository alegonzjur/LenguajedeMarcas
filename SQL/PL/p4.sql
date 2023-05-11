/*1*/
CREATE OR REPLACE
PROCEDURE ESCRIBE IS 
BEGIN 
    DBMS_OUTPUT.PUT_LINE('Hola Mundo');
END ESCRIBE;
/
/*2*/
CREATE OR REPLACE
PROCEDURE ESCRIBE_MENSAJE (mensaje VARCHAR2) IS 
BEGIN 
    DBMS_OUTPUT.PUT_LINE (mensaje);
END ESCRIBE_MENSAJE;
/
/*3*/
CREATE OR REPLACE
PROCEDURE SERIE (minimo NUMBER, maximo NUMBER, paso NUMBER) IS x NUMBER;
BEGIN
    x = minimo;
    WHILE X< maximo loop
      DBMS_OUTPUT.PUT_LINE(x)
      x = x + paso;
    end loop;
END SERIE;
/
/*4*/
CREATE OR REPLACE 
FUNCTION AZAR (minimo NUMBER, maximo NUMBER) RETURN NUMBER IS
begin
  RETURN MOD(ABS(DBMS_RANDOM.RANDOM), rango) + minimo;
end AZAR;
/
/*5*/
CREATE OR REPLACE 
FUNCTION NOTA (nota NUMBER) RETURN VARCHAR2 IS
BEGIN
  CASE
    when nota>=9 then DBMS_OUTPUT.PUT_LINE('Sobresaliente');
    when nota BETWEEN 7 AND 8 DBMS_OUTPUT.PUT_LINE('Notable');
    when nota=6 then DBMS_OUTPUT.PUT_LINE('Bien');
    when nota=5 then DBMS_OUTPUT.PUT_LINE('Suficiente');
    when nota<5 then DBMS_OUTPUT.PUT_LINE('Insuficiente');
  END CASE;
END;
/  

/*6*/
