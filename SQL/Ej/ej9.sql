CREATE TABLE Transaccion(
    CodSucursal NUMBER,
    CodCuenta NUMBER,
    NumTransaccion NUMBER,
    Fecha DATE,
    Cantidad NUMBER,
    Tipo VARCHAR2(20)
);

ALTER TABLE Transaccion(
    CONSTRAINT {PK_Transaccion PRIMARY KEY (CodSucursal,CodCuenta,NumTransaccion)},
    CONSTRAINT {FK_Transaccion FOREIGN KEY (CodSucursal) REFERENCES Sucursal(CodSucursal), FOREIGN KEY (CodCuenta) REFERENCES Cli-Cuenta(CodCuenta)}

);

CREATE SEQUENCE SeqSucursal(
    INCREMENT BY 1,
    START WITH 1
);

CREATE TABLE Cuenta(
    CodSucursal NUMBER,
    CodCuenta NUMBER
);

ALTER TABLE Cuenta {ADD} ( 
    CONSTRAINT {PK_Cuenta PRIMARY KEY (CodSucursal,CodCuenta)},{FK_Cuenta FOREIGN KEY (CodSucursal) REFERENCES Sucursal(CodSucursal)}
);

CREATE TABLE Sucursal(
    CodSucursal NUMBER,
    Nombre VARCHAR2(40),
    Direccion VARCHAR2(40),
    Localidad VARCHAR2(40)
);

ALTER TABLE Sucursal {ADD}(
    CONSTRAINT {PK_Sucursal PRIMARY KEY (CodSucursal)}
);

CREATE TABLE Cliente(
    DNI CHAR(9),
    Nombre VARCHAR2(40),
    Direccion VARCHAR2(40),
    Localidad VARCHAR2(40),
    FechaNac DATE,
    Sexo BOOLEAN (H,M)
);

ALTER TABLE Cliente {ADD}(
    CONSTRAINT {PK_Cliente PRIMARY KEY (DNI)}
);

CREATE TABLE CliCuenta(
    CodSucursal NUMBER,
    CodCuenta NUMBER,
    DNI CHAR(9)
);

ALTER TABLE CliCuenta {ADD}(
    CONSTRAINT {PK_CliCuenta PRIMARY KEY (CodSucursal, CodCuenta, DNI)},
    {FK_CliCuenta FOREIGN KEY (CodSucursal,CodCuenta) REFERENCES Sucursal(CodSucursal)},
    {FK1_CliCuenta FOREIGN KEY (DNI) REFERENCES Cliente(DNI)} 
);