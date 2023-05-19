/*Ejercicio RESTO*/
/*Si el paquete está ya creado, esta primera estructura no es necesaria.*/
CREATE OR REPLACE 
PACKAGE aritmetica IS 
    FUNCTION resto (dividendo NUMBER, divisor NUMBER) RETURN NUMBER;
END aritmetica;

CREATE OR REPLACE 
PACKAGE BODY aritmetica IS 
    FUNCTION resto (dividendo NUMBER, divisor NUMBER) RETURN NUMBER IS 
    BEGIN 
        RETURN mod(dividendo/divisor);
    END resto;
END aritmetica;

/*Ejercicio GESTIÓN*/
CREATE OR REPLACE
PACKAGE gestion IS 
    PROCEDURE num_dep;
    FUNCTION cont_emp() RETURN NUMBER;
    FUNCTION num_emp() RETURN NUMBER;
END gestion;

CREATE OR REPLACE
PACKAGE BODY gestion IS 
    PROCEDURE num_dep IS 
    BEGIN 
        DBMS_OUTPUT.PUT_LINE(select COUNT(id) from dpto)
    END num_dep;
    FUNCTION cont_emp() RETURN NUMBER IS 
    BEGIN 

    END cont_emp;
