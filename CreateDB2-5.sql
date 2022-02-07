DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;
create table fabricante(
	codigo INT NOT NULL,
	nombre VARCHAR(100),
    primary key(codigo)
);
create table producto(
	codigo INT not null,
	nombre VARCHAR(100),
	precio DOUBLE,
	codigo_fabricante INT,
	PRIMARY KEY(codigo),
	FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);