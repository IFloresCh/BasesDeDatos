-- crear usuario admin
create user 'adminDB'@'localhost' identified by '';
-- otorgar permisos
grant all on *.* to 'adminDB'@'localhost' with grant option;

-- cambiar al usuario adminDB
sudo mysql -u adminDB -p;
-- crear Databases
create database facturacion_DCL;
create database RRHH_DCL;
-- crear admin de cada empresa
create user 'E1adminDB'@'localhost' identified by '';
create user 'E2adminDB'@'localhost' identified by '';
-- otorgar permisos a cada empresa
grant all on RRHH_DCL.* to 'E1adminDB'@'localhost';
grant all on facturacion_DCL.* to 'E2adminDB'@'localhost';

-- cambiar a empresa 1
sudo mysql -u E2adminDB -p;



--cambiar a Empresa 2
sudo mysql -u E2adminDB -p;
-- crear tables
use facturacion_DCL;
create table cliente (
id_cliente int not null primary key,
nombre varchar(40),
apellido varchar(40),
direccion varchar(100),
fecha_nacimiento date,
telefono int,
email varchar(50));


create table factura(
num_factura int not null primary key,
id_cliente int not null,
fecha date,
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente));

create table categoria (
id_categoria int not null primary key,
nombre varchar(50),
descripcion varchar(255));


create table producto(
id_producto int not null primary key,
nombre varchar(40),
precio int,
stock int,
id_categoria int,
foreign key (id_categoria) references categoria(id_categoria));

create table detalle(
num_detalle int not null,
id_factura int not null,
id_producto int not null,
cantidad int,
precio int,
primary key(num_detalle, id_factura),
foreign key (id_factura) references factura(num_factura),
foreign key (id_producto) references producto(id_producto));





