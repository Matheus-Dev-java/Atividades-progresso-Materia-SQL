-- exercicio de aplicacao geral

-- exercicio 1: cadastrar um fornecedor novo, com chave primaria propria,
-- e ligar os produtos a ele atraves de uma chave estrangeira
create table fornecedores (
  id_fornecedor int primary key,
  razao_social varchar(150),
  cnpj varchar(18),
  telefone varchar(20)
);

alter table produtos
add id_fornecedor int,
add foreign key (id_fornecedor) references fornecedores(id_fornecedor);

insert into fornecedores (id_fornecedor, razao_social, cnpj, telefone)
values (1, 'techparts distribuidora ltda', '12.345.678/0001-90', '(11) 4000-1000');

update produtos
set id_fornecedor = 1
where id_produto = 1;

-- exercicio 2: listar todos os pedidos com o nome do cliente e o status,
-- inclusive os clientes que ainda nao fizeram nenhum pedido (left join)
select
  clientes.nome_cliente,
  pedidos.id_pedido,
  pedidos.status_pedido
from clientes
left join pedidos on clientes.id_cliente = pedidos.id_cliente;

-- exercicio 3: listar cada produto vendido junto com o nome do fornecedor
-- (join entre produtos e fornecedores atraves da fk criada no exercicio 1)
select
  produtos.nome_produto,
  fornecedores.razao_social
from produtos
inner join fornecedores on produtos.id_fornecedor = fornecedores.id_fornecedor;

-- exercicio 4: montar uma lista unica com nomes de clientes e de fornecedores
-- (operador set: union remove os duplicados)
select nome_cliente as nome from clientes
union
select razao_social as nome from fornecedores;

-- exercicio 5: mostrar o pedido completo (cliente + produtos + quantidade),
-- usando 3 joins encadeados (essa consulta so é possivel por causa das fks
-- criadas entre pedidos, clientes, itens_pedido e produtos)
select
  clientes.nome_cliente,
  pedidos.id_pedido,
  produtos.nome_produto,
  itens_pedido.quantidade
from pedidos
inner join clientes on pedidos.id_cliente = clientes.id_cliente
inner join itens_pedido on itens_pedido.id_pedido = pedidos.id_pedido
inner join produtos on produtos.id_produto = itens_pedido.id_produto
order by pedidos.id_pedido;

