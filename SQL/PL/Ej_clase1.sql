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
  IF ped_cliente IS NULL THEN
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
