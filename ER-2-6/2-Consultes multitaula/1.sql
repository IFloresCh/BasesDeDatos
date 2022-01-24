SELECT cliente.id, cliente.nombre, cliente.apellido1, cliente.apellido2
FROM cliente
INNER JOIN pedido
ON cliente.id = pedido.id_cliente
group by id;
