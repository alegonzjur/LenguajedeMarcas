/*1*/
CREATE OR REPLACE
PROCEDURE FINANZAS
numero NUMBER;
minimo NUMBER; 
maximo NUMBER; 
medio NUMBER;
begin
  SELECT numde INTO dpto FROM DEPARTAMENTOS WHERE nomde = 'FINANZAS'
end;

/*2*/
CREATE OR REPLACE 
PROCEDURE AUMENTO IS
DECLARE 
  CURSOR C IS
    SELECT numem,nomem,salar INTO codigo,nombre,salinicial FROM EMPLEADOS WHERE numhi>2 AND salar<2000;
  salfinal NUMBER;
BEGIN
  FOR registro IN EMPLEADOS LOOP
    update EMPLEADOS set salar=registro.salar*1.10 where 
    
END AUMENTO;
/
/*3*/