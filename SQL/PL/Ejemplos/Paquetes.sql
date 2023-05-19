/*Agrupan bajo un mismo nombre un nombre funciones y procedimientos.*/
CREATE OR REPLACE 
PACKAGE aritmetica IS 
    version NUMBER := 1.0;
    PROCEDURE mostrar_info;
    FUNCTION suma (a NUMBER, b NUMBER) RETURN NUMBER;
    FUNCTION resta (a NUMBER, b NUMBER) RETURN NUMBER;
    FUNCTION multiplicacion (a NUMBER, b NUMBER) RETURN NUMBER;
    FUNCTION division (a NUMBER, b NUMBER) RETURN NUMBER;
END aritmetica;
/*Aquí lo desarrollamos en el body.*/
CREATE OR REPLACE
PACKAGE BODY aritmetica IS 
    PROCEDURE mostrar_info IS
    BEGIN 
        DBMS_OUTPUT.PUT_LINE('Paquete de operaciones aritméticas.Su version es' || version);
    END mostrar_info;
    FUNCTION suma (a NUMBER, b NUMBER) RETURN NUMBER IS
    BEGIN 
        RETURN (a+b);
    END suma;
    FUNCTION resta (a NUMBER, b NUMBER) RETURN NUMBER IS 
    BEGIN 
        RETURN (a-b);
    END resta;
    FUNCTION multiplicacion (a NUMBER, b NUMBER) RETURN NUMBER IS 
    BEGIN 
        RETURN (a*b);
    END multiplicacion;
    FUNCTION division (a NUMBER, b NUMBER) RETURN NUMBER IS 
        RETURN (a/b);
    END division;