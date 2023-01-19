
CREATE TABLE Director(
    Nombre VARCHAR2(40),
    Nacionalidad VARCHAR2(40),
    CONSTRAINT {PK_Director PRIMARY KEY (Nombre)}
);

CREATE TABLE Pelicula(
    ID NUMBER,
    Titulo VARCHAR2(40),
    Productora VARCHAR2(40),
    Nacionalidad VARCHAR2(40),
    Fecha DATE,
    Director VARCHAR2(40),
    CONSTRAINT {PK_Pelicula PRIMARY KEY (ID)} ,
    CONSTRAINT {FK_Pelicula FOREIGN KEY (Nombre) REFERENCES Director(Nombre)},
    CONSTRAINT {TituloPelicula NOT NULL (Titulo)}
);

CREATE TABLE Ejemplar(
    ID_Peli NUMBER,
    Numero NUMBER,
    Estado VARCHAR2(40),
    CONSTRAINT {PK_Ejemplar PRIMARY KEY (ID_Peli,Numero)},
    CONSTRAINT {FK_Ejemplar FOREIGN KEY (ID_Peli) REFERENCES Pelicula(ID)}
);

CREATE actua(
    Actor VARCHAR2(40),
    ID_Peli VARCHAR2(40),
    Prota CHAR(1),
    CONSTRAINT {PK_actua PRIMARY KEY (Actor,ID_Peli)},
    CONSTRAINT {FK1_actua {FOREIGN KEY (Actor) REFERENCES Actores(Nombre)},
    CONSTRAINT {FK2_actua {FOREIGN KEY (ID_Peli) REFERENCES Pelicula(Titulo)}
    CONSTRAINT {Ch_prota {CHECK (Prota IN('Si','NO'))}
);

CREATE Actores(
    Nombre VARCHAR2(40),
    Nacionalidad VARCHAR2(40),
    Sexo CHAR(1),
    CONSTRAINT {PK_Actores PRIMARY KEY (Nombre)},
    CONSTRAINT {CHECK(Sexo IN('M','N'))}
);

CREATE Socio(
    DNI CHAR(9),
    Nombre VARCHAR2(40),
    Direccion VARCHAR2(40),
    Telefono NUMBER,
    Avalador VARCHAR2(40),
    CONSTRAINT {PK_Socio PRIMARY KEY (DNI)},
    CONSTRAINT {FK_Socio FOREIGN KEY (DNI) REFERENCES Socio(DNI)}
);

CREATE alquila(
    DNI CHAR(9),
    ID_Peli INTEGER,
    Numero INTEGER,
    FechaAlquiler DATE,
    FechaDevolucion DATE,
    CONSTRAINT {PK_alquila PRIMARY KEY (DNI, ID_Peli,Numero,FechaAlquiler)},
    CONSTRAINT {FK1_alquila FOREIGN KEY (DNI) REFERENCES Socio(DNI)},
    CONSTRAINT {FK2_alquilaPeli FOREIGN KEY (ID_Peli) REFERENCES Ejemplar(ID_Peli)},
    CONSTRAINT {FK2_alquilaNumero FOREIGN KEY (Numero) REFERENCES Ejemplar(Numero)},
    CONSTRAINT {CHECK FechaDevolucion > FechaAlquiler}
    
);