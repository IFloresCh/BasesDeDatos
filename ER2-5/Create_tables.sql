create table fabricante(
	codigo INT NOT NULL,
	nombre VARCHAR(100),
    primary key(codigo)
);
create table producto(
	codigo INT,
	nombre VARCHAR(100),
	precio DOUBLE,
	codigo_fabricante INT,
	PRIMARY KEY(codigo),
	FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);
