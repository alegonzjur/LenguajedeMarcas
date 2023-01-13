CREATE TABLE monta(
    Modelo CHAR,
    NIF_N CHAR,
    FechaMontaje DATE,
    CONSTRAINT monta_PK PRIMARY KEY (Modelo,NIF_N,FechaMontaje),
);