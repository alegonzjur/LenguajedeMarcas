/*Ejercicio 1*/
CREATE OR REPLACE 
PROCEDURE precio_total ( p.id_libro Libros.id_libro%TYPE, p.cantidad Pedidos.cantidad%TYPE) IS
precio_t NUMBER;
    CURSOR C IS
        SELECT precio FROM Libros WHERE p.id_libro = id_libro;

BEGIN
    FROM registro IN C:
        precio_t = p.cantidad*precio;
        DBMS_OUTPUT.PUT_LINE('El precio total para' || p.cantidad || 'libro/s del ID' || p.id_libro || 'es' || precio_t);
    exception
      when no_data_found then
        precio_t = NULL;
END precio_total;

/*Sin cursores*/
PROCEDURE precio_total (p.id_libro Libros.id_libro%TYPE, p.cantidad Pedidos.cantidad%TYPE) AS
precio_por_libro NUMBER;
p_total NUMBER;
begin 
    select precio into precio_por_libro from Libros where id_libro =  p.id_libro;
    p_total = precio_por_libro * p.cantidad;
    exception
      when no_data_found then
        precio_t = null;
END precio_total;


/*Ejercicio 2*/
CREATE OR REPLACE 
FUNCTION libros_pedidos (p.id_cliente Pedidos.id_cliente%TYPE) RETURN total_libros NUMBER;
IS 
BEGIN
    SELECT SUM(cantidad) INTO total_libros FROM Pedidos GROUP BY p.id_cliente;
    RETURN total_libros;
    exception
      when no_data_found then
        total_libros = NULL;
END libros_pedidos;

/*Ejercicio 3*/
CREATE OR REPLACE 
PROCEDURE (p.id_cliente NUMBER) AS
ped_cliente NUMBER;
BEGIN 
    SELECT * INTO ped_cliente FROM Pedidos WHERE p.id_cliente = id_cliente;
    if p.id_cliente%no_data_found then
        DBMS_OUTPUT.PUT_LINE('No ha hecho ningun pedido');
    else 
        DBMS_OUTPUT.PUT_LINE('Los datos del cliente son' || p.id_cliente);
    end if;
END PROCEDURE;

/*Ejercicio 4*/
DECLARE CURSOR c_libros IS 
    SELECT titulo FROM Libros;
    i NUMBER := 0;
begin
  FOR libro IN c_libros loop
    i := i+1;
    DBMS_OUTPUT.PUT_LINE(libro.titulo);
    EXIT WHEN i = 10;
  end loop;
end;

/*Ejercicio 5*/
DECLARE CURSOR C_libros IS 
    SELECT titulo FROM LIBROS;
    i number := 0;
BEGIN 
    loop
      
      WHILE i<10 
      DBMS_OUTPUT.PUT_LINE(libro.titulo);
      i := i+1;  
    end loop
end;

/*Ejercicio 6*/
DECLARE
    p_id_cliente NUMBER;
    CURSOR C_pedidos (p_id_cliente) IS 
        select titulo
          from Pedidos join Libros ON Pedidos.id_libro = Libros.id_libro
         where id_cliente = p.id_cliente;
BEGIN 
    FOR registro IN C_pedidos loop
    DBMS_OUTPUT.PUT_LINE(id_cliente.titulo)
    end loop
END;

/*Ejercicio 7*/
DECLARE
    p_libro NUMBER;
    p_id_libro NUMBER := 'L001';
BEGIN 
    SELECT precio INTO p_libro FROM Libros WHERE id_libro = p_id_libro;
    DBMS_OUTPUT.put_line(p_libro);
    exception
      when no_data_found then
        DBMS_OUTPUT.PUT_LINE('El libro no existe');
END;

/*Ejercicio 8*/
CREATE OR REPLACE 
PROCEDURE crea_correo(correo_cliente VARCHAR2) IS
c_correo VARCHAR2;
    
BEGIN
    select correo
      into c_correo
      from Clientes
     where correo = correo_cliente;
    if c_correo%no_data_found EXISTS then
      insert into Clientes (correo)
      values ('vinicius.junior.@iesciudadjardin.com')
    else
      DBMS_OUTPUT.DBMS_OUTPUT('El correo' || c_correo || 'ya existe.')
    end if;
END crea_correo;

/*Ejercicio 9*/
CREATE OR REPLACE 
function libros_total RETURN num_libros NUMBER;
BEGIN 
    SELECT COUNT(DISTINCT id_libro) INTO num_libros FROM Libros;
    RETURN num_libros;
END ;
/*Ejercicio 10*/
/*Cursor explícito*/
CREATE OR REPLACE
PROCEDURE total_pedidos IS 
  CURSOR ped IS
    SELECT * FROM Pedidos;
