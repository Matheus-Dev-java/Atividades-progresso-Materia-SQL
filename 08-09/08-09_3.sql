-- tema da aula: joins
-- objetivo: usar os relacionamentos criados no arquivo de chave estrangeira
-- (clientes -> pedidos -> itens_pedido <- produtos) para combinar as tabelas
-- horizontalmente.

-- inner join: so traz pedidos que tem cliente correspondente
select
  pedidos.id_pedido,
  clientes.nome_cliente,
  pedidos.data_pedido,
  pedidos.status_pedido
from pedidos
inner join clientes on pedidos.id_cliente = clientes.id_cliente;

-- left join: traz TODOS os clientes, mesmo os que nunca fizeram pedido
-- (nesse caso as colunas de pedido vem como null)
select
  clientes.nome_cliente,
  pedidos.id_pedido,
  pedidos.status_pedido
from clientes
left join pedidos on clientes.id_cliente = pedidos.id_cliente;

-- right join: traz TODOS os pedidos, mesmo que (hipoteticamente) o cliente
-- tenha sido removido da tabela clientes
select
  clientes.nome_cliente,
  pedidos.id_pedido,
  pedidos.status_pedido
from clientes
right join pedidos on clientes.id_cliente = pedidos.id_cliente;

-- full join: traz clientes sem pedido E pedidos sem cliente, tudo junto
-- obs: o mysql nao tem "full join" pronto, entao simulamos com union
-- (o union ja remove as linhas duplicadas que apareceriam nos dois lados)
select
  clientes.nome_cliente,
  pedidos.id_pedido,
  pedidos.status_pedido
from clientes
left join pedidos on clientes.id_cliente = pedidos.id_cliente

union

select
  clientes.nome_cliente,
  pedidos.id_pedido,
  pedidos.status_pedido
from clientes
right join pedidos on clientes.id_cliente = pedidos.id_cliente;

-- join com 3 tabelas: pedido + cliente + os produtos dentro do pedido
-- (aqui usamos itens_pedido como "ponte" entre pedidos e produtos)
select
  clientes.nome_cliente,
  pedidos.id_pedido,
  produtos.nome_produto,
  itens_pedido.quantidade,
  itens_pedido.preco_unitario
from pedidos
inner join clientes on pedidos.id_cliente = clientes.id_cliente
inner join itens_pedido on itens_pedido.id_pedido = pedidos.id_pedido
inner join produtos on produtos.id_produto = itens_pedido.id_produto;
