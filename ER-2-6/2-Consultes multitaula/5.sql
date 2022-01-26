select * from cliente
inner join pedido
on cliente.id = pedido.id_cliente
where pedido.fecha not like '2017%';
