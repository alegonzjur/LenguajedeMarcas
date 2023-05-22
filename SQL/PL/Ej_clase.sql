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
