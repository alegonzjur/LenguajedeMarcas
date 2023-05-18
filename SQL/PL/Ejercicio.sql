/*Practica 5 - Penúltimo*/

CREATE OR REPLACE 
PROCEDURE AumSalar AS 
    CURSOR c IS 
    



/*Practica 5 - Último*/
CREATE OR REPLACE 
PROCEDURE EdadEmpleado (nombre EMPLEADOS.NOMEM%TYPE) AS
DECLARE
    CURSOR C (nom EMPLEADOS.NOMEM%TYPE) IS 
        SELECT nomem,fecna
        FROM EMPLEADOS WHERE NOMEM = nom;
meses NUMBER;
a NUMBER;
m NUMBER;
d NUMBER;

begin
    DBMS_OUTPUT.PUT_LINE('EMPLEADO: AÑOS MESES DÍAS');
    FOR registro IN C(nombre) loop
      meses := MONTHS_BETWEEN (SYSDATE, registro.FECNA);
      a := meses/12;
      m := MOD (meses,12);
      d := (m- TRUNC (m))*30;
      DBMS_OUTPUT.PUT_LINE(registro.NOMEM || ': '
      || TRUNC(a) || ' ' || TRUNC(m) || ' ' || TRUNC(d) );
    end loop;
end EdadEmpleado;
/