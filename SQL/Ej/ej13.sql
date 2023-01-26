CREATE TABLE Departamento(
    CodDpto INT,
    Nombre VARCHAR2(40)
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
    Retencion VARCHAR2(5),
    IDCuenta INT
);

CREATE TABLE CCC(
    IdCuenta INT,
    CodBanco INT,
    CodSucursal INT,
    NumCuenta INT
);

CREATE TABLE ConceptoRetributivo(
    Cod VARCHAR2(40),
    Descripcion VARCHAR2(40)
);

CREATE TABLE Descuento(
    IdNomina INT,
    LineaNum INT,
    Cantidad NUMBER,
    Base NUMBER,
    Porcentaje VARCHAR2(5)
);

CREATE TABLE Ingreso(
    IdNomina INT,
    LineaNum INT,
    Cantidad NUMBER,
    Concepto VARCHAR2(40)
);

CREATE TABLE Nomina(
    IdNomina INT,
    IdCuenta INT,
    EjercFiscal INT,
    Mes INT,
    NumOrden INT,
    CodEmp INT
);

CREATE TABLE trabaja(
    CodEmp INT,
    CodDpto INT,
    Funcion VARCHAR2(40)
);
ALTER TABLE Departamento ADD(
    CONSTRAINT PK_Dpt PRIMARY KEY (CodDpto)
);

ALTER TABLE Sede ADD(
    CONSTRAINT PK_sed PRIMARY KEY (CodSede),
    CONSTRAINT FK_sed FOREIGN KEY (CodDpto) REFERENCES Departamento(CodDpto)
);
ALTER TABLE ConceptoRetributivo ADD(
    CONSTRAINT PK_CR PRIMARY KEY (Cod)
);

ALTER TABLE Empleado ADD(
    CONSTRAINT PK_Emp PRIMARY KEY (CodEmp),
    CONSTRAINT FK_Emp FOREIGN KEY (IdCuenta) REFERENCES CCC(IdCuenta)
);

ALTER TABLE CCC ADD(
    CONSTRAINT PK_CCC PRIMARY KEY (IdCuenta),
    CONSTRAINT UQ1_CCC UNIQUE (CodBanco,NumCuenta,CodSucursal)
);

CREATE SEQUENCE IdCuenta 
    INCREMENT BY 1
    START WITH 1
    NOMAXVALUE;
ALTER TABLE Nomina ADD(
    CONSTRAINT PK_Nom PRIMARY KEY (IdNomina),
    CONSTRAINT FK1_Nom FOREIGN KEY (IdCuenta) REFERENCES CCC(IdCuenta),
    CONSTRAINT FK2_Nom FOREIGN KEY (CodEmp) REFERENCES Empleado(CodEmp),
    CONSTRAINT UQ1_Nom UNIQUE(IdCuenta,EjercFiscal,Mes,NumOrden)   
);
CREATE SEQUENCE IdNomina
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;

ALTER TABLE Ingreso ADD(
    CONSTRAINT PK_ing PRIMARY KEY (IdNomina,LineaNum),
    CONSTRAINT FK1_ing FOREIGN KEY (IdNomina) REFERENCES Nomina(IdNomina),
    CONSTRAINT FK2_ing FOREIGN KEY (Concepto) REFERENCES ConceptoRetributivo(Cod)
);
ALTER TABLE Descuento ADD(
    CONSTRAINT PK_Des PRIMARY KEY (IdNomina,LineaNum),
    CONSTRAINT FK1_Des FOREIGN KEY (IdNomina) REFERENCES Nomina(IdNomina)
);
CREATE SEQUENCE LineaNum
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;