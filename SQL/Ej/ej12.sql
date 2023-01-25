CREATE TABLE Empleado(
    CodEmp INTEGER,
    NIF CHAR(9),
    Nombre VARCHAR2(40),
    Apellidos VARCHAR2(40),
    Direccion VARCHAR2(40),
    Telefono INTEGER,
    FechaNac DATE,
    Salario NUMBER
);

ALTER TABLE Empleado ADD(
    CONSTRAINT{PK_EmP PRIMARY KEY (CodEmp), UQ_Empleado UNIQUE (NIF)}
);

CREATE INDEX IN_Apellidos ON Empleado(Apellidos);

CREATE TABLE EmpCapacitado(
    CodEmp INTEGER
);
ALTER TABLE EmpCapacitado ADD(
    CONSTRAINT{PK_EmpC PRIMARY KEY (CodEmp),
                FK_EmpC FOREIGN KEY (CodEmp) REFERENCES Empleado(CodEmp)}
);
CREATE TABLE EmpNoCapacitado(
    CodEmp INTEGER
);
ALTER TABLE EmpNoCapacitado ADD(
    CONSTRAINT{PK_EmpNC PRIMARY KEY (CodEmp),
                FK_EmpNC FOREIGN KEY(CodEmp) REFERENCES Empleado(CodEmp)}
);

CREATE TABLE recibe(
    CodEmpleado INTEGER,
    CodCurso INTEGER,
    FechaInicio DATE
);
ALTER TABLE recibe ADD(
    CONSTRAINT{PK_r PRIMARY KEY (CodEmpleado, CodCurso, FechaInicio),
            FK1_r FOREIGN KEY (CodEmpleado) REFERENCES Empleado(CodEmp),
            FK2_r FOREIGN KEY (CodCurso,FechaInicio) REFERENCES Edicion(CodCurso,FechaInicio)}
);

CREATE TABLE Edicion(
    CodCurso INT,
    FechaInicio DATE,
    Lugar VARCHAR2(20),
    Horario VARCHAR2(20),
    Profesor VARCHAR2(20)
);

CREATE TABLE prerrequisito(
    CursoSolicitado VARCHAR2(20),
    CursoPrevio VARCHAR2(20),
    Obligatorio CHAR(1)
);

ALTER TABLE prerrequisito ADD(
    CONSTRAINT{PK_pre PRIMARY KEY (CursoSolicitado, CursoPrevio), 
                FOREIGN KEY FK1_pre (CursoSolicitado) REFERENCES Curso(CodCurso),
                FOREIGN KEY FK2_pre (CursoPrevio) REFERENCES Curso(CodCurso),
                CHECK(Obligatorio IN('S','N'))}
);

CREATE TABLE Curso(
    CodCurso INT,
    Nombre VARCHAR2(20),
    Duracion TIME,
    Coste NUMBER
);

ALTER TABLE Curso ADD(
    CONSTRAINT{PK_Cur PRIMARY KEY (CodCurso)}
);