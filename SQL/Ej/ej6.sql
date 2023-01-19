
CREATE TABLE Empleado(
    DNI CHAR(9),
    Nombre VARCHAR2(40),
    Direccion VARCHAR2(40),
    Telefono NUMBER,
    Sucursal VARCHAR2(40),
    CONSTRAINT PK_Empleado {PRIMARY KEY (DNI)},
    CONSTRAINT FK_Empleado {FOREIGN KEY (Sucursal) REFERENCES Sucursal(Codigo)},
    CONSTRAINT Nombre_Empleado {NOT NULL (Nombre)}

);

CREATE TABLE Sucursal(
    Codigo NUMBER,
    Direccion VARCHAR2(40),
    Telefono NUMBER,
    CONSTRAINT PK_Sucursal PRIMARY KEY (Codigo)
);

CREATE TABLE Revista(
    Num_Reg NUMBER,
    Titulo VARCHAR2(40),
    Periodicidad VARCHAR2, (Semanal,Quincenal,Mensual,Trimestral,Anual)
    Tipo VARCHAR2(40),
    Sucursal VARCHAR2(40),
    CONSTRAINT PK_Revista {PRIMARY KEY (Num_Reg)},
    CONSTRAINT FK_Revista {FOREIGN KEY (Sucursal) REFERENCES Sucursal(Codigo)},
    CONSTRAINT TituloRevista {NOT NULL (Titulo)},
    CONSTRAINT {CHECK (Periodicidad IN ("Semanal","Quincenal","Mensual","Trimestral","Anual"))},
    CONSTRAINT {Periodicidad DEFAULT "Semanal"}
);

CREATE TABLE escribe(
    Num_Reg NUMBER,
    DNI_Per CHAR(9),
    CONSTRAINT {PK_escribe PRIMARY KEY (Num_Reg, DNI_Per),
    CONSTRAINT {FK1_escribe FOREIGN KEY (Num_Reg) REFERENCES Revista(Num_Reg),
    CONSTRAINT FK2_escribe FOREIGN KEY (DNI_Per) REFERENCES Periodista(DNI)}
);

CREATE TABLE Periodista(
    DNI CHAR(9),
    Nombre VARCHAR2(40),
    Direccion VARCHAR2(40),
    Telefono NUMBER,
    Especialista VARCHAR2(40)
    CONSTRAINT {PK_Periodista PRIMARY KEY (DNI),
    	       NombrePeriodista NOT NULL (Nombre)}
);

CREATE TABLE NumRevista(
    Num_Reg NUMBER,
    Numero NUMBER,
    NumPaginas NUMBER,
    Fecha DATE,
    CantVendidas NUMBER,
    CONSTRAINT {PK_NumRevista PRIMARY KEY (Num_Reg,Numero)},
    CONSTRAINT {FK_NumRevista FOREIGN KEY (Num_Reg) REFERENCES Revista(Num_Reg)},
    CONSTRAINT {CheckNumPagina CHECK (NumPaginas > 0)}
);