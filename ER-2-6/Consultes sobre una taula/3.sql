SELECT cliente.id
FROM cliente
INNER JOIN pedido
ON cliente.id = pedido.id_cliente
group by id;
