/*Ejercicio 1*/
CREATE OR REPLACE 
PROCEDURE suma_total_libros (l_id_libro Libros.id_libro%TYPE, p_cantidad Pedidos.cantidad%TYPE) IS
precio_libro NUMBER;
BEGIN 
    SELECT precio INTO precio_libro FROM Libros WHERE id_libro = l_id_libro;
    DBMS_OUTPUT.PUT_LINE('El precio total es' || precio_libro*cantidad);
    exception
      when no_data_found then
        DBMS_OUTPUT.PUT_LINE(NULL);
END suma_total_libros;


/*Ejercicio 2*/
CREATE OR REPLACE 
FUNCTION tot_lib_cliente (p_id_cliente Clientes.id_cliente%TYPE) RETURN NUMBER IS
libros_cliente NUMBER; 
BEGIN 
    SELECT SUM(cantidad) INTO libros_cliente FROM Pedidos WHERE p_id_cliente = id_cliente;
    DBMS_OUTPUT.put_line(libros_cliente);
END tot_lib_cliente;


/*Ejercicio 3*/
CREATE OR REPLACE
PROCEDURE comprobar_pedido(p_id_cliente Clientes-id_cliente%TYPE) IS
ped_cliente VARCHAR2;
    CURSOR p_c IS 
    select id_pedido
      into ped_cliente
      from Pedidos
     where p_id_cliente = id_cliente;
begin
  IF ped_cliente%NOTFOUND THEN
  DBMS_OUTPUT.PUT_LINE('No ha realizado pedidos.');
  ELSE THEN 
  DBMS_OUTPUT.PUT_LINE('El pedido es' || ped_cliente);
  END IF; 
end comprobar_pedido;

/*Ejercicio 4*/
CREATE OR REPLACE 
PROCEDURE 10_primeros IS
    CURSOR c_lib IS 
    SELECT titulo FROM Libros; 
i NUMBER := 0; 
BEGIN 
    FOR libro in c_lib LOOP
    DBMS_OUTPUT.PUT_LINE(libro.titulo);
    i := i+1;
    EXIT WHEN i=10;
    END LOOP; 
END 10_primeros;

/*Ejercicio 5*/
CREATE OR REPLACE 
PROCEDURE 10_primeros_1 IS 
    CURSOR c_lib IS 
    SELECT titulo FROM Libros;
i NUMBER := 0;
BEGIN 
    WHILE i<10 LOOP 
    i := i+1;
    DBMS_OUTPUT.PUT_LINE(libro.titulo);
    END LOOP;
END 10_primeros_1;

/*Ejercicio 6*/
CREATE OR REPLACE
PROCEDURE titulo (p_id_cliente) IS
    CURSOR c_tit IS 
    SELECT titulo
    FROM Pedidos P JOIN Libros L ON P.id_libro = L.id_libro   
    WHERE p_id_cliente = id_cliente;
BEGIN 
    FOR Pedido IN c_tit loop
      DBMS_OUTPUT.PUT_LINE(pedido.titulo);
    end loop
END titulo;

/*Ejercicio 7*/
CREATE OR REPLACE 
PROCEDURE obtener_precio IS 
p_libro NUMBER;
p_id_libro NUMBER := 'N023'
BEGIN 
    SELECT precio INTO p_libro FROM Libros WHERE id_libro = p_id_libro;
    DBMS_OUTPUT.PUT_LINE(p_libro);
    exception
      when no_data_found then
        DBMS_OUTPUT.PUT_LINE('El libro no existe');
END obtener_precio;

/*Ejercicio 8*/
CREATE OR REPLACE 
PROCEDURE insertar_correo (p_correo) IS 
c_correo VARCHAR2; 
BEGIN 
    SELECT COUNT(id_cliente) INTO c_correo FROM Clientes WHERE p_correo = correo;
    exception
    IF c_correo%NOTFOUND THEN
        insert into Clientes (correo)
        values (p_correo);
    END IF;
END insertar_correo;


/*Ejercicio 9*/
CREATE OR REPLACE 
FUNCTION total_libros_dif RETURN cont_libros NUMBER;
IS 
BEGIN 
    SELECT COUNT(DISTINCT id_libro) INTO cont_libros FROM Pedidos;
    RETURN (cont_libros);
END total_libros_dif;

/*Ejercicio 10*/
CREATE OR REPLACE 
PROCEDURE total_pedidos_real IS 
    CURSOR tot_pedidos IS 
    SELECT COUNT(pedido) AS total_pedidos FROM Pedidos;
    total_pedidos NUMBER;
BEGIN
    OPEN tot_pedidos;
    FETCH tot_pedidos INTO total_pedidos;
    DBMS_OUTPUT.PUT_LINE('Total de pedidos realizados:' || total_pedidos);
    CLOSE tot_pedidos;
