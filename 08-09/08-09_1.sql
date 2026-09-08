-- recriando as tabelas principais ja com chave primaria (pk) e chave estrangeira (fk)

create table clientes (
  id_cliente int primary key,
  nome_cliente varchar(100),
  email varchar(100),
  telefone varchar(20),
  cidade varchar(50)
);

create table produtos (
  id_produto int primary key,
  nome_produto varchar(100),
  categoria varchar(50),
  preco decimal(10,2),
  estoque int,
  marca varchar(50),
  peso_kg decimal(5,2)
);

-- pedidos "aponta" para clientes atraves de id_cliente (fk)
create table pedidos (
  id_pedido int primary key,
  id_cliente int,
  data_pedido date,
  status_pedido varchar(30),
  foreign key (id_cliente) references clientes(id_cliente)
);

-- itens_pedido eh a tabela que "liga" pedidos com produtos (2 fks na mesma tabela)
create table itens_pedido (
  id_item int primary key,
  id_pedido int,
  id_produto int,
  quantidade int,
  preco_unitario decimal(10,2),
  foreign key (id_pedido) references pedidos(id_pedido),
  foreign key (id_produto) references produtos(id_produto)
);

-- exemplo de insercao valida (o cliente e o produto ja existem nas tabelas acima)
insert into clientes (id_cliente, nome_cliente, email, telefone, cidade)
values (1, 'joao silva', 'joao@email.com', '71999990001', 'salvador');

insert into produtos (id_produto, nome_produto, categoria, preco, estoque, marca, peso_kg)
values (1, 'notebook gamer', 'notebook', 4300.00, 8, 'dell', 2.50);

insert into pedidos (id_pedido, id_cliente, data_pedido, status_pedido)
values (1, 1, '2026-09-08', 'pendente');

