select * from pedido 
inner join comercial
on pedido.id_comercial = comercial.id
order by comercial.nombre asc;
