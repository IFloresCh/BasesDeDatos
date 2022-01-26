select * from cliente
inner join pedido 
on cliente.id = pedido.id_cliente
inner join comercial
on pedido.id_comercial = comercial.id;
