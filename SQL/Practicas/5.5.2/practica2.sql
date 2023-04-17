CREATE TABLE Actores(
    Nombre VARCHAR2(50) PRIMARY KEY,
    Nacionalidad VARCHAR2(50),
    Sexo CHAR(1)
);

CREATE TABLE Socio(
    DNI CHAR(9) PRIMARY KEY,
    Nombre VARCHAR2(50) NOT NULL,
    Direccion VARCHAR2(50),
    Telefono CHAR(9),
    Avalador CHAR(9)
);

CREATE TABLE Pelicula(
    ID CHAR(8),
    Titulo VARCHAR2(50) NOT NULL,
    Productora VARCHAR2(50),
    Nacionalidad VARCHAR2(50),
    Fecha DATE,
    Director VARCHAR2(50)
);

CREATE TABLE Director(
    Nombre VARCHAR2(50) PRIMARY KEY,
    Nacionalidad VARCHAR2(50)
);

CREATE TABLE Ejemplar(
    ID_Peli CHAR(8) PRIMARY KEY,
    Numero INTEGER,
    Estado VARCHAR2(50)
);

CREATE TABLE actua(
    Actor VARCHAR2(50),
    ID_Peli CHAR(8),
    Prota CHAR(1) DEFAULT NULL
);

CREATE TABLE alquila(
    DNI CHAR(9),
    ID_Peli CHAR(8),
    Numero INTEGER,
    FechaAlquiler DATE,
    FechaDevolucion DATE
);

ALTER TABLE Socio ADD(
    CONSTRAINT FK1_Socio FOREIGN KEY (Avalador) REFERENCES Socio(DNI)
);

ALTER TABLE Actores ADD(
    CONSTRAINT CH_act CHECK (Sexo IN ('H','M'))
);

ALTER TABLE Pelicula ADD(
    CONSTRAINT FK_pel FOREIGN KEY (Director) REFERENCES Director(Nombre)
);

ALTER TABLE Ejemplar ADD(
    CONSTRAINT PK_eje PRIMARY KEY (ID_Peli,Numero),
    CONSTRAINT FK_eje FOREIGN KEY (Id_Peli) REFERENCES Pelicula(ID)
);

ALTER TABLE actua ADD(
    CONSTRAINT PK_act PRIMARY KEY (Actor,ID_Peli),
    CONSTRAINT FK1_act FOREIGN KEY (Actor) REFERENCES Actores(Nombre),
    CONSTRAINT FK2_act FOREIGN KEY (ID_Peli) REFERENCES Pelicula(ID),
    CONSTRAINT CH_act CHECK (Prota IN ('S','N'))
);

ALTER TABLE alquila ADD(
    CONSTRAINT PK_alq PRIMARY KEY (DNI,ID_Peli,Numero,FechaAlquiler),
    CONSTRAINT FK1_alq FOREIGN KEY (DNI) REFERENCES Socio(DNI),
    CONSTRAINT FK2_alq FOREIGN KEY (ID_Peli,Numero) REFERENCES Ejemplar(ID_Peli,Numero),
    CONSTRAINT CH_alq CHECK (FechaDevolucion > FechaAlquiler)
);