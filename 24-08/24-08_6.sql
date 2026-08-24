-- corrigindo o preco do mouse sem fio
update produtos
set preco = 75.00
where id_produto = 2;

-- atualizando estoque e preco do notebook gamer ao mesmo tempo
update produtos
set preco = 4300.00, estoque = 8
where id_produto = 1;

-- marcando o pedido 2 como concluido
update pedidos
set status_pedido = 'concluido'
where id_pedido = 2;

-- atualizando o telefone da cliente maria
update clientes
set telefone = '71988880002'
where id_cliente = 2;
