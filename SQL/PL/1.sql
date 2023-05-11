/*Teoría*/
DBMS_OUTPUT.PUT_LINE('Texto')
/*Funciones*/
DECLARE 
nota NUMBER(2)
begin
nota := 7;
    if nota=10 OR nota=9 then DBMS_OUTPUT.PUT_LINE('Sobresaliente');
    elsif nota = 8 OR nota = 7 then DBMS_OUTPUT.PUT_LINE('Notable');
    elsif nota = 6 then DBMS_OUTPUT.PUT_LINE('Bien');
    elsif nota = 5 then DBMS_OUTPUT.PUT_LINE('Suficiente');
    else DBMS_OUTPUT.PUT_LINE('Suspenso');
    end if;
end;
/
