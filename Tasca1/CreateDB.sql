CREATE DATABASE espana;
use espana;
CREATE TABLE COMUNITAT (
    Codi_comunitat INT NOT NULL,
    Nom_comunitat VARCHAR(50)NOT NULL,
    PRIMARY KEY (Codi_comunitat)
);
CREATE TABLE PROVINCIA (
    Codi_provincia INT NOT NULL,
    Nom_província VARCHAR(50)NOT NULL,
    p_comunitat INT NOT NULL ,
    PRIMARY KEY(Codi_provincia),
    FOREIGN KEY (p_comunitat) REFERENCES COMUNITAT(Codi_comunitat)
);
CREATE TABLE MUNICIPIS (
    Codi_municipi INT NOT NULL,
    Nom VARCHAR(50) NOT NULL,
    p_provincia INT NOT NULL,
    PRIMARY KEY(Codi_municipi),
    FOREIGN KEY (p_provincia) REFERENCES PROVINCIA(Codi_provincia)
);
CREATE TABLE EMPLEAT (
    Nom_E INT NOT NULL,
    DNI_E VARCHAR(25) NOT NULL,
    Nom VARCHAR(100),
    Telèfon VARCHAR(25),
    Salari INT,
    naci_municipio VARCHAR(10),
    PRIMARY KEY (DNI_E),
    FOREIGN KEY (naci_municipio) REFERENCES MUNICIPIS(Codi_municipi)

);

