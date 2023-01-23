CREATE TABLE Cliente(
    CodCliente INTEGER,
    Nombre VARCHAR2(40),
    Calle VARCHAR2(40),
    Numero INTEGER,
    Comuna INTEGER,
    Ciudad VARCHAR2(40)
);

CREATE TABLE Venta(
    IdVenta INTEGER,
    MontoTotal INTEGER,
    CodCliente INTEGER
);
CREATE TABLE asociado(
    CodCliente INTEGER,
    NumTelefono INTEGER
);

CREATE TABLE Telefono(
    Numero INTEGER
);
CREATE TABLE incluye(
    IdVenta INTEGER,
    IdProducto INTEGER,
    Cantidad NUMBER,
    PrecioVenta NUMBER
);
CREATE TABLE Producto(
    IdProducto INT,
    Nombre VARCHAR2(40),
    Precio NUMBER,
    Stock INT,
    IdCategoria INT,
    IdProveedor INT
);
CREATE TABLE Proveedor(
    CodProveedor INT,
    Nombre VARCHAR2(40),
    Direccion VARCHAR2(40),
    Telefono INT,
    Web VARCHAR2(200)
);
CREATE TABLE Categoria(
    IdCategoria INT,
    Nombre VARCHAR2(20),
    Descripcion VARCHAR2(40)
);

ALTER TABLE Cliente ADD(
    CONSTRAINT PK_Cli PRIMARY KEY (CodCliente)
);

ALTER TABLE Venta ADD(
    CONSTRAINT PK_Ven PRIMARY KEY (IdVenta), 
    CONSTRAINT FK_Ven FOREIGN KEY (CodCliente) REFERENCES Cliente(CodCliente)
);

ALTER TABLE asociado ADD(
    CONSTRAINT PK_aso PRIMARY KEY (CodCliente,NumTelefono), 
    CONSTRAINT FK1_aso FOREIGN KEY (CodCliente) REFERENCES Cliente(CodCliente),
    CONSTRAINT FK2_aso FOREIGN KEY(NumTelefono) REFERENCES Telefono(Numero)
);

ALTER TABLE Telefono ADD(
    CONSTRAINT PK_Tel PRIMARY KEY (Numero)
);
ALTER TABLE incluye ADD(
    CONSTRAINT PK_incl PRIMARY KEY (IdVenta,IdProducto),
    CONSTRAINT FK1_inc FOREIGN KEY(IdVenta) REFERENCES Venta(IdVenta),
    CONSTRAINT FK2_inc FOREIGN KEY(IdProducto) REFERENCES Producto(IdProducto)
);
ALTER TABLE Producto ADD(
    CONSTRAINT PK_Prod PRIMARY KEY (IdProducto),
    CONSTRAINT FK_Prod FOREIGN KEY (IdCategoria) REFERENCES Categoria(IdCategoria),
    CONSTRAINT FK2_Prod FOREIGN KEY (CodProveedor) REFERENCES Proveedor(CodProveedor)
);
ALTER TABLE Proveedor ADD(
    CONSTRAINT PK_prov PRIMARY KEY (CodProveedor)
);
ALTER TABLE Categoria ADD(
    CONSTRAINT PK_Cat PRIMARY KEY (IdCategoria)
);
CREATE INDEX Nombre
    ON Cliente(Nombre);

CREATE SEQUENCE IdVenta
INCREMENT BY 1
START WITH 1
NOMAXVALUE
;

CREATE INDEX NomProv ON Proveedor(Nombre);

CREATE INDEX IndNom ON Categoria(Nombre); 