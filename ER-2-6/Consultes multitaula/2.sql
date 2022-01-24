SELECT *
FROM pedido
INNER JOIN cliente
ON cliente.id = pedido.id_cliente
order by cliente.nombre;
