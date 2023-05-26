/*Ejercicio 1*/
CREATE OR REPLACE 
PROCEDURE 1(p_id_libro, p_cantidad) IS
precio_por_libro NUMBER;
precio_total NUMBER; 
BEGIN 
    SELECT precio INTO precio_por_libro FROM Libros WHERE id_libro = p_id_libro;
    precio_total := precio_por_libro*p_cantidad;
    DBMS_OUTPUT.PUT_LINE('El precio de '|| cantidad || 'es' || precio_total);
END 1;

/*Ejercicio 2*/
CREATE OR REPLACE 
FUNCTION 2(p_id_cliente) RETURN v_total_libros NUMBER
IS 
BEGIN 
    SELECT COUNT(id_libro) INTO v_total_libros FROM Pedidos WHERE p_id_cliente = id_cliente;
    RETURN v_total_libros;
    exception
      when no_data_found then
        RETURN NULL;
END 2;

/*Ejercicio 3*/
CREATE OR REPLACE 
PROCEDURE 3 (p_id_cliente) IS 
ex_ped NUMBER;
BEGIN 
    SELECT COUNT(id_pedido) INTO ex_ped FROM Pedidos WHERE id_cliente = p_id_cliente;
    IF ex_ped > 0 THEN 
    DBMS_OUTPUT.PUT_LINE('El cliente ha hecho pedidos');
    ELSE 
    DBMS_OUTPUT.PUT_LINE('El cliente no ha hecho pedidos');
    END IF;
END 3;