CREATE TABLE CENTROS(
    numce NUMBER(4) PRIMARY KEY, /*Número de centro*/
    nomce VARCHAR2(25), /*Nombre de centro*/
    dirce VARCHAR2(25) /*Direccion de centro*/
);

CREATE TABLE DEPARTAMENTOS(
    numde NUMBER(3) PRIMARY KEY, /*Numero departamento*/
    numce NUMBER(4), /*Numero de centro*/
    direc NUMBER(3), /*Director*/
    tidir CHAR(1), /*Tipo de director(Propieda o Funciones)*/
    presu NUMBER(3,1), /*Presupuesto (miles de €)*/
    depde NUMBER(3), /*Departamento del que depende*/
    nomde VARCHAR2(20) /*Nombre del departamento*/
);

CREATE TABLE EMPLEADOS(
    numem NUMBER(3) PRIMARY KEY, /*Numero de empleado*/
    extel NUMBER(3), /*Extension telefonica*/
    fecna DATE, /*Fecha de nacimiento*/
    fecin DATE, /*Fecha de incorporacion*/
    salar NUMBER(5), /*Salario*/
    comis NUMBER(3), /*Comision*/
    numhi NUMBER(1), /*Numero de hijos*/
    nomem VARCHAR2(10), /*Nombre de empleado*/
    numde NUMBER(3) /*Numero de departamento*/
);

ALTER TABLE DEPARTAMENTOS ADD(
    CONSTRAINT FK1_dep FOREIGN KEY (numce) REFERENCES CENTROS(numce),
    CONSTRAINT FK2_dep FOREIGN KEY (depde) REFERENCES DEPARTAMENTOS(numde)
);

ALTER TABLE EMPLEADOS ADD(
    CONSTRAINT FK1_emp FOREIGN KEY (numde) REFERENCES DEPARTAMENTOS(numde)
);