BEGIN 
  FOR pedido IN ped
  DBMS_OUTPUT.PUT_LINE('El número de pedidos hecho hasta ahora es de' || COUNT(ped));
END total_pedidos;
/*Cursor implícito*/
CREATE OR REPLACE 
PROCEDURE total_pedidos_2 AS 
total NUMBER;
BEGIN 
  SELECT id_pedido INTO total FROM Pedidos;
  DBMS_OUTPUT.PUT_LINE('El número de pedidos hasta ahora es de' || COUNT(total));
END total_pedidos_2;

/*Ejercicio 11*/

CREATE OR REPLACE
PACKAGE precios IS 
  FUNCTION saber_precio (id_libro) RETURN precio_libro NUMBER;
END precios;

CREATE OR REPLACE 
PACKAGE BODY precios IS 
  FUNCTION saber_precio (p_id_libro) RETURN precio_libro NUMBER IS 
  BEGIN 
    select precio
      into precio_libro
      from Libros
     where id_libro = p_id_libro;
     RETURN precio_libro;
     exception
       when no_data_found then
         RETURN NULL;
  END saber_precio;
END precios;

/*Ejercicio 12*/
CREATE OR REPLACE 
PACKAGE pedidos IS 
  PROCEDURE insertar_pedido (id_cliente NUMBER, id_libro NUMBER);
END pedidos;

CREATE OR REPLACE 
PACKAGE BODY pedidos IS 
  PROCEDURE insertar_pedido (p_id_cliente NUMBER, p_id_libro NUMBER) IS
  BEGIN
      insert into Pedidos (id_cliente,id_libros)
      values (p_id_cliente,p_id_libro)
      COMMIT;
  END insertar_pedido;
END pedidos;


/*Ejercicio 13*/
CREATE OR REPLACE 
PACKAGE pedidos IS 
  PROCEDURE pedidos_cliente (p_id_cliente NUMBER);
END pedidos;

CREATE OR REPLACE 
PACKAGE BODY pedidos IS 
  PROCEDURE pedidos_cliente (p_id_cliente) IS
  CURSOR c_cli_ped IS 
    SELECT id_libro 
    FROM Pedidos
    WHERE P.id_cliente = p_id_cliente;
  BEGIN 
    FOR registro IN c_cli_ped loop
      DBMS_OUTPUT.PUT_LINE('Id del libro:' || id_libro);
      EXIT WHEN c_cli_ped%NOTFOUND;
    end loop
  END pedidos_cliente;
END pedidos; 

/*Ejercicio 14*/
CREATE OR REPLACE 
PACKAGE pedidos_libros IS
    FUNCTION calcular_total_pedido(pedido_id NUMBER) RETURN NUMBER;
    PROCEDURE actualizar_pedido(pedido_id NUMBER, cantidad NUMBER);
END pedidos_libros;

CREATE OR REPLACE 
PACKAGE BODY pedidos_libros IS 
  FUNCTION calcular_total_pedido(pedido_id NUMBER) RETURN NUMBER IS
  total NUMBER(7,2);
  BEGIN 
    select sum(libros.precio*pedidos_cantidad)
      into total
      from libros, pedidos
     where pedidos.id_libro = libros.id_libro AND pedido.id_pedido = pedido_id;
     RETURN total;
  END calcular_total_pedido;
  PROCEDURE actualizar_pedido(pedido_id NUMBER, cantidad NUMBER) IS
  BEGIN 
    UPDATE pedidos SET cantidad = cantidad WHERE id_pedido = pedido_id;
  END actualizar_pedido;
END pedidos_libros;
/

/*Ejercicio 15*/
CREATE OR REPLACE 
PACKAGE paq_func IS 
  function dif_libros return total_libros NUMBER;
  procedure ped_realizados;
END paqu_func;

CREATE OR REPLACE
PACKAGE BODY paq_func IS
  /*Primera función*/
  function dif_libros return total_libros NUMBER IS 
  BEGIN 
  SELECT COUNT(DISTINCT(id_libro)) INTO total_libros FROM Pedidos;
  RETURN total_libros;
  END dif_libros;
  /*Primer procedimiento*/
  procedure ped_realizados IS
  ped_real VARCHAR2; 
  begin
    select id_pedido
      into ped_real
      from Pedidos;
    DBMS_OUTPUT.PUT_LINE(ped_real);
  end ped_realizados;
end paq_func;


/*Ejercicio 16*/
CREATE OR REPLACE 
package general IS 
    FUNCTION calcular_total_pedido(pedido_id NUMBER) RETURN NUMBER;
    PROCEDURE actualizar_pedido(pedido_id NUMBER, cantidad NUMBER);
    function dif_libros return NUMBER;
    procedure ped_realizados;
end general;

CREATE OR REPLACE 
package body general IS
  