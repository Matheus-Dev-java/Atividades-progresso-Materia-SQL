- metodo 1: entrada manual, especificando os valores com values

insert into produtos (id_produto, nome_produto, categoria, preco, estoque, marca)
values (1, 'notebook gamer', 'notebook', 4500.00, 10, 'dell');

insert into produtos (id_produto, nome_produto, categoria, preco, estoque, marca)
values (2, 'mouse sem fio', 'periferico', 80.00, 50, 'logitech');

insert into produtos (id_produto, nome_produto, categoria, preco, estoque, marca)
values (3, 'teclado mecanico', 'periferico', 250.00, 30, 'redragon');

insert into produtos (id_produto, nome_produto, categoria, preco, estoque, marca)
values (4, 'monitor 24 polegadas', 'monitor', 900.00, 15, 'lg');

insert into clientes (id_cliente, nome_cliente, email, telefone, cidade)
values (1, 'joao silva', 'joao@email.com', '71999990001', 'salvador');

insert into clientes (id_cliente, nome_cliente, email, telefone, cidade)
values (2, 'maria souza', 'maria@email.com', '71999990002', 'feira de santana');

insert into pedidos (id_pedido, id_cliente, data_pedido, status_pedido)
values (1, 1, '2026-08-10', 'concluido');

insert into pedidos (id_pedido, id_cliente, data_pedido, status_pedido)
values (2, 2, '2026-08-15', 'pendente');

insert into itens_pedido (id_item, id_pedido, id_produto, quantidade, preco_unitario)
values (1, 1, 1, 1, 4500.00);

insert into itens_pedido (id_item, id_pedido, id_produto, quantidade, preco_unitario)
values (2, 1, 2, 2, 80.00);

-- metodo 2: insert usando select, copiando dados de uma tabela para outra

-- tabela nova para guardar soh os produtos que estao em promocao
create table produtos_promocao (
  id_produto int,
  nome_produto varchar(100),
  preco decimal(10,2)
);

-- copiando para a tabela de promocao os produtos com preco abaixo de 300
insert into produtos_promocao (id_produto, nome_produto, preco)
select id_produto, nome_produto, preco
from produtos
where preco < 300;
