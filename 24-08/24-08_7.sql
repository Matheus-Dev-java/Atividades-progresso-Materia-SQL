
-- removendo um item especifico do pedido 1
delete from itens_pedido
where id_item = 2;

-- removendo produtos que estao com estoque zerado
delete from produtos
where estoque = 0;

-- removendo pedidos antigos que ja foram cancelados
delete from pedidos
where status_pedido = 'cancelado';
