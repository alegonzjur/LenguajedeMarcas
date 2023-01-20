CREATE TABLE Cliente(
    CodCliente INTEGER,
    Nombre VARCHAR2(40),
    Calle VARCHAR2(40),
    Numero INTEGER,
    Comuna INTEGER,
    Ciudad VARCHAR2(40),
    CREATE INDEX Nombre
    ON Cliente(Nombre)
);

ALTER TABLE Cliente ADD(
    CONSTRAINT{PK_Cli PRIMARY KEY (CodCliente)}
);

CREATE INDEX CodCliente
ON Cliente (Nombre)
;

CREATE TABLE Venta(
    IdVenta INTEGER,
    MontoTotal INTEGER,
    CodCliente INTEGER,
    CREATE SEQUENCE IdVenta
    INCREMENT BY 1
    START WITH 1
);

ALTER TABLE Venta ADD(
    CONSTRAINT{PK_Ven PRIMARY KEY (IdVenta), FK_Ven FOREIGN KEY (CodCliente) REFERENCES Cliente(CodCliente)}
);

CREATE TABLE asocidado(
    CodCliente INTEGER,
    NumTelefono INTEGER
);

ALTER TABLE asociado ADD(
    CONSTRAINT{PK_aso PRIMARY KEY (CodCliente,NumTelefono), FK1_aso FOREIGN KEY (CodCliente) REFERENCES Cliente(CodCliente),
    FK2_aso FOREIGN KEY(NumTelefono) REFERENCES Telefono(NumTelefono)}
);

CREATE TABLE Telefono(
    Numero INTEGER
);

ALTER TABLE Telefono ADD(
    CONSTRAINT{PK_Tel PRIMARY KEY (Numero)}
);

CREATE TABLE incluye(
    IdVenta INTEGER,
    IdProducto INTEGER,
    Cantidad NUMBER,
    PrecioVenta NUMBER
);

ALTER TABLE incluye(
    ADD CONSTRAINT{PK_incl PRIMARY KEY (IdVenta,IdProducto),
    FK1_inc FOREIGN KEY(IdVenta) REFERENCES Venta(IdVenta),
    FK2_inc FOREIGN KEY(IdProducto) REFERENCES Producto(IdProducto)}
);

CREATE TABLE Producto(
    IdProducto INT,
    Nombre VARCHAR2,
    Precio NUMBER,
    Stock INT,
    IdCategoria INT,
    IdProveedor INT
);

ALTER TABLE Producto ADD(
    CONSTRAINT {PK_Prod PRIMARY KEY (IdProducto),
                FK_Prod FOREIGN KEY (IdCategoria) REFERENCES Categoria(IdCategoria),
                FK2_Prod FOREIGN KEY (CodProveedor) REFERENCES Proveedor(CodProveedor)}
);

CREATE Proveedor(
    CodProveedor INT,
    Nombre VARCHAR2(40),
    Direccion VARCHAR2(40),
    Telefono INT,
    Web VARCHAR2(200),
    
);
CREATE INDEX NomProv ON Proveedor(Nombre);

ALTER TABLE Proveedor ADD(
    CONSTRAINT{PK_prov PRIMARY KEY (CodProveedor)}
);

CREATE TABLE Categoria(
    IdCategoria INT,
    Nombre VARCHAR2(20),
    Descripcion VARCHAR2(40),
    
);
CREATE INDEX IndNom ON Categoria(Nombre);
ALTER TABLE Categoria ADD(
    CONSTRAINT{PK_Cat PRIMARY KEY (IdCategoria)}
);
