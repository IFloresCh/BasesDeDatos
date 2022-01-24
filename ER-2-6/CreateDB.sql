DROP DATABASE IF EXISTS ventas;
CREATE DATABASE ventas;
use ventas;

drop table if exists comercial;
create table comercial(
	id INT NOT NULL,
    nombre varchar(100) NOT NULL,
    apellido1 varchar(100),
    apellido2 varchar(100),
    ciudad varchar(100),
    comision float,
    primary key(id)
);

drop table if exists cliente;
create table cliente (
	id INT(10),
	nombre varchar(100),
    apellido1 varchar(100),
    apellido2 varchar(100),
    ciudad varchar(100),
    categoria INT(10),
    primary key(id)    
);

drop table if exists pedido;
create table pedido (
	id int NOT NULL,
    cantidad double not null,
    fecha date,
    id_cliente INT(10),
    id_comercial INT(10),
    primary key(id),
    foreign key (id_comercial) references comercial(id),
    foreign key (id_cliente) references cliente(id)
);
