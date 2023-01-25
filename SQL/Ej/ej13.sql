CREATE TABLE Departamento(
    CodDpto INT,
    Nombre VARCHAR2
);

CREATE TABLE Sede(
    CodSede INT,
    Nombre VARCHAR2(40),
    CodDpto INT
);

CREATE TABLE Empleado(
    CodEmp INT,
    NIF CHAR(9),
    Nombre VARCHAR2(40),
    NumHijos INT,
    Retencion PERCENTAGE,
    IDCuenta INT
);

CREATE TABLE CCC(
    IdCuenta INT,
    CodBanco INT,
    CodSucursal INT,
    NumCuenta INT
);

CREATE TABLE ConceptoRetributivo(
    Cod INT,
    Descripcion VARCHAR2(40)
);

CREATE Descuento(
    IdNomina INT,
    LineaNum INT,
    Cantidad NUMBER,
    Base NUMBER
    Porcentaje PERCENTAGE
);

CREATE Ingreso(
    IdNomina INT,
    LineaNum INT,
    Cantidad NUMBER,
    Concepto VARCHAR2(40)
);

CREATE Nomina(
    IdNomina INT,
    IdCuenta INT,
    EjercFiscal INT,
    Mes INT,
    NumOrden INT,
    CodEmp INT
);

CREATE trabaja(
    CodEmp INT,
    CodDpto INT,
    Funcion VARCHAR2(40)
);