END total_pedidos_real;

/*Ejercicio 11*/
CREATE OR REPLACE 
PACKAGE funciones IS 
    FUNCTION precio_libro_1(p_id_libro NUMBER) RETURN NUMBER;
END funciones;

CREATE OR REPLACE 
PACKAGE BODY funciones IS 
    FUNCTION precio_libro_1(p_id_libro NUMBER) RETURN NUMBER IS 
    p_libro NUMBER;
    BEGIN 
    SELECT precio INTO p_libro FROM Libros WHERE id_libro = p_id_libro;
    RETURN p_libro;
    exception WHEN no_data_found THEN 
    RETURN NULL;
    END precio_libro;
END funciones;

/*Ejercicio 12*/
CREATE OR REPLACE 
PACKAGE insertar_pedido IS 
    PROCEDURE ins_ped (p_id_cliente NUMBER,p_id_libro NUMBER);
END ins_ped;

CREATE OR REPLACE 
PACKAGE BODY insertar_pedido IS 
    PROCEDURE ins_ped (p_id_cliente NUMBER, p_id_libro NUMBER) IS 
    BEGIN 
    insert into Pedidos (id_cliente, id_libro)
    values (p_id_cliente,p_id_libro);
    COMMIT;
    END ins_ped;
END insertar_pedido;

/*Ejercicio 13*/
CREATE OR REPLACE
PACKAGE ped_realizado IS 
    PROCEDURE p_r (p_id_cliente NUMBER);
END ped_realizado;

CREATE OR REPLACE 
PACKAGE BODY ped_realizado IS 
    PROCEDURE p_r (p_id_cliente NUMBER) IS
    CURSOR c_ped IS  
    SELECT id_libro FROM Pedidos WHERE p_id_cliente = id_cliente;
    v_id_libro NUMBER;
    BEGIN 
    OPEN c_ped;
    LOOP
        FETCH c_ped INTO v_id_libro;
        EXIT WHEN c_ped%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID del libro' || v_id_libro);
    END loop;
    CLOSE c_ped;
    END p_r;
END ped_realizado;

/*Ejercicio 14*/
CREATE OR REPLACE 
PACKAGE p_f_11_12_13 IS 
    FUNCTION 11(p_id_libro NUMBER) RETURN NUMBER;
    PROCEDURE 12(p_id_cliente NUMBER, p_id_libro NUMBER);
    PROCEDURE 13(p_id_cliente NUMBER);
END p_f_11_12_13;

CREATE OR REPLACE 
PACKAGE BODY p_f_11_12_13 IS 
    FUNCTION 11(p_id_libro NUMBER) RETURN NUMBER IS 
    v_p_libro NUMBER;
    BEGIN 
    SELECT precio INTO v_p_libro FROM Libros WHERE id_libro = p_id_libro;
    RETURN v_p_libro;
    exception
    when no_data_found then
    RETURN NULL;
    END 11;
    PROCEDURE 12(p_id_cliente NUMBER, p_id_libro NUMBER) IS 
    BEGIN 
    insert into Pedidos (id_cliente,p_id_libro)
    values (p_id_cliente,p_id_libro);
    COMMIT;
    END 12;
    PROCEDURE 13(p_id_cliente NUMBER) IS 
    v_id_libro NUMBER;
        CURSOR c_pedidos IS 
        SELECT id_libro FROM Pedidos WHERE p_id_cliente = id_cliente;
    BEGIN 
        OPEN c_pedidos;
        LOOP 
        FETCH c_pedidos INTO v_id_libro;
        EXIT WHEN c_pedidos%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID del libro' || v_id_libro);
        END LOOP;
        CLOSE c_pedidos;
    END 13;
END p_f_11_12_13;

/*Ejercicio 15*/
CREATE OR REPLACE 
PACKAGE 15 IS 
    FUNCTION tot_lib_dif RETURN NUMBER;
    PROCEDURE ped_r;
END 15;

CREATE OR REPLACE 
PACKAGE BODY 15 IS 
    FUNCTION tot_lib_dif RETURN v_t_libros NUMBER IS 
    BEGIN 
    SELECT COUNT(DISTINCT id_libro) INTO v_t_libros FROM Libros;
    RETURN v_t_libros;
    exception
    WHEN no_data_found THEN 
    RETURN NULL;
    END tot_lib_dif;
    PROCEDURE ped_r IS 
    v_pedido NUMBER;
        CURSOR c_ped_1 IS 
        SELECT id_pedido FROM Pedidos;
    BEGIN 
        OPEN c_ped_1;
        LOOP 
        FETCH c_ped_1 INTO v_pedido;
        EXIT WHEN c_ped_1%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Pedidos realizados' || v_pedido);
        END LOOP;
        CLOSE c_ped_1;
    END ped_r;
END 15;

     

