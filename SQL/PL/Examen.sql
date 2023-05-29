/*Ejercicio 1*/
CREATE OR REPLACE 
FUNCTION total_asientos_reservados (id_usuario_param Espectadores.id_usuario%TYPE) RETURN NUMBER;
tot_asientos NUMBER;
IS 
BEGIN 
SELECT SUM(num_asientos) INTO tot_asientos FROM Pedidos GROUP BY id_usuario HAVING id_usuario = id_usuario_param;
RETURN tot_asientos;
exception
  when no_data_found then
    RETURN 0;
END total_asientos_reservados;


/*Ejercicio 2*/
CREATE OR REPLACE 
PROCEDURE titulos_reservas_espectador (id_usuario_param Espectadores.id_usuario%TYPE) IS
v_titulos VARCHAR2; 
    CURSOR c_tit IS 
    SELECT titulo FROM Peliculas P JOIN Reservas R ON P.id_pelicula = R.id_pelicula 
    WHERE id_usuario = id_usuario_param;
BEGIN 
    OPEN c_tit;
    LOOP 
    FETCH c_tit INTO v_titulos;
    DBMS_OUTPUT.PUT_LINE(v_titulos);
    EXIT WHEN c_tit%NOTFOUND;
    END LOOP;
    CLOSE c_tit;
    exception
      when no_data_found then
        DBMS_OUTPUT.PUT_LINE('El usuario no tiene reservas.');
END titulos_reservas_espectador;

/*Ejercicio 3*/
CREATE OR REPLACE 
PACKAGE general IS 
    FUNCTION 1 RETURN ;
    PROCEDURE 2 ;