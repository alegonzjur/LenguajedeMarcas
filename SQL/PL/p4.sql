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
PROCEDURE AZAR (minimo NUMBER, maximo NUMBER) RETURN NUMBER IS
begin
  RETURN MOD(ABS(DBMS_RANDOM.RANDOM), rango) + minimo;
end AZAR;
/
/*5*/
CREATE OR REPLACE
PROCEDURE NOTA (nota NUMBER) RETURN VARCHAR2 IS
BEGIN
    