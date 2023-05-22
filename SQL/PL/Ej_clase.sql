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

